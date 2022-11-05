import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:kyan/enums/enum_languages.dart';
import 'package:kyan/manager/manager_key_storage.dart';
import 'package:mobx/mobx.dart';

part 'app_store.g.dart';

class AppStore = _AppStore with _$AppStore;

abstract class _AppStore with Store {
  Map<EnumLanguages, EnumLanguages> swapLanguages = {
    EnumLanguages.vi: EnumLanguages.en,
    EnumLanguages.en: EnumLanguages.vi
  };

  @observable
  Locale locale = Locale(EnumLanguages.en.name);

  @action
  void setLocale(BuildContext context, Locale newLocale) {
    locale = newLocale;
  }

  @action
  Future<void> setLanguages(BuildContext context,
      {required String languageCode}) async {
    setLocale(context, Locale(languageCode));
    BaseSharedPreferences.saveStringValue(
        ManagerKeyStorage.language, languageCode);
  }

  Future<void> getLanguage() async {
    if (await BaseSharedPreferences.containKey(ManagerKeyStorage.language)) {
      locale = Locale(await BaseSharedPreferences.getStringValue(
          ManagerKeyStorage.language));
    } else {
      locale = Locale(EnumLanguages.en.name);
    }
  }
}
