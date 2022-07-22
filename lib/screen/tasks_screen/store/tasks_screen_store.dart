import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:kyan/screen/login_screen/store/login_screen_store.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

part 'tasks_screen_store.g.dart';

class TasksScreenStore = _TasksScreenStore with _$TasksScreenStore;

abstract class _TasksScreenStore with Store, BaseStoreMixin {
  @observable
  bool isShowLoading = false;
  late LoginScreenStore _loginScreenStore;
  @observable
  String _accountUrlPhoto = '';

  String get accountUrlPhoto => _accountUrlPhoto;

  set accountUrlPhoto(String accountUrlPhoto) {
    _accountUrlPhoto = accountUrlPhoto;
  }

  @observable
  String _accountDisplayName = '';

  String get accountDisplayName => _accountDisplayName;

  set accountDisplayName(String accountDisplayName) {
    _accountDisplayName = accountDisplayName;
  }

  @override
  void onInit(BuildContext context) {
    _loginScreenStore = context.read<LoginScreenStore>();
    accountUrlPhoto = _loginScreenStore.currentAccount.accountUrlPhoto ?? '';
    accountDisplayName =
        _loginScreenStore.currentAccount.accountDisplayName ?? '';
  }

  @override
  void onDispose(BuildContext context) {}

  @override
  Future<void> onWidgetBuildDone(BuildContext context) async {}

  @override
  void resetValue() {}
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