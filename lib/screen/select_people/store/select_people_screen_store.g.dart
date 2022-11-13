// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'select_people_screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SelectPeopleScreenStore on _SelectPeopleScreenStore, Store {
  late final _$currentAccountAtom =
      Atom(name: '_SelectPeopleScreenStore.currentAccount', context: context);

  @override
  Account get currentAccount {
    _$currentAccountAtom.reportRead();
    return super.currentAccount;
  }

  @override
  set currentAccount(Account value) {
    _$currentAccountAtom.reportWrite(value, super.currentAccount, () {
      super.currentAccount = value;
    });
  }

  late final _$membersAtom =
      Atom(name: '_SelectPeopleScreenStore.members', context: context);

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

  late final _$peoplesAtom =
      Atom(name: '_SelectPeopleScreenStore.peoples', context: context);

  @override
  ObservableList<Account> get peoples {
    _$peoplesAtom.reportRead();
    return super.peoples;
  }

  @override
  set peoples(ObservableList<Account> value) {
    _$peoplesAtom.reportWrite(value, super.peoples, () {
      super.peoples = value;
    });
  }

  late final _$selectedPeoplesAtom =
      Atom(name: '_SelectPeopleScreenStore.selectedPeoples', context: context);

  @override
  ObservableList<Account> get selectedPeoples {
    _$selectedPeoplesAtom.reportRead();
    return super.selectedPeoples;
  }

  @override
  set selectedPeoples(ObservableList<Account> value) {
    _$selectedPeoplesAtom.reportWrite(value, super.selectedPeoples, () {
      super.selectedPeoples = value;
    });
  }

  late final _$workspaceAtom =
      Atom(name: '_SelectPeopleScreenStore.workspace', context: context);

  @override
  Workspace get workspace {
    _$workspaceAtom.reportRead();
    return super.workspace;
  }

  @override
  set workspace(Workspace value) {
    _$workspaceAtom.reportWrite(value, super.workspace, () {
      super.workspace = value;
    });
  }

  late final _$_selectedAllAtom =
      Atom(name: '_SelectPeopleScreenStore._selectedAll', context: context);

  @override
  bool get _selectedAll {
    _$_selectedAllAtom.reportRead();
    return super._selectedAll;
  }

  @override
  set _selectedAll(bool value) {
    _$_selectedAllAtom.reportWrite(value, super._selectedAll, () {
      super._selectedAll = value;
    });
  }

  late final _$getMembersWorkspaceAsyncAction = AsyncAction(
      '_SelectPeopleScreenStore.getMembersWorkspace',
      context: context);

  @override
  Future<void> getMembersWorkspace(BuildContext context) {
    return _$getMembersWorkspaceAsyncAction
        .run(() => super.getMembersWorkspace(context));
  }

  late final _$onClickAddMemberDoneAsyncAction = AsyncAction(
      '_SelectPeopleScreenStore.onClickAddMemberDone',
      context: context);

  @override
  Future<void> onClickAddMemberDone(BuildContext context,
      {required String email, required bool isSelected}) {
    return _$onClickAddMemberDoneAsyncAction.run(() => super
        .onClickAddMemberDone(context, email: email, isSelected: isSelected));
  }

  late final _$getPeopleAsyncAction =
      AsyncAction('_SelectPeopleScreenStore.getPeople', context: context);

  @override
  Future<void> getPeople(BuildContext context, {required String email}) {
    return _$getPeopleAsyncAction
        .run(() => super.getPeople(context, email: email));
  }

  late final _$_SelectPeopleScreenStoreActionController =
      ActionController(name: '_SelectPeopleScreenStore', context: context);

  @override
  void onTapItem({required Account account}) {
    final _$actionInfo = _$_SelectPeopleScreenStoreActionController.startAction(
        name: '_SelectPeopleScreenStore.onTapItem');
    try {
      return super.onTapItem(account: account);
    } finally {
      _$_SelectPeopleScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onTapSelectedAll() {
    final _$actionInfo = _$_SelectPeopleScreenStoreActionController.startAction(
        name: '_SelectPeopleScreenStore.onTapSelectedAll');
    try {
      return super.onTapSelectedAll();
    } finally {
      _$_SelectPeopleScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentAccount: ${currentAccount},
members: ${members},
peoples: ${peoples},
selectedPeoples: ${selectedPeoples},
workspace: ${workspace}
    ''';
  }
}
