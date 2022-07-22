import 'package:flutter/material.dart';
import 'package:kyan/screen/intro_screen/store/intro_screen_store.dart';
import 'package:kyan/screen/login_screen/store/login_screen_store.dart';
import 'package:kyan/screen/main_screen/store/main_screen_store.dart';
import 'package:kyan/screen/profile_screen/profile_screen_store/profile_screen_store.dart';
import 'package:kyan/screen/splash_screen/store/splash_screen_store.dart';
import 'package:kyan/screen/tasks_screen/store/tasks_screen_store.dart';
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
  }
}
