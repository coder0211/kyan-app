import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:kyan/manager/manager_address.dart';
import 'package:kyan/manager/manager_key_storage.dart';
import 'package:kyan/models/task.dart';
import 'package:kyan/screen/login_screen/store/login_screen_store.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

part 'tasks_screen_store.g.dart';

class TasksScreenStore = _TasksScreenStore with _$TasksScreenStore;

abstract class _TasksScreenStore with Store, BaseStoreMixin {
  //? --      Variables      -->
  BaseAPI _baseAPI = BaseAPI();

  @observable
  ObservableList<Task> _tasks = ObservableList<Task>();
  ObservableList<Task> get tasks => _tasks;

  set tasks(ObservableList<Task> tasks) {
    _tasks = tasks;
  }

  late LoginScreenStore _loginScreenStore;

  @observable
  String _localeKey = 'en';

  String get localeKey => _localeKey;
  set localeKey(String localeKey) {
    _localeKey = localeKey;
  }

  @observable
  bool _isShowLoading = false;

  bool get isShowLoading => _isShowLoading;

  set isShowLoading(bool isShowLoading) {
    _isShowLoading = isShowLoading;
  }

  @observable
  String _accountUrlPhoto = '';

  String get accountUrlPhoto => _accountUrlPhoto;

  set accountUrlPhoto(String accountUrlPhoto) {
    _accountUrlPhoto = accountUrlPhoto;
  }

  @observable
  String _accountDisplayName = '';

  String get accountDisplayName => _accountDisplayName;

  set accountDisplayName(String accountDisplayName) {
    _accountDisplayName = accountDisplayName;
  }

  late String accessToken;

  @observable
  int _countTaskDone = 0;

  int get countTaskDone => _countTaskDone;

  set countTaskDone(int countTaskDone) {
    _countTaskDone = countTaskDone;
  }

  @observable
  int _workspaceId = -1;

  int get workspaceId => _workspaceId;

  set workspaceId(int workspaceId) {
    _workspaceId = workspaceId;
  }

  @observable
  DateTime _selectedDate = DateTime.now();

  DateTime get selectedDate => _selectedDate;

  set selectedDate(DateTime selectedDate) {
    _selectedDate = selectedDate;
  }
  //? --      Funtions      -->

  @override
  void onInit(BuildContext context) {
    _loginScreenStore = context.read<LoginScreenStore>();
    accountUrlPhoto = _loginScreenStore.currentAccount.accountUrlPhoto ?? '';
    accountDisplayName =
        _loginScreenStore.currentAccount.accountDisplayName ?? '';
  }

  @override
  Future<void> onWidgetBuildDone(BuildContext context) async {
    if (await BaseSharedPreferences.containKey(
        ManagerKeyStorage.currentWorkspace)) {
      workspaceId = int.tryParse(await BaseSharedPreferences.getStringValue(
              ManagerKeyStorage.currentWorkspace)) ??
          -1;
    }
    selectedDate = DateTime.now();
    await _getLanguage(context);
    await getListTask();
  }

  @override
  void resetValue() {}
  @override
  void onDispose(BuildContext context) {}

  @action
  String convertTimeTask(Task task) {
    DateTime g = DateTime.parse(task.taskDueTimeGTE.toString());
    DateTime l = DateTime.parse(task.taskDueTimeLTE.toString());
    return DateFormat('dd/MM/yyyy').format(g) +
        (g != l ? (' - ' + DateFormat('dd/MM/yyyy').format(l)) : '');
  }

  @action
  Future<void> getListTask() async {
    countTaskDone = 0;
    if (await BaseSharedPreferences.containKey(ManagerKeyStorage.accessToken)) {
      accessToken = await BaseSharedPreferences.getStringValue(
          ManagerKeyStorage.accessToken);
    }
    Map<String, dynamic> headers = {'Authorization': accessToken};
    Map<String, dynamic> params = {
      'accountId': _loginScreenStore.currentAccount.accountId,
      'day': selectedDate.toString(),
      //'workSpaceId': workspaceId,
    };

    isShowLoading = true;
    await _baseAPI
        .fetchData(ManagerAddress.taskGetAllByDay,
            headers: headers, params: params)
        .then((value) {
      switch (value.apiStatus) {
        case ApiStatus.SUCCEEDED:
          {
            printLogSusscess('SUCCEEDED');
            tasks.clear();
            value.object.forEach((it) {
              tasks.add(Task.fromJson(it));
              if (tasks.elementAt(tasks.length - 1).taskIsDone == 1) {
                countTaskDone++;
              }
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

  Future<void> _getLanguage(BuildContext context) async {
    if (await BaseSharedPreferences.containKey(ManagerKeyStorage.language)) {
      localeKey = await BaseSharedPreferences.getStringValue(
          ManagerKeyStorage.language);
    } else {
      localeKey = 'en';
    }
  }

  @action
  Future<void> onPressedComplete(BuildContext context,
      {required Task task}) async {
    Map<String, dynamic> headers = {'Authorization': accessToken};
    task.taskIsDone = task.taskIsDone == 1 ? 0 : 1;
    await _baseAPI
        .fetchData(ManagerAddress.taskCreateOrUpdate,
            headers: headers, body: task.toJson(), method: ApiMethod.POST)
        .then((value) {
      switch (value.apiStatus) {
        case ApiStatus.SUCCEEDED:
          {
            getListTask();
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
