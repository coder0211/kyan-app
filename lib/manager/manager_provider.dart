import 'package:flutter/material.dart';
import 'package:kyan/screen/Info_channel_screen/store/info_channel_screen_store.dart';
import 'package:kyan/screen/bot_screen/store/bot_screen_store.dart';
import 'package:kyan/screen/chat_sceen/store/chat_screen_store.dart';
import 'package:kyan/screen/conversation_screen/store/conversation_screen_store.dart';
import 'package:kyan/screen/create_task_screen/store/create_task_screen_store.dart';
import 'package:kyan/screen/create_workspace_screen/store/create_workspace_screen_store.dart';
import 'package:kyan/screen/intro_screen/store/intro_screen_store.dart';
import 'package:kyan/screen/login_screen/store/login_screen_store.dart';
import 'package:kyan/screen/main_screen/store/main_screen_store.dart';
import 'package:kyan/screen/mdbts_search_code_join_screen.dart/store/mdbts_search_code_join_store.dart';
import 'package:kyan/screen/member_workspace_screen/store/member_workspace_screen_store.dart';
import 'package:kyan/screen/pomodoro_bot_screen/store/pomodoro_bot_screen_store.dart';
import 'package:kyan/screen/profile_screen/store/profile_screen_store.dart';
import 'package:kyan/screen/select_people/store/select_people_screen_store.dart';
import 'package:kyan/screen/select_people_conversation_screen/select_people_conversation_screen.dart';
import 'package:kyan/screen/select_people_conversation_screen/store/select_people_conversation_screen_store.dart';
import 'package:kyan/screen/splash_screen/store/splash_screen_store.dart';
import 'package:kyan/screen/statistic_screen/store/statistic_screen_store.dart';
import 'package:kyan/screen/tasks_screen/store/tasks_screen_store.dart';
import 'package:kyan/screen/team_tasks_screen/store/team_tasks_screen_store.dart';
import 'package:kyan/screen/workspaces_screen/store/workspaces_screen_store.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class ManagerProvider {
  ManagerProvider._();

  /// ## Providers
  /// * Delare all manager provider here and use it in app
  /// * Example:
  /// ```dart
  /// Provider<Store>(create: (_) => Store())
  /// ```
  static List<SingleChildWidget> provider = [
    Provider<SplashScreenStore>(create: (_) => SplashScreenStore()),
    Provider<LoginScreenStore>(create: (_) => LoginScreenStore()),
    Provider<MainScreenStore>(create: (_) => MainScreenStore()),
    Provider<IntroScreenStore>(create: (_) => IntroScreenStore()),
    Provider<ProfileScreenStore>(create: (_) => ProfileScreenStore()),
    Provider<TasksScreenStore>(create: (_) => TasksScreenStore()),
    Provider<SearchCodeJoinScreenStore>(
        create: (_) => SearchCodeJoinScreenStore()),
    Provider<CreateWorkspaceScreenStore>(
        create: (_) => CreateWorkspaceScreenStore()),
    Provider<StatisticScreenStore>(create: (_) => StatisticScreenStore()),
    Provider<BotScreenStore>(create: (_) => BotScreenStore()),
    Provider<PomodoroBotScreenStore>(create: (_) => PomodoroBotScreenStore()),
    Provider<WorkspacesScreenStore>(create: (_) => WorkspacesScreenStore()),
    Provider<CreateWorkspaceScreenStore>(
        create: (_) => CreateWorkspaceScreenStore()),
    Provider<MemberWorkspaceScreenStore>(
        create: (_) => MemberWorkspaceScreenStore()),
    Provider<CreateTaskScreenStore>(create: (_) => CreateTaskScreenStore()),
    Provider<TeamTasksScreenStore>(create: (_) => TeamTasksScreenStore()),
    Provider<InfoChannelScreenStore>(create: (_) => InfoChannelScreenStore()),
    Provider<ConversationScreenStore>(create: (_) => ConversationScreenStore()),
    Provider<ChatScreenStore>(create: (_) => ChatScreenStore()),
    Provider<ProfileScreenStore>(create: (_) => ProfileScreenStore()),
    Provider<SelectPeopleScreenStore>(create: (_) => SelectPeopleScreenStore()),
    Provider<SelectPeopleConversationScreenStore>(
        create: (_) => SelectPeopleConversationScreenStore()),
  ];

  /// ## Dispose
  /// * context.read<Store>().resetValue();
  /// * [dispose] all manager provider here
  /// * Dispose all manager provider here and reset value in app
  /// * Example:
  /// ```dart
  /// context.read<Store>().resetValue();
  /// ```
  static Future<void> dispose(BuildContext context) async {
    context.read<SplashScreenStore>().resetValue();
    context.read<LoginScreenStore>().resetValue();
    context.read<MainScreenStore>().resetValue();
    context.read<IntroScreenStore>().resetValue();
    context.read<ProfileScreenStore>().resetValue();
    context.read<TasksScreenStore>().resetValue();
    context.read<SearchCodeJoinScreenStore>().resetValue();
    context.read<CreateWorkspaceScreenStore>().resetValue();
    context.read<StatisticScreenStore>().resetValue();
    context.read<BotScreenStore>().resetValue();
    context.read<PomodoroBotScreenStore>().resetValue();
    context.read<WorkspacesScreenStore>().resetValue();
    context.read<CreateWorkspaceScreenStore>().resetValue();
    context.read<MemberWorkspaceScreenStore>().resetValue();
    context.read<TeamTasksScreenStore>().resetValue();
    context.read<CreateTaskScreenStore>().resetValue();
    context.read<InfoChannelScreenStore>().resetValue();
    context.read<ConversationScreenStore>().resetValue();
    context.read<ChatScreenStore>().resetValue();
    context.read<ProfileScreenStore>().resetValue();
    context.read<SelectPeopleScreenStore>().resetValue();
    context.read<SelectPeopleConversationScreenStore>().resetValue();
  }
}
