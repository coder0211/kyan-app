// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks_screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TasksScreenStore on _TasksScreenStore, Store {
  late final _$isShowLoadingAtom =
      Atom(name: '_TasksScreenStore.isShowLoading', context: context);

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

  late final _$_accountUrlPhotoAtom =
      Atom(name: '_TasksScreenStore._accountUrlPhoto', context: context);

  @override
  String get _accountUrlPhoto {
    _$_accountUrlPhotoAtom.reportRead();
    return super._accountUrlPhoto;
  }

  @override
  set _accountUrlPhoto(String value) {
    _$_accountUrlPhotoAtom.reportWrite(value, super._accountUrlPhoto, () {
      super._accountUrlPhoto = value;
    });
  }

  late final _$_accountDisplayNameAtom =
      Atom(name: '_TasksScreenStore._accountDisplayName', context: context);

  @override
  String get _accountDisplayName {
    _$_accountDisplayNameAtom.reportRead();
    return super._accountDisplayName;
  }

  @override
  set _accountDisplayName(String value) {
    _$_accountDisplayNameAtom.reportWrite(value, super._accountDisplayName, () {
      super._accountDisplayName = value;
    });
  }

  @override
  String toString() {
    return '''
isShowLoading: ${isShowLoading}
    ''';
  }
}
