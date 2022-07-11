// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Kyan`
  String get appName {
    return Intl.message(
      'Kyan',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to Kyan`
  String get welcome {
    return Intl.message(
      'Welcome to Kyan',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `We help you with everything at work`
  String get descriptionWelcome {
    return Intl.message(
      'We help you with everything at work',
      name: 'descriptionWelcome',
      desc: '',
      args: [],
    );
  }

  /// `LOGIN WITH GOOGLE`
  String get loginWithGoogle {
    return Intl.message(
      'LOGIN WITH GOOGLE',
      name: 'loginWithGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Login Failed`
  String get loginFailed {
    return Intl.message(
      'Login Failed',
      name: 'loginFailed',
      desc: '',
      args: [],
    );
  }

  /// `Task`
  String get task {
    return Intl.message(
      'Task',
      name: 'task',
      desc: '',
      args: [],
    );
  }

  /// `Chat`
  String get chat {
    return Intl.message(
      'Chat',
      name: 'chat',
      desc: '',
      args: [],
    );
  }

  /// `Bot`
  String get bot {
    return Intl.message(
      'Bot',
      name: 'bot',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Create Task`
  String get createTask {
    return Intl.message(
      'Create Task',
      name: 'createTask',
      desc: '',
      args: [],
    );
  }

  /// `Internet unavaiable`
  String get internetUnavaiable {
    return Intl.message(
      'Internet unavaiable',
      name: 'internetUnavaiable',
      desc: '',
      args: [],
    );
  }

  /// `Big community`
  String get bigCommunity {
    return Intl.message(
      'Big community',
      name: 'bigCommunity',
      desc: '',
      args: [],
    );
  }

  /// `Instead of loughing around, go head and chat with your friends.`
  String get bodyCommunity {
    return Intl.message(
      'Instead of loughing around, go head and chat with your friends.',
      name: 'bodyCommunity',
      desc: '',
      args: [],
    );
  }

  /// `Remote control`
  String get remoteControl {
    return Intl.message(
      'Remote control',
      name: 'remoteControl',
      desc: '',
      args: [],
    );
  }

  /// `Professional helper easily make statistics of your tasks and make sure everything goes as plan.`
  String get bodyRemoteControl {
    return Intl.message(
      'Professional helper easily make statistics of your tasks and make sure everything goes as plan.',
      name: 'bodyRemoteControl',
      desc: '',
      args: [],
    );
  }

  /// `Friendly layout`
  String get friendlyLayout {
    return Intl.message(
      'Friendly layout',
      name: 'friendlyLayout',
      desc: '',
      args: [],
    );
  }

  /// `Beautiful figures will give you comfortable environment and turn your work into an uplifting journey.`
  String get bodyFriendlyLayout {
    return Intl.message(
      'Beautiful figures will give you comfortable environment and turn your work into an uplifting journey.',
      name: 'bodyFriendlyLayout',
      desc: '',
      args: [],
    );
  }

  /// `Task manager`
  String get taskManager {
    return Intl.message(
      'Task manager',
      name: 'taskManager',
      desc: '',
      args: [],
    );
  }

  /// `Manage your tasks quickly and accurately to help everyone on time every single occasion.`
  String get bodyTaskManager {
    return Intl.message(
      'Manage your tasks quickly and accurately to help everyone on time every single occasion.',
      name: 'bodyTaskManager',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get done {
    return Intl.message(
      'Done',
      name: 'done',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'vi'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
