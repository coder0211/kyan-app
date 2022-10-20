import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:kyan/manager/manager_address.dart';
import 'package:kyan/manager/manager_path_routes.dart';
import 'package:kyan/models/account.dart';
import 'package:kyan/models/workspace.dart';
import 'package:kyan/screen/login_screen/store/login_screen_store.dart';
import 'package:kyan/utils/utils.dart';
import 'package:mobx/mobx.dart';
part 'create_workspace_screen_store.g.dart';

class CreateWorkspaceScreenStore = _CreateWorkspaceScreenStore
    with _$CreateWorkspaceScreenStore;

abstract class _CreateWorkspaceScreenStore with Store, BaseStoreMixin {
  BaseAPI _baseAPI = BaseAPI();
  @observable
  Account currentAccount = Account();
  @observable
  Workspace workspace = Workspace();
  @override
  void onInit(BuildContext context) {}

  @override
  void onDispose(BuildContext context) {}

  @override
  Future<void> onWidgetBuildDone(BuildContext context) async {}

  @action
  Future<void> onPressCreateWorkspace(BuildContext context,
      {required String workspaceName}) async {
    Map<String, dynamic>? body = {
      'workspaceName': workspaceName,
      'workspaceUrlPhoto':
          'https://cdn.dribbble.com/users/808936/screenshots/3395283/dribbble.gif',
      //'mailOwner': currentAccount.accountMail,
      'workspaceCodeJoin': 0,
    };
    await _baseAPI
        .fetchData(ManagerAddress.worksapceCreateOrUpdate,
            body: body, method: ApiMethod.POST)
        .then((value) {
      switch (value.apiStatus) {
        case ApiStatus.SUCCEEDED:
          {
            BaseNavigation.push(context,
                routeName: ManagerRoutes.mainScreen, clearStack: true);
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
  Future<void> saveCurrentWorkSpace({required int? workspaceId}) async {
    await Utils.saveCurrentWorkSpace(workspaceId.toString());
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
