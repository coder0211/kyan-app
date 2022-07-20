import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:kyan/manager/manager_key_storage.dart';
import 'package:kyan/manager/manager_path_routes.dart';
import 'package:mobx/mobx.dart';

part 'intro_screen_store.g.dart';

class IntroScreenStore = _IntroScreenStore with _$IntroScreenStore;

abstract class _IntroScreenStore with Store, BaseStoreMixin {
  @override
  void onInit(BuildContext context) {}

  @override
  void onDispose(BuildContext context) {}

  @override
  Future<void> onWidgetBuildDone(BuildContext context) async {}

  @override
  void resetValue() {}

  final introKey = GlobalKey<IntroductionScreenState>();

  @action
  void onIntroEnd(context) {
    BaseSharedPreferences.saveStringValue(
        ManagerKeyStorage.isFirst, ManagerKeyStorage.isFirst);
    BaseNavigation.push(context,
        routeName: ManagerRoutes.loginScreen, clearStack: true);
  }
}

/// We are using auto code generation to generate code for MobX store.
/// If we see any error with .g.dart file, try to run below command.
/// The 3rd command is recommended.
///
/// 1. Build (generate .g.dart):
///    flutter packages pub run build_runner build
/// 2. Build and Watch (update .g.dart automatically):
///    flutter packages pub run build_runner watch
/// 3. Clean before updating:
///    flutter packages pub run build_runner watch --delete-conflicting-outputs
