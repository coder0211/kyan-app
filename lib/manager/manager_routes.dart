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
  static String loginScreen = '/LoginScreen';
  static String mainScreen = '/MainScreen';
  static String introScreen = '/introScreen';

  /// ## Manager contain all action routes of the app
  /// * [splashScreen] is the splash screen of the app and it is the first screen of the app
  static Map<String, Widget Function(BuildContext context)> manager = {
    splashScreen: (context) => const SplashScreen(),
    loginScreen: (context) => const LoginScreen(),
    mainScreen: (context) => const MainScreen(),
    introScreen: (context) => IntroScreen()
  };
}
