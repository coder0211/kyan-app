import 'dart:convert';

import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:kyan/manager/manager_key_storage.dart';
import 'package:mobx/mobx.dart';
part 'team_function_screen_store.g.dart';

class TeamFunctionScreenStore = _TeamFunctionScreenStore
    with _$TeamFunctionScreenStore;

abstract class _TeamFunctionScreenStore with Store, BaseStoreMixin {
  @observable
  int _workspaceId = -1;

  int get workspaceId => _workspaceId;

  set workspaceId(int workspaceId) {
    _workspaceId = workspaceId;
  }

  @override
  void onInit(BuildContext context) {}

  @override
  void onDispose(BuildContext context) {
    resetValue();
  }

  @override
  Future<void> onWidgetBuildDone(BuildContext context) async {
    if (await BaseSharedPreferences.containKey(
        ManagerKeyStorage.currentWorkspace)) {
      workspaceId = int.tryParse(await BaseSharedPreferences.getStringValue(
              ManagerKeyStorage.currentWorkspace)) ??
          -1;
    }
  }

  @override
  void resetValue() {}

  //... Some values and actions
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
