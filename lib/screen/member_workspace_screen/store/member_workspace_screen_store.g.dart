// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_workspace_screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MemberWorkspaceScreenStore on _MemberWorkspaceScreenStore, Store {
  late final _$membersAtom =
      Atom(name: '_MemberWorkspaceScreenStore.members', context: context);

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

  late final _$workspaceAtom =
      Atom(name: '_MemberWorkspaceScreenStore.workspace', context: context);

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

  late final _$getMembersWorkspaceAsyncAction = AsyncAction(
      '_MemberWorkspaceScreenStore.getMembersWorkspace',
      context: context);

  @override
  Future<void> getMembersWorkspace(BuildContext context) {
    return _$getMembersWorkspaceAsyncAction
        .run(() => super.getMembersWorkspace(context));
  }

  late final _$onClickDeleteAsyncAction = AsyncAction(
      '_MemberWorkspaceScreenStore.onClickDelete',
      context: context);

  @override
  Future<void> onClickDelete(BuildContext context,
      {required String accountId}) {
    return _$onClickDeleteAsyncAction
        .run(() => super.onClickDelete(context, accountId: accountId));
  }

  @override
  String toString() {
    return '''
members: ${members},
workspace: ${workspace}
    ''';
  }
}
