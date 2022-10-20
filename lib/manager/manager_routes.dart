part of 'manager_path_routes.dart';

/// ## Manager Path Routes contain all the path of the app
/// * Example:
/// ```dart
/// static String splashScreen = '/';
/// ```
///
/// * Example:
/// ```dart
/// splashScreen: (context) => SplashScreen(),
/// ```
class ManagerRoutes {
  ManagerRoutes._();

  static String splashScreen = '/';
  static String loginScreen = '/login-screen';
  static String mainScreen = '/main-screen';
  static String introScreen = '/intro-screen';
  static String taskScreen = '/task-screen';
  static String createWorkspaceScreen = '/createWorkspace-screen';
  static String searchCodeJoinScreen = '/searchCodeJoin-screen';
  static String staticScreen = '/static-screen';
  static String botScreen = '/bot-screen';
  static String pomodoroBotScreen = '/bot-screen';
  static String memberWorkspaceScreen = '/member-worksapce-screen';
  static String createTaskScreen = '/member-task-screen';
  static String teamTasksScreen = '/team-tasks-screen';
  static String infoChannelScreen = '/info-channel-screen';
  static String conversationScreen = '/conversation-screen';
  static String chatScreen = '/chat-screen';
  static String profileScreen = '/profile-screen';
  static String listMessageScreen = '/list-message-screen';
  static String selectPeopleScreen = '/select-people-screen';
  static String selectPeopleConversationScreen =
      '/select-people-conversation-screen';

  /// ## Manager contain all action routes of the app
  /// * [splashScreen] is the splash screen of the app and it is the first screen of the app
  static Map<String, Widget Function(BuildContext context)> manager = {
    splashScreen: (context) => const SplashScreen(),
    loginScreen: (context) => const LoginScreen(),
    mainScreen: (context) => const MainScreen(),
    introScreen: (context) => IntroScreen(),
    searchCodeJoinScreen: (context) => const SearchCodeJoinScreen(),
    staticScreen: (context) => const StatisticScreen(),
    botScreen: (context) => const BotScreen(),
    pomodoroBotScreen: (context) => const PomodoroBotScreen(),
    createWorkspaceScreen: (context) => const CreateWorkspaceScreen(),
    memberWorkspaceScreen: (context) => const MemberWorkspaceSceen(),
    memberWorkspaceScreen: (context) => const MemberWorkspaceSceen(),
    createTaskScreen: (context) => const CreateTaskScreen(),
    teamTasksScreen: (context) => const TeamTasksScreen(),
    conversationScreen: (context) => const ConversationScreen(),
    chatScreen: (context) => const ChatScreen(),
    profileScreen: (context) => const ProfileScreen(),
    infoChannelScreen: (context) => const InfoChannelScreen(
          agrs: null,
          isChannel: true,
          isPrivate: false,
          title: '',
          urlAvatar: '',
        ),
    listMessageScreen: (context) => const ListMessageScreen(
          agrs: null,
        ),
    selectPeopleScreen: (context) => const SelectPeopleScreen(),
    selectPeopleConversationScreen: (context) =>
        const SelectPeopleConversationScreen(),
  };
}
