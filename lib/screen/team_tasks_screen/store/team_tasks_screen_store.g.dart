// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_tasks_screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TeamTasksScreenStore on _TeamTasksScreenStore, Store {
  late final _$isShowLoadingAtom =
      Atom(name: '_TeamTasksScreenStore.isShowLoading', context: context);

  @override
  bool get isShowLoading {
    _$isShowLoadingAtom.reportRead();
    return super.isShowLoading;
  }

  @override
  set isShowLoading(bool value) {
    _$isShowLoadingAtom.reportWrite(value, super.isShowLoading, () {
      super.isShowLoading = value;
    });
  }

  late final _$tasksAtom =
      Atom(name: '_TeamTasksScreenStore.tasks', context: context);

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

  late final _$tasksPendingAtom =
      Atom(name: '_TeamTasksScreenStore.tasksPending', context: context);

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

  late final _$tasksDoneAtom =
      Atom(name: '_TeamTasksScreenStore.tasksDone', context: context);

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

  late final _$membersAtom =
      Atom(name: '_TeamTasksScreenStore.members', context: context);

  @override
  ObservableList<Account> get members {
    _$membersAtom.reportRead();
    return super.members;
  }

  @override
  set members(ObservableList<Account> value) {
    _$membersAtom.reportWrite(value, super.members, () {
      super.members = value;
    });
  }

  late final _$_workspaceAtom =
      Atom(name: '_TeamTasksScreenStore._workspace', context: context);

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

  late final _$_selectedAccountAtom =
      Atom(name: '_TeamTasksScreenStore._selectedAccount', context: context);

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

  late final _$_currentWorkspaceIdAtom =
      Atom(name: '_TeamTasksScreenStore._currentWorkspaceId', context: context);

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

  late final _$getTasksAsyncAction =
      AsyncAction('_TeamTasksScreenStore.getTasks', context: context);

  @override
  Future<void> getTasks({Account? account}) {
    return _$getTasksAsyncAction.run(() => super.getTasks(account: account));
  }

  late final _$onPressedCompleteAsyncAction =
      AsyncAction('_TeamTasksScreenStore.onPressedComplete', context: context);

  @override
  Future<void> onPressedComplete(BuildContext context, {required Task task}) {
    return _$onPressedCompleteAsyncAction
        .run(() => super.onPressedComplete(context, task: task));
  }

  late final _$getMembersWorkspaceAsyncAction = AsyncAction(
      '_TeamTasksScreenStore.getMembersWorkspace',
      context: context);

  @override
  Future<void> getMembersWorkspace() {
    return _$getMembersWorkspaceAsyncAction
        .run(() => super.getMembersWorkspace());
  }

  late final _$_TeamTasksScreenStoreActionController =
      ActionController(name: '_TeamTasksScreenStore', context: context);

  @override
  String convertTimeTask(Task task) {
    final _$actionInfo = _$_TeamTasksScreenStoreActionController.startAction(
        name: '_TeamTasksScreenStore.convertTimeTask');
    try {
      return super.convertTimeTask(task);
    } finally {
      _$_TeamTasksScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isShowLoading: ${isShowLoading},
tasks: ${tasks},
tasksPending: ${tasksPending},
tasksDone: ${tasksDone},
members: ${members}
    ''';
  }
}
