// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statistic_screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StatisticScreenStore on _StatisticScreenStore, Store {
  late final _$tasksAtom =
      Atom(name: '_StatisticScreenStore.tasks', context: context);

  @override
  ObservableList<Task> get tasks {
    _$tasksAtom.reportRead();
    return super.tasks;
  }

  @override
  set tasks(ObservableList<Task> value) {
    _$tasksAtom.reportWrite(value, super.tasks, () {
      super.tasks = value;
    });
  }

  late final _$tasksDoneAtom =
      Atom(name: '_StatisticScreenStore.tasksDone', context: context);

  @override
  ObservableList<Task> get tasksDone {
    _$tasksDoneAtom.reportRead();
    return super.tasksDone;
  }

  @override
  set tasksDone(ObservableList<Task> value) {
    _$tasksDoneAtom.reportWrite(value, super.tasksDone, () {
      super.tasksDone = value;
    });
  }

  late final _$tasksPendingAtom =
      Atom(name: '_StatisticScreenStore.tasksPending', context: context);

  @override
  ObservableList<Task> get tasksPending {
    _$tasksPendingAtom.reportRead();
    return super.tasksPending;
  }

  @override
  set tasksPending(ObservableList<Task> value) {
    _$tasksPendingAtom.reportWrite(value, super.tasksPending, () {
      super.tasksPending = value;
    });
  }

  late final _$_taskIsDoneAtom =
      Atom(name: '_StatisticScreenStore._taskIsDone', context: context);

  @override
  bool get _taskIsDone {
    _$_taskIsDoneAtom.reportRead();
    return super._taskIsDone;
  }

  @override
  set _taskIsDone(bool value) {
    _$_taskIsDoneAtom.reportWrite(value, super._taskIsDone, () {
      super._taskIsDone = value;
    });
  }

  late final _$_currentWorkspaceIdAtom =
      Atom(name: '_StatisticScreenStore._currentWorkspaceId', context: context);

  @override
  int get _currentWorkspaceId {
    _$_currentWorkspaceIdAtom.reportRead();
    return super._currentWorkspaceId;
  }

  @override
  set _currentWorkspaceId(int value) {
    _$_currentWorkspaceIdAtom.reportWrite(value, super._currentWorkspaceId, () {
      super._currentWorkspaceId = value;
    });
  }

  late final _$_selectedStartDateAtom =
      Atom(name: '_StatisticScreenStore._selectedStartDate', context: context);

  @override
  DateTime get _selectedStartDate {
    _$_selectedStartDateAtom.reportRead();
    return super._selectedStartDate;
  }

  @override
  set _selectedStartDate(DateTime value) {
    _$_selectedStartDateAtom.reportWrite(value, super._selectedStartDate, () {
      super._selectedStartDate = value;
    });
  }

  late final _$_selectedDueDateAtom =
      Atom(name: '_StatisticScreenStore._selectedDueDate', context: context);

  @override
  DateTime get _selectedDueDate {
    _$_selectedDueDateAtom.reportRead();
    return super._selectedDueDate;
  }

  @override
  set _selectedDueDate(DateTime value) {
    _$_selectedDueDateAtom.reportWrite(value, super._selectedDueDate, () {
      super._selectedDueDate = value;
    });
  }

  late final _$getPersonalStatisticAsyncAction = AsyncAction(
      '_StatisticScreenStore.getPersonalStatistic',
      context: context);

  @override
  Future<void> getPersonalStatistic() {
    return _$getPersonalStatisticAsyncAction
        .run(() => super.getPersonalStatistic());
  }

  late final _$onPressedCompleteAsyncAction =
      AsyncAction('_StatisticScreenStore.onPressedComplete', context: context);

  @override
  Future<void> onPressedComplete(BuildContext context, {required Task task}) {
    return _$onPressedCompleteAsyncAction
        .run(() => super.onPressedComplete(context, task: task));
  }

  late final _$_StatisticScreenStoreActionController =
      ActionController(name: '_StatisticScreenStore', context: context);

  @override
  String convertTimeTask(Task task) {
    final _$actionInfo = _$_StatisticScreenStoreActionController.startAction(
        name: '_StatisticScreenStore.convertTimeTask');
    try {
      return super.convertTimeTask(task);
    } finally {
      _$_StatisticScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tasks: ${tasks},
tasksDone: ${tasksDone},
tasksPending: ${tasksPending}
    ''';
  }
}
