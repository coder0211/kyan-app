import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:kyan/models/account.dart';
import 'package:kyan/models/task.dart';
import 'package:kyan/screen/main_screen/store/main_screen_store.dart';
import 'package:mobx/mobx.dart';
import 'package:retrofit/http.dart';
import 'package:provider/provider.dart';
part 'team_tasks_screen_store.g.dart';

class TeamTasksScreenStore = _TeamTasksScreenStore with _$TeamTasksScreenStore;

abstract class _TeamTasksScreenStore with Store, BaseStoreMixin {
  late MainScreenStore mainScreenStore;
  @observable
  bool isShowLoading = true;
  @observable
  ObservableList<Task> tasksDoing = ObservableList<Task>();
  @observable
  ObservableList<Task> tasksDone = ObservableList<Task>();
  @observable
  Account _selectedAccount = Account();

  Account get selectedAccount => _selectedAccount;

  set selectedAccount(Account selectedAccount) {
    _selectedAccount = selectedAccount;
  }

  @override
  void onInit(BuildContext context) {
    mainScreenStore = context.read<MainScreenStore>();
  }

  @override
  void onDispose(BuildContext context) {}

  @override
  Future<void> onWidgetBuildDone(BuildContext context) async {}

  @override
  void resetValue() {
    selectedAccount = Account();
  }

  @action
  Future<void> getTasks(BuildContext context) async {
    Map<String, dynamic> headers = {
      'Authorization': mainScreenStore.accessToken,
    };
    Map<String, dynamic> body = {};
  }
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
