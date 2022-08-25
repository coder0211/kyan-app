import 'package:coder0211/coder0211.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kyan/const/consts.dart';
import 'package:kyan/generated/l10n.dart';
import 'package:kyan/main.dart';
import 'package:kyan/manager/manager_address.dart';
import 'package:kyan/manager/manager_key_storage.dart';
import 'package:kyan/models/workspace.dart';
import 'package:kyan/screen/login_screen/store/login_screen_store.dart';
import 'package:kyan/theme/colors.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

part 'profile_screen_store.g.dart';

class ProfileScreenStore = _ProfileScreenStore with _$ProfileScreenStore;

abstract class _ProfileScreenStore with Store, BaseStoreMixin {
  //? --      Variable      -->

  late LoginScreenStore _loginScreenStore;
  @observable
  String _accountUrlPhoto = '';

  String get accountUrlPhoto => _accountUrlPhoto;

  set accountUrlPhoto(String accountUrlPhoto) {
    _accountUrlPhoto = accountUrlPhoto;
  }

  @observable
  String _localeLanguage = 'en';

  String get localeLanguage => _localeLanguage;

  set localeLanguage(String localeLanguage) {
    _localeLanguage = localeLanguage;
  }

  @observable
  String _accountMail = '';

  String get accountMail => _accountMail;

  set accountMail(String accountMail) {
    _accountMail = accountMail;
  }

  @observable
  String _accountDisplayName = '';

  String get accountDisplayName => _accountDisplayName;

  set accountDisplayName(String accountDisplayName) {
    _accountDisplayName = accountDisplayName;
  }

  @observable
  ObservableList<Workspace> _workspaces = ObservableList<Workspace>();

  ObservableList<Workspace> get workspaces => _workspaces;

  set workspaces(ObservableList<Workspace> workspaces) {
    _workspaces = workspaces;
  }

  @computed
  bool get isEn => localeLanguage == 'en';

  BaseAPI _baseAPI = BaseAPI();

  //? --      Funtions      -->

  @override
  void onInit(BuildContext context) {
    _loginScreenStore = context.read<LoginScreenStore>();
    accountUrlPhoto = _loginScreenStore.currentAccount.accountUrlPhoto ?? '';
    accountMail = _loginScreenStore.currentAccount.accountMail ?? '';
    accountDisplayName =
        _loginScreenStore.currentAccount.accountDisplayName ?? '';
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
  void onDispose(BuildContext context) {}

  @override
  Future<void> onWidgetBuildDone(BuildContext context) async {
    await _getLanguage(context);
    await getListWorkspace();
  }

  @override
  void resetValue() {}

  @action
  Future<void> setLanguages(BuildContext context,
      {required String languageCode}) async {
    if (localeLanguage != languageCode) {
      localeLanguage = languageCode;
      App.setLocale(context, Locale(languageCode));
      BaseUtils.showToast(S.current.notiRestartApp, bgColor: AppColors.primary);
      await Future.delayed(const Duration(milliseconds: TIME_ANIMATION));
      BaseSharedPreferences.saveStringValue(
          ManagerKeyStorage.language, languageCode);
      App.restartApp(context);
    }
  }

  @action
  Future<void> logout(BuildContext context) async {
    await _loginScreenStore.handleSignOut(context);
  }

  Future<void> _getLanguage(BuildContext context) async {
    if (await BaseSharedPreferences.containKey(ManagerKeyStorage.language)) {
      localeLanguage = await BaseSharedPreferences.getStringValue(
          ManagerKeyStorage.language);
    } else {
      localeLanguage = 'en';
    }
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
