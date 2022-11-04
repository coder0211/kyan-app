import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:kyan/manager/manager_address.dart';
import 'package:kyan/manager/manager_key_storage.dart';
import 'package:kyan/manager/manager_path_routes.dart';
import 'package:kyan/models/account.dart';
import 'package:mobx/mobx.dart';

part 'select_people_screen_store.g.dart';

class SelectPeopleScreenStore = _SelectPeopleScreenStore
    with _$SelectPeopleScreenStore;

abstract class _SelectPeopleScreenStore with Store, BaseStoreMixin {
  BaseAPI _baseAPI = new BaseAPI();
  @observable
  Account currentAccount = Account();
  late TextEditingController emailSearchController = TextEditingController();
  @observable
  ObservableList<Account> people = ObservableList<Account>();
  @observable
  ObservableList<Account> selectedPeople = ObservableList<Account>();
  @observable
  bool _selectedAll = false;

  bool get selectedAll => _selectedAll;

  set selectedAll(bool selectedAll) {
    _selectedAll = selectedAll;
  }

  @observable
  bool _isShowLoading = true;

  bool get isShowLoading => _isShowLoading;

  set isShowLoading(bool isShowLoading) {
    _isShowLoading = isShowLoading;
  }

  late String accessToken;
  @override
  void onInit(BuildContext context) {}

  @override
  void onDispose(BuildContext context) {}

  @override
  Future<void> onWidgetBuildDone(BuildContext context) async {
    await getPeople(context, email: emailSearchController.text.toString());
  }

  @action
  void onTapItem({required int index}) {
    Account account = people.elementAt(index);
    people[index].isSelected = !people[index].isSelected;
    if (selectedPeople.contains(account)) {
      selectedPeople.remove(account);
    } else {
      selectedPeople.add(account);
    }
  }

  @action
  void onTapSelectedAll() {
    selectedAll = !selectedAll;
    if (selectedAll) {
      people.forEach((element) {
        element.isSelected = true;
        selectedPeople.add(element);
      });
    } else {
      people.forEach((element) {
        element.isSelected = false;
        selectedPeople.remove(element);
      });
    }
  }

  @action
  Future<void> onClickAddMemberDone(BuildContext context,
      {required String email}) async {
    if (await BaseSharedPreferences.containKey(ManagerKeyStorage.accessToken)) {
      accessToken = await BaseSharedPreferences.getStringValue(
          ManagerKeyStorage.accessToken);
    }
    Map<String, dynamic> headers = {
      'Authorization': accessToken,
    };
    Map<String, dynamic> body = {
      'workspaceId': BaseNavigation.getArgs(context, key: 'workspaceId'),
      'accountId': people.elementAt(people.length).accountId,
      'workspaceMemberIsOwner': 0,
    };
    await _baseAPI
        .fetchData(ManagerAddress.addMemberWorkspace,
            body: body, headers: headers, method: ApiMethod.POST)
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
      'accountMail': emailSearchController.text.toString().toLowerCase(),
    };
    await _baseAPI
        .fetchData(ManagerAddress.accountGetAll,
            params: params, headers: headers, method: ApiMethod.GET)
        .then((value) {
      switch (value.apiStatus) {
        case ApiStatus.SUCCEEDED:
          {
            people.clear();
            value.object.forEach((it) => people.add(Account.fromJson(it)));
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

  @override
  void resetValue() {
    isShowLoading = false;
    selectedAll = false;
    people = ObservableList<Account>();
    selectedPeople = ObservableList<Account>();
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
