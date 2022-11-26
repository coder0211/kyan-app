import 'dart:convert';

import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:kyan/manager/manager_address.dart';
import 'package:kyan/models/account.dart';
import 'package:kyan/models/task.dart';
import 'package:kyan/models/workspace.dart';
import 'package:kyan/screen/main_screen/store/main_screen_store.dart';
import 'package:kyan/screen/tasks_screen/store/tasks_screen_store.dart';
import 'package:intl/intl.dart';
import 'package:kyan/manager/manager_key_storage.dart';
import 'package:kyan/utils/utils.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
part 'team_tasks_screen_store.g.dart';

class TeamTasksScreenStore = _TeamTasksScreenStore with _$TeamTasksScreenStore;

abstract class _TeamTasksScreenStore with Store, BaseStoreMixin {
  late MainScreenStore mainScreenStore;
  late TasksScreenStore tasksScreenStore;

  late BaseAPI _baseAPI = BaseAPI();
  @observable
  bool isShowLoading = true;
  @observable
  ObservableList<Task> tasks = new ObservableList<Task>();
  @observable
  ObservableList<Task> tasksPending = ObservableList<Task>();
  @observable
  ObservableList<Task> tasksDone = ObservableList<Task>();
  @observable
  ObservableList<Account> members = ObservableList<Account>();

  @observable
  Workspace _workspace = Workspace();

  Workspace get workspace => _workspace;

  set workspace(Workspace workspace) {
    _workspace = workspace;
  }

  @observable
  Account _selectedAccount = Account();

  Account get selectedAccount => _selectedAccount;

  set selectedAccount(Account selectedAccount) {
    _selectedAccount = selectedAccount;
  }

  @observable
  int _currentWorkspaceId = -1;

  int get currentWorkspaceId => _currentWorkspaceId;

  set currentWorkspaceId(int currentWorkspaceId) {
    _currentWorkspaceId = currentWorkspaceId;
  }

  @override
  void onInit(BuildContext context) {
    mainScreenStore = context.read<MainScreenStore>();
    tasksScreenStore = context.read<TasksScreenStore>();
  }

  @override
  void onDispose(BuildContext context) {
    resetValue();
  }

  @override
  Future<void> onWidgetBuildDone(BuildContext context) async {
    if (await BaseSharedPreferences.containKey(
        ManagerKeyStorage.currentWorkspace)) {
      currentWorkspaceId = int.tryParse(
              await BaseSharedPreferences.getStringValue(
                  ManagerKeyStorage.currentWorkspace)) ??
          -1;
    }
    var temp = await Utils.getCurrentWorkSpace();
    if (temp != null) {
      var value = json.decode(temp);
      workspace = Workspace.fromJson(value);
    }
    await getMembersWorkspace();
    await getTasks();
  }

  @override
  void resetValue() {
    tasksDone.clear();
    tasksPending.clear();
    members.clear();
  }

  @action
  Future<void> getTasks({Account? account}) async {
    Map<String, dynamic> headers = {
      'Authorization': mainScreenStore.accessToken,
    };
    Map<String, dynamic> params = {
      'workSpaceId': currentWorkspaceId,
      'taskAssignTo': account?.accountId,
    };
    isShowLoading = true;
    await _baseAPI
        .fetchData(ManagerAddress.totalTaskInWorkspaceByAccountId,
            method: ApiMethod.GET, headers: headers, params: params)
        .then((value) {
      switch (value.apiStatus) {
        case ApiStatus.SUCCEEDED:
          {
            printLogSusscess('SUCCEEDED');
            tasks.clear();
            value.object.forEach((element) {
              tasks.add(Task.fromJson(element));
            });
            tasks.forEach((element) {
              element.taskIsDone == 1
                  ? tasksDone.add(element)
                  : tasksPending.add(element);
            });
            break;
          }
        case ApiStatus.INTERNET_UNAVAILABLE:
          printLogYellow('INTERNET_UNAVAILABLE');
          BaseUtils.showToast('INTERNET UNAVAILABLE', bgColor: Colors.red);
          break;
        default:
          printLogError('FAILED');
          // Handle failed response here
          break;
      }
    });
    isShowLoading = false;
  }

  @action
  Future<void> onPressedComplete(BuildContext context,
      {required Task task}) async {
    Map<String, dynamic> headers = {
      'Authorization': mainScreenStore.accessToken
    };
    task.taskIsDone = task.taskIsDone == 1 ? 0 : 1;
    await _baseAPI
        .fetchData(ManagerAddress.taskCreateOrUpdate,
            headers: headers, body: task.toJson(), method: ApiMethod.POST)
        .then((value) {
      switch (value.apiStatus) {
        case ApiStatus.SUCCEEDED:
          {
            getTasks();
            break;
          }
        case ApiStatus.INTERNET_UNAVAILABLE:
          printLogYellow('INTERNET_UNAVAILABLE');
          BaseUtils.showToast('INTERNET UNAVAILABLE', bgColor: Colors.red);
          break;
        default:
          printLogError('FAILED');
          // Handle failed response here
          break;
      }
    });
  }

  @action
  Future<void> getMembersWorkspace() async {
    Map<String, dynamic> headers = {
      'Authorization': mainScreenStore.accessToken
    };
    Map<String, dynamic> params = {
      'id': currentWorkspaceId,
    };
    isShowLoading = true;
    await _baseAPI
        .fetchData(ManagerAddress.workspacesGetOne,
            method: ApiMethod.GET, headers: headers, params: params)
        .then((value) {
      switch (value.apiStatus) {
        case ApiStatus.SUCCEEDED:
          {
            printLogSusscess('SUCCEEDED');
            workspace = Workspace.fromJson(value.object);
            members.clear();
            members.addAll(workspace.members ?? []);
            break;
          }
        case ApiStatus.INTERNET_UNAVAILABLE:
          printLogYellow('INTERNET_UNAVAILABLE');
          BaseUtils.showToast('INTERNET UNAVAILABLE', bgColor: Colors.red);
          break;
        default:
          printLogError('FAILED');
          // Handle failed response here
          break;
      }
    });
    isShowLoading = false;
  }

  @action
  String convertTimeTask(Task task) {
    DateTime g = DateTime.parse(task.taskDueTimeGTE.toString());
    DateTime l = DateTime.parse(task.taskDueTimeLTE.toString());
    return DateFormat('dd/MM/yyyy').format(g) +
        (g != l ? (' - ' + DateFormat('dd/MM/yyyy').format(l)) : '');
  }

  String getAvatarUrl(String mail) {
    String url = '';
    workspace.members!.forEach((e) {
      if (e.accountMail == mail) {
        url = e.accountUrlPhoto ?? '';
      }
    });
    return url;
  }
  //... Some values and actions
}
/// We are using auto code generation to generate code for MobX store.
/// If we see any error with .g.dart file, try to run below command.
/// The 3rd command is recommended.
///
/// 1. Build (generate .g.dart):
///    flutter packages pub run build_runner build
/// 2. Build and Watch (update .g.dart automatically):
///    flutter packages pub run build_runner watch
/// 3. Clean before updating:
///    flutter packages pub run build_runner watch --delete-conflicting-outputs
