import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:kyan/manager/manager_address.dart';
import 'package:kyan/manager/manager_key_storage.dart';
import 'package:kyan/models/account.dart';
import 'package:kyan/models/workspace.dart';
import 'package:kyan/screen/conversation_screen/store/conversation_screen_store.dart';
import 'package:kyan/screen/login_screen/store/login_screen_store.dart';
import 'package:kyan/screen/main_screen/store/main_screen_store.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

part 'select_people_conversation_screen_store.g.dart';

class SelectPeopleConversationScreenStore = _SelectPeopleConversationScreenStore
    with _$SelectPeopleConversationScreenStore;

abstract class _SelectPeopleConversationScreenStore with Store, BaseStoreMixin {
  late LoginScreenStore loginScreenStore;
  late ConversationScreenStore conversationScreenStore;
  late MainScreenStore mainScreenStore;
  @observable
  Workspace workspace = Workspace();
  @observable
  bool _selectedAll = false;

  bool get selectedAll => _selectedAll;

  set selectedAll(bool selectedAll) {
    _selectedAll = selectedAll;
  }

  @observable
  int? _currentWorkspaceId;

  int? get currentWorkspaceId => _currentWorkspaceId;

  set currentWorkspaceId(int? currentWorkspaceId) {
    _currentWorkspaceId = currentWorkspaceId;
  }

  @observable
  ObservableList<Account> peoples = ObservableList<Account>();

  @observable
  ObservableList<Account> selectedPeoples = ObservableList<Account>();

  BaseAPI _baseAPI = BaseAPI();
  @override
  void onInit(BuildContext context) {
    loginScreenStore = context.read<LoginScreenStore>();
    conversationScreenStore = context.read<ConversationScreenStore>();
    mainScreenStore = context.read<MainScreenStore>();
  }

  @override
  void onDispose(BuildContext context) {}

  @override
  Future<void> onWidgetBuildDone(BuildContext context) async {
    await _getWorkspaceId();
    await getPeoples(context);
  }

  @override
  void resetValue() {
    selectedAll = false;
    peoples = ObservableList<Account>();
    selectedPeoples = ObservableList<Account>();
    _baseAPI = BaseAPI();
  }

  @action
  Future<void> getPeoples(BuildContext context) async {
    Map<String, dynamic> headers = {
      'Authorization': mainScreenStore.accessToken
    };
    Map<String, dynamic> params = {'id': currentWorkspaceId};
    await _baseAPI
        .fetchData(ManagerAddress.workspacesGetOne,
            method: ApiMethod.GET, headers: headers, params: params)
        .then((value) {
      switch (value.apiStatus) {
        case ApiStatus.SUCCEEDED:
          {
            printLogSusscess('SUCCEEDED');
            workspace = Workspace.fromJson(value.object);
            peoples.clear();
            peoples.addAll(workspace.members ?? []);
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

  Future<void> onTapItem(BuildContext context,
      {required ConversationScreenStore conversationScreenStore,
      required int idWorkSpace,
      required String mailAccount,
      required String mailOwner}) async {}

  Future<void> _getWorkspaceId() async {
    if (await BaseSharedPreferences.containKey(
        ManagerKeyStorage.currentWorkspace)) {
      currentWorkspaceId = int.tryParse(
              await BaseSharedPreferences.getStringValue(
                  ManagerKeyStorage.currentWorkspace)) ??
          -1;
    }
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
