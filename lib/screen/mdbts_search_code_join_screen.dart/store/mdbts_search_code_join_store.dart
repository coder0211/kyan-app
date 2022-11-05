import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:kyan/manager/manager_address.dart';
import 'package:kyan/models/workspace.dart';
import 'package:kyan/screen/main_screen/store/main_screen_store.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

part 'mdbts_search_code_join_store.g.dart';

class SearchCodeJoinScreenStore = _SearchCodeJoinScreenStore
    with _$SearchCodeJoinScreenStore;

abstract class _SearchCodeJoinScreenStore with Store, BaseStoreMixin {
  BaseAPI _api = BaseAPI();
  late MainScreenStore _mainScreenStore;

  @override
  void onInit(BuildContext context) {
    _mainScreenStore = context.read<MainScreenStore>();
  }

  @override
  ObservableList<Workspace> _workspaces = new ObservableList<Workspace>();
  @override
  void onDispose(BuildContext context) {}
  @override
  Future<void> onWidgetBuildDone(BuildContext context) async {}

  @override
  void resetValue() {}
  @action
  Future<void> getListWorkspaces(BuildContext context) async {
    Map<String, dynamic> headers = {
      'Authorization': _mainScreenStore.accessToken
    };
    await _api
        .fetchData(ManagerAddress.workspacesGetByCodeJoin,
            headers: headers, method: ApiMethod.GET)
        .then((value) {
      switch (value.apiStatus) {
        case ApiStatus.SUCCEEDED:
          {
            printLogSusscess('SUCCEEDED');
          }
          break;
        case ApiStatus.INTERNET_UNAVAILABLE:
          printLogYellow('INTERNET_UNAVAILABLE');
          BaseUtils.showToast('INTERNET UNAVAILABLE', bgColor: Colors.red);
          break;
        default:
          printLogError('FAILED');
          // Handle failed response here
          break;
      }
    });
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
