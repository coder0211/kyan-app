import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:kyan/manager/manager_address.dart';
import 'package:kyan/manager/manager_key_storage.dart';
import 'package:kyan/models/account.dart';
import 'package:kyan/models/workspace.dart';
import 'package:kyan/screen/conversation_screen/store/conversation_screen_store.dart';
import 'package:kyan/screen/login_screen/store/login_screen_store.dart';
import 'package:kyan/screen/member_workspace_screen/store/member_workspace_screen_store.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

part 'select_people_channel_screen_store.g.dart';

class SelectPeopleChannelScreenStore = _SelectPeopleChannelScreenStore
    with _$SelectPeopleChannelScreenStore;

abstract class _SelectPeopleChannelScreenStore with Store, BaseStoreMixin {
  BaseAPI _baseAPI = new BaseAPI();
  @observable
  Account currentAccount = Account();
  late MemberWorkspaceScreenStore _memberWorkspaceScreenStore;
  late LoginScreenStore loginScreenStore;
  late ConversationScreenStore conversationScreenStore;
  late String accessToken;
  late TextEditingController emailSearchController = TextEditingController();
  @observable
  ObservableList<Account> members = ObservableList<Account>();
  @observable
  ObservableList<Account> selectedPeoples = ObservableList<Account>();
  @observable
  Workspace workspace = Workspace();

  @observable
  int? _currentWorkspaceId;

  int? get currentWorkspaceId => _currentWorkspaceId;

  set currentWorkspaceId(int? currentWorkspaceId) {
    _currentWorkspaceId = currentWorkspaceId;
  }

  @observable
  bool _selectedAll = false;

  bool get selectedAll => _selectedAll;

  set selectedAll(bool selectedAll) {
    _selectedAll = selectedAll;
  }

  @override
  void onInit(BuildContext context) {
    _memberWorkspaceScreenStore = context.read<MemberWorkspaceScreenStore>();
    loginScreenStore = context.read<LoginScreenStore>();
    conversationScreenStore = context.read<ConversationScreenStore>();
  }

  @override
  Future<void> onDispose(BuildContext context) async {
    resetValue();
  }

  @override
  Future<void> onWidgetBuildDone(BuildContext context) async {
    await _getWorkspaceId();
    await getMembersWorkspace(context);
    //await autoTapItem();
  }

  @override
  void resetValue() {
    selectedAll = false;
    emailSearchController.text = '';
    selectedPeoples = ObservableList<Account>();
    members = ObservableList<Account>();
  }

  @action
  int checkExist(Account account) {
    for (int i = 0; i < members.length; i++) {
      if (account.accountId.toString() ==
          (members.elementAt(i).accountId.toString())) {
        members.elementAt(i).isSelected = true;
        return 0;
      }
    }
    return 1;
  }

  @action
  void onTapItem({required Account account}) {
    if (!selectedPeoples.contains(account)) {
      members.remove(account);
      account.isSelected = true;
      members.add(account);
      selectedPeoples.add(account);
    } else if (selectedPeoples.contains(account)) {
      members.remove(account);
      account.isSelected = false;
      members.add(account);
      selectedPeoples.remove(account);
    }
  }

  @action
  void onTapSelectedAll() {
    selectedAll = !selectedAll;
    if (selectedAll) {
      members.forEach((element) {
        element.isSelected = true;
        selectedPeoples.add(element);
      });
    } else {
      members.forEach((element) {
        element.isSelected = false;
        selectedPeoples.remove(element);
      });
    }
  }

  Future<void> _getWorkspaceId() async {
    if (await BaseSharedPreferences.containKey(
        ManagerKeyStorage.currentWorkspace)) {
      currentWorkspaceId = int.tryParse(
              await BaseSharedPreferences.getStringValue(
                  ManagerKeyStorage.currentWorkspace)) ??
          -1;
    }
  }

  @action
  Future<void> getMembersWorkspace(BuildContext context) async {
    if (await BaseSharedPreferences.containKey(ManagerKeyStorage.accessToken)) {
      accessToken = await BaseSharedPreferences.getStringValue(
          ManagerKeyStorage.accessToken);
    }
    Map<String, dynamic> headers = {'Authorization': accessToken};
    Map<String, dynamic> params = {'id': currentWorkspaceId};
    if (currentWorkspaceId != null)
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

              print(members);
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
  Future<void> onClickAddMemberChatDone(BuildContext context,
      {required int id, required bool isSelected}) async {
    if (await BaseSharedPreferences.containKey(ManagerKeyStorage.accessToken)) {
      accessToken = await BaseSharedPreferences.getStringValue(
          ManagerKeyStorage.accessToken);
    }

    Map<String, dynamic> headers = {
      'Authorization': accessToken,
    };
    selectedPeoples.forEach((element) async {
      if (element.accountId == loginScreenStore.currentAccount.accountId) {
        Map<String, dynamic> body = {
          'channelId': id,
          'accountId': loginScreenStore.currentAccount.accountId,
          'channelMemberOwner': 1,
        };
        await _baseAPI
            .fetchData(ManagerAddress.createOrUpdateMembersChannel,
                headers: headers, body: body, method: ApiMethod.POST)
            .then((value) {
          switch (value.apiStatus) {
            case ApiStatus.SUCCEEDED:
              {
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
      } else {
        Map<String, dynamic> body = {
          'channelId': id,
          'accountId': element.accountId,
          'channelMemberOwner': 0,
        };
        await _baseAPI
            .fetchData(ManagerAddress.createOrUpdateMembersChannel,
                headers: headers, body: body, method: ApiMethod.POST)
            .then((value) {
          switch (value.apiStatus) {
            case ApiStatus.SUCCEEDED:
              {
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
    });
    selectedPeoples = ObservableList<Account>();
    members = ObservableList<Account>();
    emailSearchController.text = '';
    await _memberWorkspaceScreenStore.getMembersWorkspace(context);
    BaseNavigation.pop(context);
  }

  void checkSelectedItem() {
    members.forEach((element) {
      if (emailSearchController.text
          .toString()
          .contains(element.accountMail.toString())) {}
    });
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
