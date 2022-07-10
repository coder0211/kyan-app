// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginScreenStore on _LoginScreenStore, Store {
  late final _$googleSignInAtom =
      Atom(name: '_LoginScreenStore.googleSignIn', context: context);

  @override
  GoogleSignIn get googleSignIn {
    _$googleSignInAtom.reportRead();
    return super.googleSignIn;
  }

  @override
  set googleSignIn(GoogleSignIn value) {
    _$googleSignInAtom.reportWrite(value, super.googleSignIn, () {
      super.googleSignIn = value;
    });
  }

  late final _$currentAccountAtom =
      Atom(name: '_LoginScreenStore.currentAccount', context: context);

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

  late final _$googleSignInAccountAtom =
      Atom(name: '_LoginScreenStore.googleSignInAccount', context: context);

  @override
  GoogleSignInAccount? get googleSignInAccount {
    _$googleSignInAccountAtom.reportRead();
    return super.googleSignInAccount;
  }

  @override
  set googleSignInAccount(GoogleSignInAccount? value) {
    _$googleSignInAccountAtom.reportWrite(value, super.googleSignInAccount, () {
      super.googleSignInAccount = value;
    });
  }

  late final _$onPressLoginAsyncAction =
      AsyncAction('_LoginScreenStore.onPressLogin', context: context);

  @override
  Future<void> onPressLogin(BuildContext context) {
    return _$onPressLoginAsyncAction.run(() => super.onPressLogin(context));
  }

  late final _$handleGetDataAsyncAction =
      AsyncAction('_LoginScreenStore.handleGetData', context: context);

  @override
  Future<void> handleGetData({String? accessToken}) {
    return _$handleGetDataAsyncAction
        .run(() => super.handleGetData(accessToken: accessToken));
  }

  late final _$handleSignOutAsyncAction =
      AsyncAction('_LoginScreenStore.handleSignOut', context: context);

  @override
  Future<void> handleSignOut(BuildContext context) {
    return _$handleSignOutAsyncAction.run(() => super.handleSignOut(context));
  }

  late final _$_LoginScreenStoreActionController =
      ActionController(name: '_LoginScreenStore', context: context);

  @override
  Future<void> handleSignInSlient() {
    final _$actionInfo = _$_LoginScreenStoreActionController.startAction(
        name: '_LoginScreenStore.handleSignInSlient');
    try {
      return super.handleSignInSlient();
    } finally {
      _$_LoginScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
googleSignIn: ${googleSignIn},
currentAccount: ${currentAccount},
googleSignInAccount: ${googleSignInAccount}
    ''';
  }
}
