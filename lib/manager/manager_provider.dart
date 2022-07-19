import 'package:flutter/material.dart';
import 'package:kyan/screen/profile_screen/profie_screen.dart';
import 'package:kyan/screen/splash/store/splash_store.dart';
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
    Provider<SplashStore>(create: (_) => SplashStore()),
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
    context.read<SplashStore>().resetValue();
  }
}
