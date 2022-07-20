// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SplashScreenStore on _SplashScreenStore, Store {
  late final _$googleSignInAtom =
      Atom(name: '_SplashScreenStore.googleSignIn', context: context);

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

  @override
  String toString() {
    return '''
googleSignIn: ${googleSignIn}
    ''';
  }
}
