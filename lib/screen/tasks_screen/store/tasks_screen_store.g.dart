// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks_screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TasksScreenStore on _TasksScreenStore, Store {
  late final _$_tasksAtom =
      Atom(name: '_TasksScreenStore._tasks', context: context);

  @override
  ObservableList<Task> get _tasks {
    _$_tasksAtom.reportRead();
    return super._tasks;
  }

  @override
  set _tasks(ObservableList<Task> value) {
    _$_tasksAtom.reportWrite(value, super._tasks, () {
      super._tasks = value;
    });
  }

  late final _$_localeKeyAtom =
      Atom(name: '_TasksScreenStore._localeKey', context: context);

  @override
  String get _localeKey {
    _$_localeKeyAtom.reportRead();
    return super._localeKey;
  }

  @override
  set _localeKey(String value) {
    _$_localeKeyAtom.reportWrite(value, super._localeKey, () {
      super._localeKey = value;
    });
  }

  late final _$_isShowLoadingAtom =
      Atom(name: '_TasksScreenStore._isShowLoading', context: context);

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

  late final _$_accountUrlPhotoAtom =
      Atom(name: '_TasksScreenStore._accountUrlPhoto', context: context);

  @override
  String get _accountUrlPhoto {
    _$_accountUrlPhotoAtom.reportRead();
    return super._accountUrlPhoto;
  }

  @override
  set _accountUrlPhoto(String value) {
    _$_accountUrlPhotoAtom.reportWrite(value, super._accountUrlPhoto, () {
      super._accountUrlPhoto = value;
    });
  }

  late final _$_accountDisplayNameAtom =
      Atom(name: '_TasksScreenStore._accountDisplayName', context: context);

  @override
  String get _accountDisplayName {
    _$_accountDisplayNameAtom.reportRead();
    return super._accountDisplayName;
  }

  @override
  set _accountDisplayName(String value) {
    _$_accountDisplayNameAtom.reportWrite(value, super._accountDisplayName, () {
      super._accountDisplayName = value;
    });
  }

  late final _$_countTaskDoneAtom =
      Atom(name: '_TasksScreenStore._countTaskDone', context: context);

  @override
  int get _countTaskDone {
    _$_countTaskDoneAtom.reportRead();
    return super._countTaskDone;
  }

  @override
  set _countTaskDone(int value) {
    _$_countTaskDoneAtom.reportWrite(value, super._countTaskDone, () {
      super._countTaskDone = value;
    });
  }

  late final _$_workspaceIdAtom =
      Atom(name: '_TasksScreenStore._workspaceId', context: context);

  @override
  int get _workspaceId {
    _$_workspaceIdAtom.reportRead();
    return super._workspaceId;
  }

  @override
  set _workspaceId(int value) {
    _$_workspaceIdAtom.reportWrite(value, super._workspaceId, () {
      super._workspaceId = value;
    });
  }

  late final _$_workspaceAtom =
      Atom(name: '_TasksScreenStore._workspace', context: context);

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

  late final _$_selectedDateAtom =
      Atom(name: '_TasksScreenStore._selectedDate', context: context);

  @override
  DateTime get _selectedDate {
    _$_selectedDateAtom.reportRead();
    return super._selectedDate;
  }

  @override
  set _selectedDate(DateTime value) {
    _$_selectedDateAtom.reportWrite(value, super._selectedDate, () {
      super._selectedDate = value;
    });
  }

  late final _$getListTaskAsyncAction =
      AsyncAction('_TasksScreenStore.getListTask', context: context);

  @override
  Future<void> getListTask() {
    return _$getListTaskAsyncAction.run(() => super.getListTask());
  }

  late final _$onPressedCompleteAsyncAction =
      AsyncAction('_TasksScreenStore.onPressedComplete', context: context);

  @override
  Future<void> onPressedComplete(BuildContext context, {required Task task}) {
    return _$onPressedCompleteAsyncAction
        .run(() => super.onPressedComplete(context, task: task));
  }

  late final _$_TasksScreenStoreActionController =
      ActionController(name: '_TasksScreenStore', context: context);

  @override
  String convertTimeTask(Task task) {
    final _$actionInfo = _$_TasksScreenStoreActionController.startAction(
        name: '_TasksScreenStore.convertTimeTask');
    try {
      return super.convertTimeTask(task);
    } finally {
      _$_TasksScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
