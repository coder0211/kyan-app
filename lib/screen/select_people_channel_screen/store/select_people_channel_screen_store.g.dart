// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'select_people_channel_screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SelectPeopleChannelScreenStore
    on _SelectPeopleChannelScreenStore, Store {
  late final _$currentAccountAtom = Atom(
      name: '_SelectPeopleChannelScreenStore.currentAccount', context: context);

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
      Atom(name: '_SelectPeopleChannelScreenStore.members', context: context);

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

  late final _$selectedPeoplesAtom = Atom(
      name: '_SelectPeopleChannelScreenStore.selectedPeoples',
      context: context);

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
      Atom(name: '_SelectPeopleChannelScreenStore.workspace', context: context);

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

  late final _$_currentWorkspaceIdAtom = Atom(
      name: '_SelectPeopleChannelScreenStore._currentWorkspaceId',
      context: context);

  @override
  int? get _currentWorkspaceId {
    _$_currentWorkspaceIdAtom.reportRead();
    return super._currentWorkspaceId;
  }

  @override
  set _currentWorkspaceId(int? value) {
    _$_currentWorkspaceIdAtom.reportWrite(value, super._currentWorkspaceId, () {
      super._currentWorkspaceId = value;
    });
  }

  late final _$_selectedAllAtom = Atom(
      name: '_SelectPeopleChannelScreenStore._selectedAll', context: context);

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

  late final _$_currentChannelIdAtom = Atom(
      name: '_SelectPeopleChannelScreenStore._currentChannelId',
      context: context);

  @override
  int? get _currentChannelId {
    _$_currentChannelIdAtom.reportRead();
    return super._currentChannelId;
  }

  @override
  set _currentChannelId(int? value) {
    _$_currentChannelIdAtom.reportWrite(value, super._currentChannelId, () {
      super._currentChannelId = value;
    });
  }

  late final _$_isShowLoadingAtom = Atom(
      name: '_SelectPeopleChannelScreenStore._isShowLoading', context: context);

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

  late final _$getMembersWorkspaceAsyncAction = AsyncAction(
      '_SelectPeopleChannelScreenStore.getMembersWorkspace',
      context: context);

  @override
  Future<void> getMembersWorkspace(BuildContext context) {
    return _$getMembersWorkspaceAsyncAction
        .run(() => super.getMembersWorkspace(context));
  }

  late final _$onClickAddMemberChatDoneAsyncAction = AsyncAction(
      '_SelectPeopleChannelScreenStore.onClickAddMemberChatDone',
      context: context);

  @override
  Future<void> onClickAddMemberChatDone(BuildContext context,
      {required int id, required bool isSelected}) {
    return _$onClickAddMemberChatDoneAsyncAction.run(() => super
        .onClickAddMemberChatDone(context, id: id, isSelected: isSelected));
  }

  late final _$_SelectPeopleChannelScreenStoreActionController =
      ActionController(
          name: '_SelectPeopleChannelScreenStore', context: context);

  @override
  int checkExist(Account account) {
    final _$actionInfo = _$_SelectPeopleChannelScreenStoreActionController
        .startAction(name: '_SelectPeopleChannelScreenStore.checkExist');
    try {
      return super.checkExist(account);
    } finally {
      _$_SelectPeopleChannelScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onTapItem({required Account account}) {
    final _$actionInfo = _$_SelectPeopleChannelScreenStoreActionController
        .startAction(name: '_SelectPeopleChannelScreenStore.onTapItem');
    try {
      return super.onTapItem(account: account);
    } finally {
      _$_SelectPeopleChannelScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onTapSelectedAll() {
    final _$actionInfo = _$_SelectPeopleChannelScreenStoreActionController
        .startAction(name: '_SelectPeopleChannelScreenStore.onTapSelectedAll');
    try {
      return super.onTapSelectedAll();
    } finally {
      _$_SelectPeopleChannelScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentAccount: ${currentAccount},
members: ${members},
selectedPeoples: ${selectedPeoples},
workspace: ${workspace}
    ''';
  }
}
