// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_task_screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CreateTaskScreenStore on _CreateTaskScreenStore, Store {
  late final _$blackoutDatesAtom =
      Atom(name: '_CreateTaskScreenStore.blackoutDates', context: context);

  @override
  List<DateTime> get blackoutDates {
    _$blackoutDatesAtom.reportRead();
    return super.blackoutDates;
  }

  @override
  set blackoutDates(List<DateTime> value) {
    _$blackoutDatesAtom.reportWrite(value, super.blackoutDates, () {
      super.blackoutDates = value;
    });
  }

  late final _$dateRangePickerControllerAtom = Atom(
      name: '_CreateTaskScreenStore.dateRangePickerController',
      context: context);

  @override
  DateRangePickerController get dateRangePickerController {
    _$dateRangePickerControllerAtom.reportRead();
    return super.dateRangePickerController;
  }

  @override
  set dateRangePickerController(DateRangePickerController value) {
    _$dateRangePickerControllerAtom
        .reportWrite(value, super.dateRangePickerController, () {
      super.dateRangePickerController = value;
    });
  }

  late final _$dateRangePickerViewAtom = Atom(
      name: '_CreateTaskScreenStore.dateRangePickerView', context: context);

  @override
  DateRangePickerView get dateRangePickerView {
    _$dateRangePickerViewAtom.reportRead();
    return super.dateRangePickerView;
  }

  @override
  set dateRangePickerView(DateRangePickerView value) {
    _$dateRangePickerViewAtom.reportWrite(value, super.dateRangePickerView, () {
      super.dateRangePickerView = value;
    });
  }

  late final _$startDateAtom =
      Atom(name: '_CreateTaskScreenStore.startDate', context: context);

  @override
  DateTime get startDate {
    _$startDateAtom.reportRead();
    return super.startDate;
  }

  @override
  set startDate(DateTime value) {
    _$startDateAtom.reportWrite(value, super.startDate, () {
      super.startDate = value;
    });
  }

  late final _$endDateAtom =
      Atom(name: '_CreateTaskScreenStore.endDate', context: context);

  @override
  DateTime get endDate {
    _$endDateAtom.reportRead();
    return super.endDate;
  }

  @override
  set endDate(DateTime value) {
    _$endDateAtom.reportWrite(value, super.endDate, () {
      super.endDate = value;
    });
  }

  late final _$dueTimeAtom =
      Atom(name: '_CreateTaskScreenStore.dueTime', context: context);

  @override
  String? get dueTime {
    _$dueTimeAtom.reportRead();
    return super.dueTime;
  }

  @override
  set dueTime(String? value) {
    _$dueTimeAtom.reportWrite(value, super.dueTime, () {
      super.dueTime = value;
    });
  }

  late final _$_isShowLoadingAtom =
      Atom(name: '_CreateTaskScreenStore._isShowLoading', context: context);

  @override
  bool get _isShowLoading {
    _$_isShowLoadingAtom.reportRead();
    return super._isShowLoading;
  }

  @override
  set _isShowLoading(bool value) {
    _$_isShowLoadingAtom.reportWrite(value, super._isShowLoading, () {
      super._isShowLoading = value;
    });
  }

  late final _$_isWithWorkspaceAtom =
      Atom(name: '_CreateTaskScreenStore._isWithWorkspace', context: context);

  @override
  bool get _isWithWorkspace {
    _$_isWithWorkspaceAtom.reportRead();
    return super._isWithWorkspace;
  }

  @override
  set _isWithWorkspace(bool value) {
    _$_isWithWorkspaceAtom.reportWrite(value, super._isWithWorkspace, () {
      super._isWithWorkspace = value;
    });
  }

  late final _$_indexYourAccountAtom =
      Atom(name: '_CreateTaskScreenStore._indexYourAccount', context: context);

  @override
  int get _indexYourAccount {
    _$_indexYourAccountAtom.reportRead();
    return super._indexYourAccount;
  }

  @override
  set _indexYourAccount(int value) {
    _$_indexYourAccountAtom.reportWrite(value, super._indexYourAccount, () {
      super._indexYourAccount = value;
    });
  }

  late final _$_selectedAccountAtom =
      Atom(name: '_CreateTaskScreenStore._selectedAccount', context: context);

  @override
  Account get _selectedAccount {
    _$_selectedAccountAtom.reportRead();
    return super._selectedAccount;
  }

  @override
  set _selectedAccount(Account value) {
    _$_selectedAccountAtom.reportWrite(value, super._selectedAccount, () {
      super._selectedAccount = value;
    });
  }

  late final _$_isActiveButtonAtom =
      Atom(name: '_CreateTaskScreenStore._isActiveButton', context: context);

  @override
  bool get _isActiveButton {
    _$_isActiveButtonAtom.reportRead();
    return super._isActiveButton;
  }

  @override
  set _isActiveButton(bool value) {
    _$_isActiveButtonAtom.reportWrite(value, super._isActiveButton, () {
      super._isActiveButton = value;
    });
  }

  late final _$_workspaceAtom =
      Atom(name: '_CreateTaskScreenStore._workspace', context: context);

  @override
  Workspace get _workspace {
    _$_workspaceAtom.reportRead();
    return super._workspace;
  }

  @override
  set _workspace(Workspace value) {
    _$_workspaceAtom.reportWrite(value, super._workspace, () {
      super._workspace = value;
    });
  }

  late final _$_CreateTaskScreenStoreActionController =
      ActionController(name: '_CreateTaskScreenStore', context: context);

  @override
  String convertDateRMTime(DateTime date) {
    final _$actionInfo = _$_CreateTaskScreenStoreActionController.startAction(
        name: '_CreateTaskScreenStore.convertDateRMTime');
    try {
      return super.convertDateRMTime(date);
    } finally {
      _$_CreateTaskScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String convertYMDTime(DateTime date) {
    final _$actionInfo = _$_CreateTaskScreenStoreActionController.startAction(
        name: '_CreateTaskScreenStore.convertYMDTime');
    try {
      return super.convertYMDTime(date);
    } finally {
      _$_CreateTaskScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getDueTime(BuildContext context) {
    final _$actionInfo = _$_CreateTaskScreenStoreActionController.startAction(
        name: '_CreateTaskScreenStore.getDueTime');
    try {
      return super.getDueTime(context);
    } finally {
      _$_CreateTaskScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
blackoutDates: ${blackoutDates},
dateRangePickerController: ${dateRangePickerController},
dateRangePickerView: ${dateRangePickerView},
startDate: ${startDate},
endDate: ${endDate},
dueTime: ${dueTime}
    ''';
  }
}
