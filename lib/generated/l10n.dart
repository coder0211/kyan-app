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
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null, 'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
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
    assert(instance != null, 'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Kyan`
  String get app_name {
    return Intl.message(
      'Kyan',
      name: 'app_name',
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

  /// `Summary *`
  String get summary {
    return Intl.message(
      'Summary *',
      name: 'summary',
      desc: '',
      args: [],
    );
  }

  /// `Summary...`
  String get hintSummary {
    return Intl.message(
      'Summary...',
      name: 'hintSummary',
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

  /// `Description`
  String get description {
    return Intl.message(
      'Description',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Description task ...`
  String get descriptionTask {
    return Intl.message(
      'Description task ...',
      name: 'descriptionTask',
      desc: '',
      args: [],
    );
  }

  /// `Due time`
  String get dueTime {
    return Intl.message(
      'Due time',
      name: 'dueTime',
      desc: '',
      args: [],
    );
  }

  /// `CREATE`
  String get create {
    return Intl.message(
      'CREATE',
      name: 'create',
      desc: '',
      args: [],
    );
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

  /// `Add `
  String get add {
    return Intl.message(
      'Add ',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Hi,`
  String get hi {
    return Intl.message(
      'Hi,',
      name: 'hi',
      desc: '',
      args: [],
    );
  }

  /// `Todo`
  String get todo {
    return Intl.message(
      'Todo',
      name: 'todo',
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

  /// `DONE`
  String get doneUpper {
    return Intl.message(
      'DONE',
      name: 'doneUpper',
      desc: '',
      args: [],
    );
  }

  /// `UPDATE`
  String get updateUpper {
    return Intl.message(
      'UPDATE',
      name: 'updateUpper',
      desc: '',
      args: [],
    );
  }

  /// `Edit Task`
  String get editTask {
    return Intl.message(
      'Edit Task',
      name: 'editTask',
      desc: '',
      args: [],
    );
  }

  /// `People`
  String get people {
    return Intl.message(
      'People',
      name: 'people',
      desc: '',
      args: [],
    );
  }

  /// `Channel`
  String get channel {
    return Intl.message(
      'Channel',
      name: 'channel',
      desc: '',
      args: [],
    );
  }

  /// `Conversation`
  String get conversation {
    return Intl.message(
      'Conversation',
      name: 'conversation',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure?\nYou want to delete this task?`
  String get confirmDeleteTask {
    return Intl.message(
      'Are you sure?\nYou want to delete this task?',
      name: 'confirmDeleteTask',
      desc: '',
      args: [],
    );
  }

  /// `Delete Task`
  String get deleteTask {
    return Intl.message(
      'Delete Task',
      name: 'deleteTask',
      desc: '',
      args: [],
    );
  }

  /// `Bot name`
  String get botName {
    return Intl.message(
      'Bot name',
      name: 'botName',
      desc: '',
      args: [],
    );
  }

  /// `Bot description`
  String get botDescription {
    return Intl.message(
      'Bot description',
      name: 'botDescription',
      desc: '',
      args: [],
    );
  }

  /// `Kyan reminder manager`
  String get botKyanReminder {
    return Intl.message(
      'Kyan reminder manager',
      name: 'botKyanReminder',
      desc: '',
      args: [],
    );
  }

  /// `titile`
  String get titile {
    return Intl.message(
      'titile',
      name: 'titile',
      desc: '',
      args: [],
    );
  }

  /// `Search here...`
  String get searchHere {
    return Intl.message(
      'Search here...',
      name: 'searchHere',
      desc: '',
      args: [],
    );
  }

  /// `Add channel`
  String get addChannel {
    return Intl.message(
      'Add channel',
      name: 'addChannel',
      desc: '',
      args: [],
    );
  }

  /// `Channel name`
  String get channelName {
    return Intl.message(
      'Channel name',
      name: 'channelName',
      desc: '',
      args: [],
    );
  }

  /// `Is private`
  String get isPrivate {
    return Intl.message(
      'Is private',
      name: 'isPrivate',
      desc: '',
      args: [],
    );
  }

  /// `ADD`
  String get ADD {
    return Intl.message(
      'ADD',
      name: 'ADD',
      desc: '',
      args: [],
    );
  }

  /// `Create channel successfully`
  String get createChannelSuccess {
    return Intl.message(
      'Create channel successfully',
      name: 'createChannelSuccess',
      desc: '',
      args: [],
    );
  }

  /// `With workspace`
  String get withWorkspace {
    return Intl.message(
      'With workspace',
      name: 'withWorkspace',
      desc: '',
      args: [],
    );
  }

  /// `Assign to`
  String get assignTo {
    return Intl.message(
      'Assign to',
      name: 'assignTo',
      desc: '',
      args: [],
    );
  }

  /// `Name workspace`
  String get nameWorkspace {
    return Intl.message(
      'Name workspace',
      name: 'nameWorkspace',
      desc: '',
      args: [],
    );
  }

  /// `Create`
  String get createNormal {
    return Intl.message(
      'Create',
      name: 'createNormal',
      desc: '',
      args: [],
    );
  }

  /// `Remove`
  String get remove {
    return Intl.message(
      'Remove',
      name: 'remove',
      desc: '',
      args: [],
    );
  }

  /// `Time Picker`
  String get timePicker {
    return Intl.message(
      'Time Picker',
      name: 'timePicker',
      desc: '',
      args: [],
    );
  }

  /// `Workspaces`
  String get workspace {
    return Intl.message(
      'Workspaces',
      name: 'workspace',
      desc: '',
      args: [],
    );
  }

  /// `Room`
  String get room {
    return Intl.message(
      'Room',
      name: 'room',
      desc: '',
      args: [],
    );
  }

  /// `Delete bot`
  String get deleteBot {
    return Intl.message(
      'Delete bot',
      name: 'deleteBot',
      desc: '',
      args: [],
    );
  }

  /// `Today`
  String get today {
    return Intl.message(
      'Today',
      name: 'today',
      desc: '',
      args: [],
    );
  }

  /// `Create workspace`
  String get createWorkspace {
    return Intl.message(
      'Create workspace',
      name: 'createWorkspace',
      desc: '',
      args: [],
    );
  }

  /// `Join workspace`
  String get joinWorkspace {
    return Intl.message(
      'Join workspace',
      name: 'joinWorkspace',
      desc: '',
      args: [],
    );
  }

  /// `Code`
  String get code {
    return Intl.message(
      'Code',
      name: 'code',
      desc: '',
      args: [],
    );
  }

  /// `JOIN`
  String get joinUpper {
    return Intl.message(
      'JOIN',
      name: 'joinUpper',
      desc: '',
      args: [],
    );
  }

  /// `Contact us: team@tdsof.dev`
  String get contactUsTeamtdosf {
    return Intl.message(
      'Contact us: team@tdsof.dev',
      name: 'contactUsTeamtdosf',
      desc: '',
      args: [],
    );
  }

  /// `Deleted successfully`
  String get deleteSuccessfully {
    return Intl.message(
      'Deleted successfully',
      name: 'deleteSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Failed`
  String get failed {
    return Intl.message(
      'Failed',
      name: 'failed',
      desc: '',
      args: [],
    );
  }

  /// `Create channel successfully`
  String get createChannelSuccessfully {
    return Intl.message(
      'Create channel successfully',
      name: 'createChannelSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Create channel failed`
  String get createChannelFailed {
    return Intl.message(
      'Create channel failed',
      name: 'createChannelFailed',
      desc: '',
      args: [],
    );
  }

  /// `Create Successfully`
  String get createSuccessfully {
    return Intl.message(
      'Create Successfully',
      name: 'createSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Remove Successfully`
  String get removeSuccessfully {
    return Intl.message(
      'Remove Successfully',
      name: 'removeSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Left successfully`
  String get leftSuccessfully {
    return Intl.message(
      'Left successfully',
      name: 'leftSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Create conversation successfully`
  String get createConversationSuccessfully {
    return Intl.message(
      'Create conversation successfully',
      name: 'createConversationSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Team tasks`
  String get teamTasks {
    return Intl.message(
      'Team tasks',
      name: 'teamTasks',
      desc: '',
      args: [],
    );
  }

  /// `Kyan time`
  String get titileKyanTime {
    return Intl.message(
      'Kyan time',
      name: 'titileKyanTime',
      desc: '',
      args: [],
    );
  }

  /// `Congratulations on your completion!`
  String get congraOnyourCompletion {
    return Intl.message(
      'Congratulations on your completion!',
      name: 'congraOnyourCompletion',
      desc: '',
      args: [],
    );
  }

  /// `Info chat`
  String get infoChat {
    return Intl.message(
      'Info chat',
      name: 'infoChat',
      desc: '',
      args: [],
    );
  }

  /// `Members`
  String get members {
    return Intl.message(
      'Members',
      name: 'members',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure, you want to remove?`
  String get confirmLeaveWorkspace {
    return Intl.message(
      'Are you sure, you want to remove?',
      name: 'confirmLeaveWorkspace',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure, you want to leave this channel?`
  String get confirmLeaveChannel {
    return Intl.message(
      'Are you sure, you want to leave this channel?',
      name: 'confirmLeaveChannel',
      desc: '',
      args: [],
    );
  }

  /// `Leave your channel`
  String get leaveChannel {
    return Intl.message(
      'Leave your channel',
      name: 'leaveChannel',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure, you want to delete this?`
  String get confirmDeleteThis {
    return Intl.message(
      'Are you sure, you want to delete this?',
      name: 'confirmDeleteThis',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Member workspace`
  String get memberWorkspace {
    return Intl.message(
      'Member workspace',
      name: 'memberWorkspace',
      desc: '',
      args: [],
    );
  }

  /// `Feedback`
  String get feedBack {
    return Intl.message(
      'Feedback',
      name: 'feedBack',
      desc: '',
      args: [],
    );
  }

  /// `Statistical`
  String get statistical {
    return Intl.message(
      'Statistical',
      name: 'statistical',
      desc: '',
      args: [],
    );
  }

  /// `About us`
  String get aboutUs {
    return Intl.message(
      'About us',
      name: 'aboutUs',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to logout?`
  String get confirmLogout {
    return Intl.message(
      'Are you sure you want to logout?',
      name: 'confirmLogout',
      desc: '',
      args: [],
    );
  }

  /// `idChannel`
  String get idChannel {
    return Intl.message(
      'idChannel',
      name: 'idChannel',
      desc: '',
      args: [],
    );
  }

  /// `Statistic`
  String get statistic {
    return Intl.message(
      'Statistic',
      name: 'statistic',
      desc: '',
      args: [],
    );
  }

  /// `Manage Tasks`
  String get managerTasks {
    return Intl.message(
      'Manage Tasks',
      name: 'managerTasks',
      desc: '',
      args: [],
    );
  }

  /// `Product name: Kyan\n\n`
  String get productNameKyan {
    return Intl.message(
      'Product name: Kyan\n\n',
      name: 'productNameKyan',
      desc: '',
      args: [],
    );
  }

  /// `Creator: Nguyen Duc Hoa, Truong Ngoc Thanh, Nguyen Van Duy`
  String get creator {
    return Intl.message(
      'Creator: Nguyen Duc Hoa, Truong Ngoc Thanh, Nguyen Van Duy',
      name: 'creator',
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

  /// ` Mission:`
  String get textSpanMission {
    return Intl.message(
      ' Mission:',
      name: 'textSpanMission',
      desc: '',
      args: [],
    );
  }

  /// `In order to help people to interact with the social community in speed of light, moreover, make a great difference by giving and creating task for daily purposes.`
  String get textSpanLine1 {
    return Intl.message(
      'In order to help people to interact with the social community in speed of light, moreover, make a great difference by giving and creating task for daily purposes.',
      name: 'textSpanLine1',
      desc: '',
      args: [],
    );
  }

  /// `In terms of solution, Kyan is going to help guide people to have discipline and secure plan so as to achieve their goals on time. Plus, by using this app, everyone will get easily close-knit with each other in the current digital era.`
  String get textSpanLine2 {
    return Intl.message(
      'In terms of solution, Kyan is going to help guide people to have discipline and secure plan so as to achieve their goals on time. Plus, by using this app, everyone will get easily close-knit with each other in the current digital era.',
      name: 'textSpanLine2',
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

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Swich language now! Please wait a minute`
  String get notiRestartApp {
    return Intl.message(
      'Swich language now! Please wait a minute',
      name: 'notiRestartApp',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
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