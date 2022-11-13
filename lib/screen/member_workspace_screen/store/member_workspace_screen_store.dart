import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:kyan/manager/manager_address.dart';
import 'package:kyan/manager/manager_key_storage.dart';
import 'package:kyan/models/account.dart';
import 'package:kyan/models/workspace.dart';
import 'package:kyan/screen/login_screen/store/login_screen_store.dart';
import 'package:kyan/screen/main_screen/store/main_screen_store.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

part 'member_workspace_screen_store.g.dart';

class MemberWorkspaceScreenStore = _MemberWorkspaceScreenStore
    with _$MemberWorkspaceScreenStore;

abstract class _MemberWorkspaceScreenStore with Store, BaseStoreMixin {
  //? --      Variables      -->

  BaseAPI _baseAPI = BaseAPI();
  late String accessToken;
  late MainScreenStore _mainScreenStore;
  late LoginScreenStore _loginScreenStore;
  late MemberWorkspaceScreenStore _memberWorkspaceScreenStore;
  @observable
  ObservableList<Account> members = new ObservableList<Account>();

  @observable
  Workspace workspace = Workspace();

  //? --      Funtions      -->

  @override
  void onInit(BuildContext context) {
    _mainScreenStore = context.read<MainScreenStore>();
    _loginScreenStore = context.read<LoginScreenStore>();
    _memberWorkspaceScreenStore = context.read<MemberWorkspaceScreenStore>();
    members = new ObservableList<Account>();
  }

  @override
  Future<void> onDispose(BuildContext context) async {
    await _memberWorkspaceScreenStore.getMembersWorkspace(context);
  }

  @override
  Future<void> onWidgetBuildDone(BuildContext context) async {
    await _memberWorkspaceScreenStore.getMembersWorkspace(context);
  }

  @override
  void resetValue() {}

  int checkIsOwnerMember() {
    for (int i = 0; i < members.length; i++) {
      if (members.elementAt(i).workspaceMemberIsOwner == 1 &&
          members.elementAt(i).accountId.toString() ==
              _loginScreenStore.currentAccount.accountId) {
        print(_loginScreenStore.currentAccount.accountMail);
        return 1;
      }
    }
    return 0;
  }

  @action
  Future<void> getMembersWorkspace(BuildContext context) async {
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
            workspace = Workspace.fromJson(value.object);
            members.clear();
            members.addAll(workspace.members ?? []);
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

  @action
  Future<void> onClickDelete(BuildContext context,
      {required String accountId}) async {
    if (await BaseSharedPreferences.containKey(ManagerKeyStorage.accessToken)) {
      accessToken = await BaseSharedPreferences.getStringValue(
          ManagerKeyStorage.accessToken);
    }
    Map<String, dynamic> headers = {'Authorization': accessToken};
    Map<String, dynamic> body = {
      'workspaceId': BaseNavigation.getArgs(context, key: 'workspaceId'),
      'accountId': accountId.toString()
    };
    await _baseAPI
        .fetchData(ManagerAddress.memberWorkspaceDelete,
            method: ApiMethod.DELETE, headers: headers, body: body)
        .then((value) async {
      switch (value.apiStatus) {
        case ApiStatus.SUCCEEDED:
          {
            printLogSusscess('SUCCEEDED');
            BaseNavigation.pop(context);

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
    await _memberWorkspaceScreenStore.getMembersWorkspace(context);
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
