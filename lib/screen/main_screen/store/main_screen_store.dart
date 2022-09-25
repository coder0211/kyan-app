import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:kyan/manager/manager_path_routes.dart';
import 'package:kyan/screen/bot_screen/bot_screen.dart';
import 'package:kyan/screen/conversation_screen/conversation_screen.dart';
import 'package:kyan/screen/tasks_screen/tasks_screen.dart';
import 'package:mobx/mobx.dart';

part 'main_screen_store.g.dart';

class MainScreenStore = _MainScreenStore with _$MainScreenStore;

abstract class _MainScreenStore with Store, BaseStoreMixin {
  //? --      Variables      -->
  late PageController pageController;

  late List<Widget> screens;

  @observable
  int _indexTabBar = 0;

  int get indexTabBar => _indexTabBar;

  set indexTabBar(int indexTabBar) {
    _indexTabBar = indexTabBar;
  }

  //? --      Funtions      -->

  @override
  void onInit(BuildContext context) {
    pageController = PageController();
    screens = <Widget>[
      const TasksScreen(),
      const ConversationScreen(),
      const BotScreen(),
      'D'.d1()
    ];
  }

  @override
  void onDispose(BuildContext context) {
    pageController.dispose();
  }

  @override
  Future<void> onWidgetBuildDone(BuildContext context) async {}

  @override
  void resetValue() {
    indexTabBar = 0;
  }

  @action
  void setIndexTabBar({required int value}) {
    indexTabBar = value;
  }

  @action
  void onPressedAddTask(BuildContext context) {
    BaseNavigation.push(context,
        routeName: ManagerRoutes.createTaskScreen, clearStack: true);
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
