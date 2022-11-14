import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:kyan/manager/manager_address.dart';
import 'package:kyan/models/account.dart';
import 'package:kyan/models/workspace.dart';
import 'package:kyan/screen/login_screen/store/login_screen_store.dart';
import 'package:kyan/screen/main_screen/store/main_screen_store.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

part 'mdbts_search_code_join_store.g.dart';

class SearchCodeJoinScreenStore = _SearchCodeJoinScreenStore
    with _$SearchCodeJoinScreenStore;

abstract class _SearchCodeJoinScreenStore with Store, BaseStoreMixin {
  BaseAPI _api = BaseAPI();
  late MainScreenStore _mainScreenStore;
  late LoginScreenStore _longinScreenStore;
  late TextEditingController codeController = TextEditingController();

  late ObservableList<Account> membersWorkspaces = ObservableList<Account>();
  late ObservableList<Workspace> workspaces = new ObservableList<Workspace>();
  @override
  void onInit(BuildContext context) {
    _mainScreenStore = context.read<MainScreenStore>();
    _longinScreenStore = context.read<LoginScreenStore>();
  }

  @override
  void onDispose(BuildContext context) {}

  @override
  Future<void> onWidgetBuildDone(BuildContext context) async {}

  @override
  void resetValue() {
    //codeController.text = '';
  }

  int workspaceIsExist() {
    if (workspaces.length > 0) {
      for (int i = 0; i < membersWorkspaces.length; i++) {
        if (membersWorkspaces.elementAt(i).accountId.toString() ==
            _longinScreenStore.currentAccount.accountId.toString()) {
          //codeController.text = '';
          return 0;
        }
      }
    }
    //codeController.text = '';
    return 1;
  }

  @action
  Future<void> getMemberWorkspace(BuildContext context) async {
    Map<String, dynamic> headers = {
      'Authorization': _mainScreenStore.accessToken
    };
    Map<String, dynamic> params = {
      'workspaceId': workspaces.elementAt(0).workspaceId
    };
    await _api
        .fetchData(ManagerAddress.memberWorkspaceGetAll,
            headers: headers, params: params, method: ApiMethod.GET)
        .then((value) {
      switch (value.apiStatus) {
        case ApiStatus.SUCCEEDED:
          {
            printLogSusscess('SUCCEEDED');
            membersWorkspaces.clear();
            value.object
                .forEach((it) => membersWorkspaces.add(Account.fromJson(it)));
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

  @action
  Future<void> searchWorkspace(BuildContext context) async {
    Map<String, dynamic> headers = {
      'Authorization': _mainScreenStore.accessToken
    };
    Map<String, dynamic> params = {'codeJoin': codeController.text.toString()};
    await _api
        .fetchData(ManagerAddress.workspacesGetByCodeJoin,
            headers: headers, params: params, method: ApiMethod.GET)
        .then((value) {
      switch (value.apiStatus) {
        case ApiStatus.SUCCEEDED:
          {
            printLogSusscess('SUCCEEDED');
            workspaces.clear();
            value.object
                .forEach((it) => workspaces.add(Workspace.fromJson(it)));
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

  @action
  Future<void> onClickJoinWorkspace(BuildContext context) async {
    Map<String, dynamic> headers = {
      'Authorization': _mainScreenStore.accessToken,
    };
    Map<String, dynamic> body = {
      'workspaceId': workspaces.elementAt(0).workspaceId,
      'accountId': _longinScreenStore.currentAccount.accountId,
      'workspaceMemberIsOwner': 0,
    };
    await _api
        .fetchData(ManagerAddress.addMemberWorkspace,
            headers: headers, body: body, method: ApiMethod.POST)
        .then((value) {
      switch (value.apiStatus) {
        case ApiStatus.SUCCEEDED:
          {
            BaseNavigation.pop(context);
            printLogSusscess('SUCCEEDED');
          }
          break;
        case ApiStatus.INTERNET_UNAVAILABLE:
          printLogYellow('INTERNET_UNAVAILABLE');
          BaseUtils.showToast('INTERNET UNAVAILABLE', bgColor: Colors.red);
          break;
        default:
          printLogError('FAILED');
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
