// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workspaces_screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$WorkspacesScreenStore on _WorkspacesScreenStore, Store {
  late final _$_currentWorkspaceIdAtom = Atom(
      name: '_WorkspacesScreenStore._currentWorkspaceId', context: context);

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

  late final _$_workspacesAtom =
      Atom(name: '_WorkspacesScreenStore._workspaces', context: context);

  @override
  ObservableList<Workspace> get _workspaces {
    _$_workspacesAtom.reportRead();
    return super._workspaces;
  }

  @override
  set _workspaces(ObservableList<Workspace> value) {
    _$_workspacesAtom.reportWrite(value, super._workspaces, () {
      super._workspaces = value;
    });
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
