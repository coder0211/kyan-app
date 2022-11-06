import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:kyan/manager/manager_address.dart';
import 'package:kyan/manager/manager_key_storage.dart';
import 'package:kyan/models/account.dart';
import 'package:kyan/screen/member_workspace_screen/store/member_workspace_screen_store.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

part 'select_people_screen_store.g.dart';

class SelectPeopleScreenStore = _SelectPeopleScreenStore
    with _$SelectPeopleScreenStore;

abstract class _SelectPeopleScreenStore with Store, BaseStoreMixin {
  BaseAPI _baseAPI = new BaseAPI();
  @observable
  Account currentAccount = Account();
  late MemberWorkspaceScreenStore _memberWorkspaceScreenStore;
  late String accessToken;
  late TextEditingController emailSearchController = TextEditingController();
  @observable
  ObservableList<Account> peoples = ObservableList<Account>();
  @observable
  ObservableList<Account> selectedPeoples = ObservableList<Account>();
  @observable
  bool _selectedAll = false;

  bool get selectedAll => _selectedAll;

  set selectedAll(bool selectedAll) {
    _selectedAll = selectedAll;
  }

  @override
  void onInit(BuildContext context) {
    _memberWorkspaceScreenStore = context.read<MemberWorkspaceScreenStore>();
  }

  @override
  Future<void> onDispose(BuildContext context) async {
    await _memberWorkspaceScreenStore.getMembersWorkspace(context);
    resetValue();
  }

  @override
  Future<void> onWidgetBuildDone(BuildContext context) async {}

  @override
  void resetValue() {
    selectedAll = false;
    emailSearchController.text = '';
    peoples = ObservableList<Account>();
    selectedPeoples = ObservableList<Account>();
  }

  @action
  void onTapItem({required Account account}) {
    if (selectedPeoples.contains(account)) {
      peoples.remove(account);
      account.isSelected = false;
      peoples.add(account);
      selectedPeoples.remove(account);
    } else if (!selectedPeoples.contains(account)) {
      peoples.remove(account);
      account.isSelected = true;
      peoples.add(account);
      selectedPeoples.add(account);
    }
  }

  @action
  void onTapSelectedAll() {
    selectedAll = !selectedAll;
    if (selectedAll) {
      peoples.forEach((element) {
        element.isSelected = true;
        selectedPeoples.add(element);
      });
    } else {
      peoples.forEach((element) {
        element.isSelected = false;
        selectedPeoples.remove(element);
      });
    }
  }

  @action
  Future<void> onClickAddMemberDone(BuildContext context,
      {required String email, required bool isSelected}) async {
    if (await BaseSharedPreferences.containKey(ManagerKeyStorage.accessToken)) {
      accessToken = await BaseSharedPreferences.getStringValue(
          ManagerKeyStorage.accessToken);
    }
    Map<String, dynamic> headers = {
      'Authorization': accessToken,
    };
    selectedPeoples.forEach((element) async {
      Map<String, dynamic> body = {
        'workspaceId': BaseNavigation.getArgs(context, key: 'workspaceId'),
        'accountId': element.accountId,
        'workspaceMemberIsOwner': 0,
      };
      await _baseAPI
          .fetchData(ManagerAddress.addMemberWorkspace,
              body: body, headers: headers, method: ApiMethod.POST)
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
    });
    peoples = ObservableList<Account>();
    selectedPeoples = ObservableList<Account>();
    emailSearchController.text = '';
    await _memberWorkspaceScreenStore.getMembersWorkspace(context);
    BaseNavigation.pop(context);
  }

  @action
  Future<void> getPeople(BuildContext context, {required String email}) async {
    if (await BaseSharedPreferences.containKey(ManagerKeyStorage.accessToken)) {
      accessToken = await BaseSharedPreferences.getStringValue(
          ManagerKeyStorage.accessToken);
    }
    Map<String, dynamic> headers = {
      'Authorization': accessToken,
    };

    Map<String, dynamic> params = {
      'accountMail': emailSearchController.text.toString(),
    };
    await _baseAPI
        .fetchData(
            ManagerAddress.accountGetOne +
                '/' +
                emailSearchController.text.toString(),
            // params: params,
            headers: headers,
            method: ApiMethod.GET)
        .then((value) {
      switch (value.apiStatus) {
        case ApiStatus.SUCCEEDED:
          {
            peoples.clear();
            peoples.add(Account.fromJson(value.object));
            break;
          }
        case ApiStatus.INTERNET_UNAVAILABLE:
          {
            printLogYellow('INTERNET_UNAVAILABLE');
            BaseUtils.showToast('INTERNET UNAVAILABLE', bgColor: Colors.red);

            break;
          }
        default:
          printLogError('FAILED');
          // Handle failed response here
          break;
      }
    });
  }

  void checkSelectedItem() {
    peoples.forEach((element) {
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
