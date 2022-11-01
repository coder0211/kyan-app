import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:kyan/manager/manager_address.dart';
import 'package:kyan/models/account.dart';
import 'package:kyan/models/workspace.dart';
import 'package:kyan/screen/main_screen/store/main_screen_store.dart';
import 'package:kyan/screen/profile_screen/store/profile_screen_store.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

part 'member_workspace_screen_store.g.dart';

class MemberWorkspaceScreenStore = _MemberWorkspaceScreenStore
    with _$MemberWorkspaceScreenStore;

abstract class _MemberWorkspaceScreenStore with Store, BaseStoreMixin {
  //? --      Variables      -->

  BaseAPI _baseAPI = BaseAPI();

  late MainScreenStore _mainScreenStore;

  @observable
  ObservableList<Account> members = ObservableList<Account>();

  @observable
  Workspace _workspace = Workspace();

  //? --      Funtions      -->

  @override
  void onInit(BuildContext context) {
    _mainScreenStore = context.read<MainScreenStore>();
  }

  @override
  void onDispose(BuildContext context) {}

  @override
  Future<void> onWidgetBuildDone(BuildContext context) async {
    await _getMembersWorkspace(context);
  }

  @override
  void resetValue() {}

  Future<void> _getMembersWorkspace(BuildContext context) async {
    Map<String, dynamic> headers = {
      'Authorization': _mainScreenStore.accessToken
    };
    Map<String, dynamic> params = {
      'id': BaseNavigation.getArgs(context, key: 'workspaceId')
    };
    await _baseAPI
        .fetchData(ManagerAddress.workspacesGetOne,
            method: ApiMethod.GET, headers: headers, params: params)
        .then((value) {
      switch (value.apiStatus) {
        case ApiStatus.SUCCEEDED:
          {
            printLogSusscess('SUCCEEDED');
            _workspace = Workspace.fromJson(value.object);
            members.clear();
            members.addAll(_workspace.members ?? []);
            break;
          }
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
