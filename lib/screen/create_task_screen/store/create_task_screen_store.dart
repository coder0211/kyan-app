import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:kyan/manager/manager_address.dart';
import 'package:kyan/manager/manager_key_storage.dart';
import 'package:kyan/models/account.dart';
import 'package:kyan/models/task.dart';
import 'package:kyan/screen/login_screen/store/login_screen_store.dart';
import 'package:kyan/screen/tasks_screen/store/tasks_screen_store.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';

part 'create_task_screen_store.g.dart';

class CreateTaskScreenStore = _CreateTaskScreenStore
    with _$CreateTaskScreenStore;

abstract class _CreateTaskScreenStore with Store, BaseStoreMixin {
  @observable
  List<DateTime> blackoutDates = [];
  @observable
  DateRangePickerController dateRangePickerController =
      DateRangePickerController();
  @observable
  DateRangePickerView dateRangePickerView = DateRangePickerView.month;
  @observable
  DateTime startDate = DateTime.now();
  @observable
  DateTime endDate = DateTime.now();
  @observable
  String? dueTime;
  @observable
  TextEditingController summaryEditController = TextEditingController();
  @observable
  TextEditingController descriptionEditController = TextEditingController();
  @observable
  late Account account = Account();

  @observable
  bool _isShowLoading = false;

  bool get isShowLoading => _isShowLoading;

  set isShowLoading(bool isShowLoading) {
    _isShowLoading = isShowLoading;
  }

  @observable
  int _isDone = 0;
  int get isDone => _isDone;

  set isDone(int isDone) {
    _isDone = isDone;
  }

  @observable
  int workspaceId = 0;

  @observable
  bool _isWithWorkspace = false;
  bool get isWithWorkspace => _isWithWorkspace;

  set isWithWorkspace(bool isWithWorkspace) {
    _isWithWorkspace = isWithWorkspace;
  }

  @observable
  int _indexYourAccount = -1;

  int get indexYourAccount => _indexYourAccount;

  set indexYourAccount(int indexYourAccount) {
    _indexYourAccount = indexYourAccount;
  }

  @observable
  Account _selectedAccount = Account();

  Account get selectedAccount => _selectedAccount;

  set selectedAccount(Account selectedAccount) {
    _selectedAccount = selectedAccount;
  }

  @observable
  bool _isActiveButton = false;
  bool get isActiveButton => _isActiveButton;

  set isActiveButton(bool isActiveButton) {
    _isActiveButton = isActiveButton;
  }

  BaseAPI _baseAPI = BaseAPI();
  @observable
  ObservableList<Task> _tasks = ObservableList<Task>();

  ObservableList<Task> get tasks => _tasks;

  set tasks(ObservableList<Task> tasks) {
    _tasks = tasks;
  }

  @observable
  int idWorkspace = 0;

  late LoginScreenStore _loginScreenStore;
  late TasksScreenStore _tasksScreenStore;
  @override
  void onInit(BuildContext context) {
    _loginScreenStore = context.read<LoginScreenStore>();
    _tasksScreenStore = context.read<TasksScreenStore>();
  }

  @override
  void onDispose(BuildContext context) {}

  @override
  Future<void> onWidgetBuildDone(BuildContext context) async {}

  @action
  String convertDateRMTime(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }

  @action
  String convertYMDTime(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }

  @action
  void getDueTime(BuildContext context) {
    String _startDate = convertDateRMTime(startDate);
    String _endDate = convertDateRMTime(endDate);
    dueTime = _startDate +
        (_endDate != _startDate ? (' - ' + _endDate.toString()) : '');
    BaseNavigation.pop(context);
  }

  @action
  void setDataTask({required Task task}) {
    summaryEditController.text = task.taskSummary ?? '';
    isActiveButton = summaryEditController.text != '';
    descriptionEditController.text = task.taskDescription ?? '';
    startDate = DateFormat('yyyy-MM-dd')
        .parse(task.taskDueTimeGTE.toString().split('T')[0]);
    endDate = DateFormat('yyyy-MM-dd')
        .parse(task.taskDueTimeLTE.toString().split('T')[0]);
    String _startDate = convertDateRMTime(startDate);
    String _endDate = convertDateRMTime(endDate);
    dueTime = _startDate +
        (_endDate != _startDate ? (' - ' + _endDate.toString()) : '');
    isDone = task.taskIsDone ?? 0;
    isWithWorkspace = task.taskWorkspaceId == 0 ? false : true;
  }

  @action
  Future<void> onPressCreateUpdateTask(BuildContext context, {int? id}) async {
    if (await BaseSharedPreferences.containKey(
        ManagerKeyStorage.currentWorkspace)) {
      workspaceId = int.tryParse(await BaseSharedPreferences.getStringValue(
              ManagerKeyStorage.currentWorkspace)) ??
          0;
    }
    Map<String, dynamic> headers = {
      'Authorization': _tasksScreenStore.accessToken
    };
    Map<String, dynamic> body = {
      'taskCreateBy': _loginScreenStore.currentAccount.accountId,
      'taskSummary': summaryEditController.text,
      'taskDescription': descriptionEditController.text,
      'taskDueTimeGTE': endDate.toString(),
      'taskDueTimeLTE': startDate.toString(),
      'taskIsDone': isDone,
      'taskCreateAt': DateTime.now().toString(),
      'taskWorkspaceId': workspaceId,
      'taskAssignTo': _loginScreenStore.currentAccount.accountId,
    };

    if (id != null) {
      body['taskId'] = id;
    }
    await _baseAPI
        .fetchData(ManagerAddress.taskCreateOrUpdate,
            headers: headers, body: body, method: ApiMethod.POST)
        .then((value) {
      switch (value.apiStatus) {
        case ApiStatus.SUCCEEDED:
          {
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

  Future<void> getListTaskInCreateUpdateTask() async {
    isShowLoading = true;
    _tasksScreenStore.getListTask();
  }

  @override
  void resetValue() {
    blackoutDates = [];
    dateRangePickerView = DateRangePickerView.month;
    startDate = DateTime.now();
    endDate = DateTime.now();
    dueTime;
    isDone = 0;
    isShowLoading = false;
    isActiveButton = false;
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
