import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:kyan/const/consts.dart';
import 'package:kyan/generated/l10n.dart';
import 'package:kyan/manager/manager_address.dart';
import 'package:kyan/manager/manager_key_storage.dart';
import 'package:kyan/manager/manager_provider.dart';
import 'package:kyan/models/workspace.dart';
import 'package:kyan/screen/app/store/app_store.dart';
import 'package:kyan/screen/login_screen/store/login_screen_store.dart';
import 'package:kyan/screen/main_screen/store/main_screen_store.dart';
import 'package:kyan/screen/member_workspace_screen/store/member_workspace_screen_store.dart';
import 'package:kyan/screen/statistic_screen/store/statistic_screen_store.dart';
import 'package:kyan/screen/tasks_screen/store/tasks_screen_store.dart';
import 'package:kyan/screen/team_tasks_screen/store/team_tasks_screen_store.dart';
import 'package:kyan/theme/colors.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

part 'profile_screen_store.g.dart';

class ProfileScreenStore = _ProfileScreenStore with _$ProfileScreenStore;

abstract class _ProfileScreenStore with Store, BaseStoreMixin {
  //? --      Variable      -->

  late LoginScreenStore _loginScreenStore;
  late MainScreenStore _mainScreenStore;
  late TasksScreenStore tasksScreenStore;
  late TeamTasksScreenStore teamTasksScreenStore;
  late MemberWorkspaceScreenStore memberWorkspaceScreenStore;
  BaseAPI _baseAPI = BaseAPI();
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

  @observable
  int _currentWorkspaceId = -1;

  int get currentWorkspaceId => _currentWorkspaceId;

  set currentWorkspaceId(int currentWorkspaceId) {
    _currentWorkspaceId = currentWorkspaceId;
  }
  //? --      Funtions      -->

  @override
  void onInit(BuildContext context) {
    _loginScreenStore = context.read<LoginScreenStore>();
    _mainScreenStore = context.read<MainScreenStore>();
    tasksScreenStore = context.read<TasksScreenStore>();
    accountUrlPhoto = _loginScreenStore.currentAccount.accountUrlPhoto ?? '';
    accountMail = _loginScreenStore.currentAccount.accountMail ?? '';
    accountDisplayName =
        _loginScreenStore.currentAccount.accountDisplayName ?? '';
  }

  @override
  void onDispose(BuildContext context) async {
    if (await BaseSharedPreferences.containKey(
        ManagerKeyStorage.currentWorkspace)) {
      currentWorkspaceId = int.tryParse(
              await BaseSharedPreferences.getStringValue(
                  ManagerKeyStorage.currentWorkspace)) ??
          -1;
    }
  }

  @override
  Future<void> onWidgetBuildDone(BuildContext context) async {
    if (await BaseSharedPreferences.containKey(
        ManagerKeyStorage.currentWorkspace)) {
      currentWorkspaceId = int.tryParse(
              await BaseSharedPreferences.getStringValue(
                  ManagerKeyStorage.currentWorkspace)) ??
          -1;
    }
    await _getLanguage(context);
    await getListWorkspace();
  }

  @override
  void resetValue() async {
    await BaseSharedPreferences.remove(ManagerKeyStorage.currentWorkspace);
  }

  @action
  Future<void> setLanguages(BuildContext context,
      {required String languageCode}) async {
    if (localeLanguage != languageCode) {
      localeLanguage = languageCode;
      context
          .read<AppStore>()
          .setLanguages(context, languageCode: languageCode);
      BaseUtils.showToast(S.of(context).notiRestartApp,
          bgColor: AppColors.primary);
      await Future.delayed(const Duration(milliseconds: TIME_ANIMATION));
      BaseSharedPreferences.saveStringValue(
          ManagerKeyStorage.language, languageCode);
    }
  }

  @action
  Future<void> logout(BuildContext context) async {
    await _loginScreenStore.handleSignOut(context);
    ManagerProvider.dispose(context);
  }

  Future<void> _getLanguage(BuildContext context) async {
    if (await BaseSharedPreferences.containKey(ManagerKeyStorage.language)) {
      localeLanguage = await BaseSharedPreferences.getStringValue(
          ManagerKeyStorage.language);
    } else {
      localeLanguage = 'en';
    }
  }

  Future<void> getListWorkspace() async {
    Map<String, dynamic> headers = {
      'Authorization': _mainScreenStore.accessToken
    };
    Map<String, dynamic> params = {
      'id_user': _loginScreenStore.currentAccount.accountId.toString()
    };
    await _baseAPI
        .fetchData(ManagerAddress.workspacesGetAllById,
            headers: headers, params: params)
        .then((value) {
      switch (value.apiStatus) {
        case ApiStatus.SUCCEEDED:
          {
            printLogSusscess('SUCCEEDED');
            workspaces.clear();
            value.object
                .forEach((it) => workspaces.add(Workspace.fromJson(it)));
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
            break;
          }
      }
    });
  }

  @action
  Future<void> onPressedWorkspace(BuildContext context,
      {required Workspace workspace}) async {
    await BaseSharedPreferences.saveStringValue(
        ManagerKeyStorage.currentWorkspace, workspace.workspaceId.toString());
    currentWorkspaceId = workspace.workspaceId ?? -1;
    context.read<MainScreenStore>().workspaceId = currentWorkspaceId;
    context.read<TasksScreenStore>().workspaceId = currentWorkspaceId;
    context.read<TeamTasksScreenStore>().currentWorkspaceId =
        currentWorkspaceId;
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
