import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:kyan/screen/chat_sceen/store/chat_screen_store.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
part 'list_message_screen_store.g.dart';

class ListMessageScreenStore = _ListMessageScreenStore
    with _$ListMessageScreenStore;

abstract class _ListMessageScreenStore with Store, BaseStoreMixin {
  late ChatScreenStore chatScreenStore;
  @override
  void onInit(BuildContext context) {
    chatScreenStore = context.read<ChatScreenStore>();
  }

  @override
  void onDispose(BuildContext context) {}

  @override
  Future<void> onWidgetBuildDone(BuildContext context) async {}

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
