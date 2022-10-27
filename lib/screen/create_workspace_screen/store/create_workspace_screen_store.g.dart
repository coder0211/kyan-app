// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_workspace_screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CreateWorkspaceScreenStore on _CreateWorkspaceScreenStore, Store {
  late final _$currentAccountAtom = Atom(
      name: '_CreateWorkspaceScreenStore.currentAccount', context: context);

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

  late final _$workspaceAtom =
      Atom(name: '_CreateWorkspaceScreenStore.workspace', context: context);

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

  @override
  String toString() {
    return '''
currentAccount: ${currentAccount},
workspace: ${workspace}
    ''';
  }
}
