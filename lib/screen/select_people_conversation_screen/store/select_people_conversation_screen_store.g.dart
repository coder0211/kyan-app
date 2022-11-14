// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'select_people_conversation_screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SelectPeopleConversationScreenStore
    on _SelectPeopleConversationScreenStore, Store {
  late final _$workspaceAtom = Atom(
      name: '_SelectPeopleConversationScreenStore.workspace', context: context);

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

  late final _$_selectedAllAtom = Atom(
      name: '_SelectPeopleConversationScreenStore._selectedAll',
      context: context);

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

  late final _$_currentWorkspaceIdAtom = Atom(
      name: '_SelectPeopleConversationScreenStore._currentWorkspaceId',
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

  late final _$peoplesAtom = Atom(
      name: '_SelectPeopleConversationScreenStore.peoples', context: context);

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

  late final _$selectedPeoplesAtom = Atom(
      name: '_SelectPeopleConversationScreenStore.selectedPeoples',
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

  late final _$getPeoplesAsyncAction = AsyncAction(
      '_SelectPeopleConversationScreenStore.getPeoples',
      context: context);

  @override
  Future<void> getPeoples(BuildContext context) {
    return _$getPeoplesAsyncAction.run(() => super.getPeoples(context));
  }

  @override
  String toString() {
    return '''
workspace: ${workspace},
peoples: ${peoples},
selectedPeoples: ${selectedPeoples}
    ''';
  }
}
