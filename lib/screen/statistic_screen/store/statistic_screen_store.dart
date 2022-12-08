import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:kyan/manager/manager_address.dart';
import 'package:kyan/manager/manager_key_storage.dart';
import 'package:kyan/models/task.dart';
import 'package:kyan/screen/login_screen/store/login_screen_store.dart';
import 'package:kyan/screen/main_screen/store/main_screen_store.dart';
import 'package:mobx/mobx.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

part 'statistic_screen_store.g.dart';

class StatisticScreenStore = _StatisticScreenStore with _$StatisticScreenStore;

abstract class _StatisticScreenStore with Store, BaseStoreMixin {
  late MainScreenStore mainScreenStore;
  late LoginScreenStore loginScreenStore;
  late int? totalTaskCount;
  BaseAPI _baseAPI = new BaseAPI();
  @observable
  ObservableList<Task> tasks = new ObservableList<Task>();
  @observable
  ObservableList<Task> tasksDone = new ObservableList<Task>();
  @observable
  ObservableList<Task> tasksPending = new ObservableList<Task>();

  @observable
  bool _taskIsDone = true;

  bool get taskIsDone => _taskIsDone;

  set taskIsDone(bool taskIsDone) {
    _taskIsDone = taskIsDone;
  }

  @observable
  int _currentWorkspaceId = -1;

  int get currentWorkspaceId => _currentWorkspaceId;

  set currentWorkspaceId(int currentWorkspaceId) {
    _currentWorkspaceId = currentWorkspaceId;
  }

  @observable
  DateTime _selectedStartDate = DateTime.now();

  DateTime get selectedStartDate => _selectedStartDate;

  set selectedStartDate(DateTime selectedStartDate) {
    _selectedStartDate = selectedStartDate;
  }

  @observable
  DateTime _selectedDueDate = DateTime.now();

  DateTime get selectedDueDate => _selectedDueDate;

  set selectedDueDate(DateTime selectedDueDate) {
    _selectedDueDate = selectedDueDate;
  }

  @override
  void onInit(BuildContext context) {
    mainScreenStore = context.read<MainScreenStore>();
    loginScreenStore = context.read<LoginScreenStore>();
    tasksDone = new ObservableList<Task>();
    tasksPending = new ObservableList<Task>();
  }

  @override
  void onDispose(BuildContext context) {}

  @override
  Future<void> onWidgetBuildDone(BuildContext context) async {
    selectedStartDate = DateTime.now();
    selectedDueDate = DateTime.now();
    await _getWorkspaceId();
    await getPersonalStatistic();
  }

  @override
  void resetValue() {}
  Future<void> _getWorkspaceId() async {
    if (await BaseSharedPreferences.containKey(
        ManagerKeyStorage.currentWorkspace)) {
      currentWorkspaceId = int.tryParse(
              await BaseSharedPreferences.getStringValue(
                  ManagerKeyStorage.currentWorkspace)) ??
          -1;
    }
  }

  @action
  String convertTimeTask(Task task) {
    DateTime g = DateFormat('yyyy-MM-dd')
        .parse(task.taskDueTimeGTE.toString().split('T')[0]);
    DateTime l = DateFormat('yyyy-MM-dd')
        .parse(task.taskDueTimeLTE.toString().split('T')[0]);
    return DateFormat('dd/MM/yyyy').format(g) +
        (g != l ? (' - ' + DateFormat('dd/MM/yyyy').format(l)) : '');
  }

  @action
  Future<void> getPersonalStatistic() async {
    tasks.clear();
    tasksDone.clear();
    tasksPending.clear();
    Map<String, dynamic> headers = {
      'Authorization': mainScreenStore.accessToken,
    };
    Map<String, dynamic> params = {
      'accountId': loginScreenStore.currentAccount.accountId,
      'startMonth': selectedStartDate.month,
      'startYear': selectedStartDate.year,
      'dueMonth': selectedDueDate.month,
      'dueYear': selectedDueDate.year,
    };

    await _baseAPI
        .fetchData(ManagerAddress.taskGetAllByMonthYear,
            method: ApiMethod.GET, headers: headers, params: params)
        .then((value) {
      switch (value.apiStatus) {
        case ApiStatus.SUCCEEDED:
          printLogSusscess('SUCCEEDED');
          // Handle success response here
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
            getPersonalStatistic();
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
