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

  late final _$_workspaceAtom =
      Atom(name: '_MemberWorkspaceScreenStore._workspace', context: context);

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

  @override
  String toString() {
    return '''
members: ${members}
    ''';
  }
}
