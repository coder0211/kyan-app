import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:kyan/manager/manager_address.dart';
import 'package:kyan/models/workspace.dart';
import 'package:mobx/mobx.dart';

part 'workspaces_screen_store.g.dart';

class WorkspacesScreenStore = _WorkspacesScreenStore
    with _$WorkspacesScreenStore;

abstract class _WorkspacesScreenStore with Store, BaseStoreMixin {
  BaseAPI _baseAPI = BaseAPI();
  @observable
  int? _currentWorkspaceId;

  int? get currentWorkspaceId => _currentWorkspaceId;

  set currentWorkspaceId(int? currentWorkspaceId) {
    _currentWorkspaceId = currentWorkspaceId;
  }

  @observable
  ObservableList<Workspace> _workspaces = ObservableList<Workspace>();

  ObservableList<Workspace> get workspaces => _workspaces;

  set workspaces(ObservableList<Workspace> workspaces) {
    _workspaces = workspaces;
  }

  Future<void> getListWorkspace() async {
    Map<String, dynamic> headers = {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiIxMTU3MjUyMDAxODc2NTUwNTE0NTQiLCJpYXQiOjE2NTgzNjk1NTAsImV4cCI6MTY2NzAwOTU1MH0.-ZXmXZinyRNx6Pi6QbqmuFM-Ftncj1x7w5FKUHa4XCk'
    };
    await _baseAPI
        .fetchData(ManagerAddress.workspacesGetAll, headers: headers)
        .then((value) {
      switch (value.apiStatus) {
        case ApiStatus.SUCCEEDED:
          {
            workspaces.clear();
            printLogSusscess('SUCCEEDED');
            value.object
                .forEach((it) => workspaces.add(Workspace.fromJson(it)));
            print(workspaces[0].toJson());
            break;
          }
        case ApiStatus.INTERNET_UNAVAILABLE:
          {
            printLogYellow('INTERNET_UNAVAILABLE');
            BaseUtils.showToast('INTERNET UNAVAILABLE', bgColor: Colors.red);
            break;
          }
        default:
          {
            printLogError('FAILED');
            // Handle failed response here
            break;
          }
      }
    });
  }

  @override
  void onInit(BuildContext context) {}

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