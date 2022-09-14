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

  @override
  String toString() {
    return '''
isShowLoading: ${isShowLoading}
    ''';
  }
}
