// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProfileScreenStore on _ProfileScreenStore, Store {
  Computed<bool>? _$isEnComputed;

  @override
  bool get isEn => (_$isEnComputed ??=
          Computed<bool>(() => super.isEn, name: '_ProfileScreenStore.isEn'))
      .value;

  late final _$_accountUrlPhotoAtom =
      Atom(name: '_ProfileScreenStore._accountUrlPhoto', context: context);

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

  late final _$_localeLanguageAtom =
      Atom(name: '_ProfileScreenStore._localeLanguage', context: context);

  @override
  String get _localeLanguage {
    _$_localeLanguageAtom.reportRead();
    return super._localeLanguage;
  }

  @override
  set _localeLanguage(String value) {
    _$_localeLanguageAtom.reportWrite(value, super._localeLanguage, () {
      super._localeLanguage = value;
    });
  }

  late final _$_accountMailAtom =
      Atom(name: '_ProfileScreenStore._accountMail', context: context);

  @override
  String get _accountMail {
    _$_accountMailAtom.reportRead();
    return super._accountMail;
  }

  @override
  set _accountMail(String value) {
    _$_accountMailAtom.reportWrite(value, super._accountMail, () {
      super._accountMail = value;
    });
  }

  late final _$_accountDisplayNameAtom =
      Atom(name: '_ProfileScreenStore._accountDisplayName', context: context);

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

  late final _$_workspacesAtom =
      Atom(name: '_ProfileScreenStore._workspaces', context: context);

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

  late final _$setLanguagesAsyncAction =
      AsyncAction('_ProfileScreenStore.setLanguages', context: context);

  @override
  Future<void> setLanguages(BuildContext context,
      {required String languageCode}) {
    return _$setLanguagesAsyncAction
        .run(() => super.setLanguages(context, languageCode: languageCode));
  }

  late final _$logoutAsyncAction =
      AsyncAction('_ProfileScreenStore.logout', context: context);

  @override
  Future<void> logout(BuildContext context) {
    return _$logoutAsyncAction.run(() => super.logout(context));
  }

  @override
  String toString() {
    return '''
isEn: ${isEn}
    ''';
  }
}
