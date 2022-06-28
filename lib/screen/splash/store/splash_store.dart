import 'package:coder0211/coder0211.dart';
import 'package:mobx/mobx.dart';

part 'splash_store.g.dart';

class SplashStore = _SplashStore with _$SplashStore;

abstract class _SplashStore with Store, BaseStoreMixin {
  @override
  void onInit() {}

  @override
  void onDispose() {}

  @override
  Future<void> onWidgetBuildDone() async {
    await _splashScreenDelay();
  }

  @override
  void resetValue() {}

  Future<void> _splashScreenDelay() async {}
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
