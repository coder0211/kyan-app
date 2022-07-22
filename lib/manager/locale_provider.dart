import 'package:flutter/material.dart';
import 'package:kyan/l10n/support_locale.dart';

class LocaleProvider with ChangeNotifier {
  Locale? _locale;
  Locale? get locale => _locale;

  void setLocale(Locale locale) {
    if (!L10n.support.contains(locale)) return;
    _locale = locale;
    notifyListeners();
  }
}
