import 'dart:io';

import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:kyan/manager/manager_address.dart';
import 'package:kyan/manager/manager_key_storage.dart';
import 'package:kyan/models/account.dart';
import 'package:kyan/models/attachment_task.dart';
import 'package:kyan/models/result_up_file.dart';
import 'package:kyan/models/task.dart';
import 'package:kyan/models/workspace.dart';
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
  Workspace workspace = Workspace();

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
  Account? _selectedAccount = Account();

  Account? get selectedAccount => _selectedAccount;

  set selectedAccount(Account? selectedAccount) {
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
  Task task = Task();

  late LoginScreenStore _loginScreenStore;
  late TasksScreenStore _tasksScreenStore;

  @observable
  File? file;

  @observable
  ResultUpFile resultUpFile = ResultUpFile();

  @override
  void onInit(BuildContext context) {
    file = File('');
    _loginScreenStore = context.read<LoginScreenStore>();
    _tasksScreenStore = context.read<TasksScreenStore>();
    selectedAccount = _loginScreenStore.currentAccount;
  }

  @override
  void onDispose(BuildContext context) {
    isShowLoading = true;
    _tasksScreenStore.getListTask();
  }

  @override
  Future<void> onWidgetBuildDone(BuildContext context) async {
    task = BaseNavigation.getArgs(context, key: 'task');
    setDataTask(task: task);
    if (await BaseSharedPreferences.containKey(
        ManagerKeyStorage.currentWorkspace)) {
      workspaceId = int.tryParse(await BaseSharedPreferences.getStringValue(
              ManagerKeyStorage.currentWorkspace)) ??
          0;
    }
    await getAttachmentByTaskId();
    await getWorkspaceById();
  }

  @action
  String convertDateRMTime(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }

  @action
  String convertYMDTime(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }

  @action
  void getStartEndDueTime() {
    startDate =
        dateRangePickerController.selectedRange?.startDate ?? DateTime.now();
    endDate =
        dateRangePickerController.selectedRange?.endDate ?? DateTime.now();
  }

  @action
  void getDueTime(BuildContext context) {
    getStartEndDueTime();
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
    startDate = task.taskDueTimeGTE ?? DateTime.now();
    endDate = task.taskDueTimeLTE ?? DateTime.now();
    String _startDate = convertDateRMTime(startDate);
    String _endDate = convertDateRMTime(endDate);
    dueTime = _startDate +
        (_endDate != _startDate ? (' - ' + _endDate.toString()) : '');
    isDone = task.taskIsDone ?? 0;
    isWithWorkspace = task.taskWorkspaceId == 0 ? false : true;
  }

  @action
  Future<void> onPressCreateUpdateTask(BuildContext context, {int? id}) async {
    Map<String, dynamic> headers = {
      'Authorization': _tasksScreenStore.accessToken
    };
    Map<String, dynamic> body = {
      'taskCreateBy': _loginScreenStore.currentAccount.accountId,
      'taskSummary': summaryEditController.text,
      'taskDescription': descriptionEditController.text,
      'taskDueTimeGTE': startDate.toString(),
      'taskDueTimeLTE': endDate.toString(),
      'taskIsDone': isDone,
      'taskCreateAt': DateTime.now().toString(),
      'taskWorkspaceId': workspace.workspaceId,
      'taskAssignTo': selectedAccount?.accountId ??
          _loginScreenStore.currentAccount.accountId,
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

  @action
  Future<void> getWorkspaceById() async {
    Map<String, dynamic> headers = {
      'Authorization': _tasksScreenStore.accessToken
    };
    Map<String, dynamic> params = {'id': workspaceId};

    await _baseAPI
        .fetchData(ManagerAddress.workspacesGetOne,
            headers: headers, method: ApiMethod.GET, params: params)
        .then((value) {
      switch (value.apiStatus) {
        case ApiStatus.SUCCEEDED:
          {
            workspace = Workspace.fromJson(value.object);
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

  Future<void> uploadFile(File) async {
    Map<String, dynamic> headers = {
      'Authorization': _tasksScreenStore.accessToken
    };
    await _baseAPI
        .fileUpload(ManagerAddress.uploadSingleFile,
            file: file ?? File(), method: ApiMethod.POST, headers: headers)
        .then((value) async {
      switch (value.apiStatus) {
        case ApiStatus.SUCCEEDED:
          {
            resultUpFile = ResultUpFile.fromJson(value.object);
            await addFile(
                ManagerAddress.domain + '/' + resultUpFile.fileName.toString());
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

  Future<void> addFile(String url) async {
    Map<String, dynamic> headers = {
      'Authorization': _tasksScreenStore.accessToken
    };
    Map<String, dynamic> body = {'taskId': task.taskId, 'attachmentUrl': url};
    await _baseAPI
        .fetchData(ManagerAddress.addFileAttachmentTask,
            method: ApiMethod.POST, body: body, headers: headers)
        .then((value) async {
      switch (value.apiStatus) {
        case ApiStatus.SUCCEEDED:
          {
            await getAttachmentByTaskId();
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

  Future<void> getAttachmentByTaskId() async {
    Map<String, dynamic> headers = {
      'Authorization': _tasksScreenStore.accessToken
    };
    Map<String, dynamic> params = {'taskId': task.taskId};
    await _baseAPI
        .fetchData(ManagerAddress.getAttachmentByTaskId,
            method: ApiMethod.GET, params: params, headers: headers)
        .then((value) {
      switch (value.apiStatus) {
        case ApiStatus.SUCCEEDED:
          {
            Task temp = task;
            temp.attachments = [];
            value.object.forEach((e) {
              temp.attachments?.add(AttachmentTask.fromJson(e));
            });
            task = temp;
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

  Future<void> deleteItemAttachment(int id) async {
    Map<String, dynamic> headers = {
      'Authorization': _tasksScreenStore.accessToken
    };
    Map<String, dynamic> body = {
      'attachmentId': id,
    };
    await _baseAPI
        .fetchData(ManagerAddress.deleteAttachmentTask,
            method: ApiMethod.DELETE, body: body, headers: headers)
        .then((value) async {
      switch (value.apiStatus) {
        case ApiStatus.SUCCEEDED:
          {
            await getAttachmentByTaskId();
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
