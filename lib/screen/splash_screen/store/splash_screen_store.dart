import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kyan/const/consts.dart';
import 'package:kyan/manager/manager_key_storage.dart';
import 'package:kyan/manager/manager_path_routes.dart';
import 'package:kyan/screen/login_screen/store/login_screen_store.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

part 'splash_screen_store.g.dart';

class SplashScreenStore = _SplashScreenStore with _$SplashScreenStore;

abstract class _SplashScreenStore with Store, BaseStoreMixin {
  @observable
  GoogleSignIn googleSignIn = GoogleSignIn();

  late LoginScreenStore _loginScreenStore;

  @override
  void onInit(BuildContext context) {
    _loginScreenStore = context.read<LoginScreenStore>();
  }

  @override
  void onDispose() {}

  @override
  Future<void> onWidgetBuildDone(BuildContext context) async {
    await _splashScreenDelay(context);
  }

  @override
  void resetValue() {}

  Future<void> _splashScreenDelay(BuildContext context) async {
    await _loginScreenStore.handleSignInSlient();
    await _loginScreenStore.handleGetData();
    await Future.delayed(const Duration(seconds: DELAY_SPLASH_SCREEN));
    if (!(await BaseSharedPreferences.containKey(ManagerKeyStorage.isFirst))) {
      BaseNavigation.push(context,
          routeName: ManagerRoutes.introScreen, clearStack: true);
    } else if (_loginScreenStore.currentAccount.accountAccessToken != null &&
        _loginScreenStore.currentAccount.accountAccessToken != '') {
      BaseNavigation.push(context,
          routeName: ManagerRoutes.mainScreen, clearStack: true);
    } else {
      BaseNavigation.push(context,
          routeName: ManagerRoutes.loginScreen, clearStack: true);
    }
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
