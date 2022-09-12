import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:kyan/models/account.dart';
import 'package:kyan/models/workspace.dart';
import 'package:mobx/mobx.dart';
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
  bool _isShowLoading = false;

  bool get isShowLoading => _isShowLoading;

  set isShowLoading(bool isShowLoading) {
    _isShowLoading = isShowLoading;
  }

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

  @observable
  Workspace _workspace = Workspace(workspaceId: 1);
  Workspace get workspace => _workspace;

  set workspace(Workspace workspace) {
    _workspace = workspace;
  }

  @override
  void onInit(BuildContext context) {}

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

  @override
  void resetValue() {
    blackoutDates = [];
    dateRangePickerView = DateRangePickerView.month;
    isShowLoading = false;
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
