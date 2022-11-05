import 'package:coder0211/coder0211.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kyan/const/consts.dart';
import 'package:kyan/generated/l10n.dart';
import 'package:kyan/manager/manager_address.dart';
import 'package:kyan/manager/manager_key_storage.dart';
import 'package:kyan/manager/manager_path_routes.dart';
import 'package:kyan/models/account.dart';
import 'package:kyan/theme/colors.dart';
import 'package:mobx/mobx.dart';
part 'login_screen_store.g.dart';

class LoginScreenStore = _LoginScreenStore with _$LoginScreenStore;

abstract class _LoginScreenStore with Store, BaseStoreMixin {
  //? --      Variables      -->
  @observable
  late GoogleSignIn googleSignIn = GoogleSignIn();

  @observable
  Account currentAccount = Account();

  @observable
  GoogleSignInAccount? googleSignInAccount;

  @observable
  bool _isShowLoading = false;

  bool get isShowLoading => _isShowLoading;

  set isShowLoading(bool isShowLoading) {
    _isShowLoading = isShowLoading;
  }

  BaseAPI _baseAPI = BaseAPI();

  //? --      Funtions      -->

  @override
  void onInit(BuildContext context) {
    if (defaultTargetPlatform == TargetPlatform.android ||
        defaultTargetPlatform == TargetPlatform.iOS) {
      googleSignIn = GoogleSignIn();
    } else {
      googleSignIn = GoogleSignIn(
        clientId:
            '445878881342-s7rnna3d4urps00ov0u7ve44qo403hef.apps.googleusercontent.com',
        scopes: <String>[
          'email',
          'https://www.googleapis.com/auth/contacts.readonly',
        ],
      );
    }
  }

  @override
  void onDispose(BuildContext context) {}

  @override
  Future<void> onWidgetBuildDone(BuildContext context) async {}

  @override
  void resetValue() {
    currentAccount = Account();
  }

  @action
  Future<void> onPressLogin(BuildContext context) async {
    await handleSignIn();
    if (currentAccount.accountId != null &&
        currentAccount.accountToken != null) {
      if (currentAccount.accountUrlPhoto == null ||
          currentAccount.accountUrlPhoto == '')
        currentAccount.accountUrlPhoto = DEFAULT_AVATAR;
      isShowLoading = true;
      await _baseAPI
          .fetchData(ManagerAddress.accountCreateOrUpdate,
              body: currentAccount.toJson(), method: ApiMethod.POST)
          .then((value) async {
        switch (value.apiStatus) {
          case ApiStatus.SUCCEEDED:
            {
              await _baseAPI
                  .fetchData(ManagerAddress.accountLogin,
                      body: {'mail': currentAccount.accountMail},
                      method: ApiMethod.POST)
                  .then((value) async {
                switch (value.apiStatus) {
                  case ApiStatus.SUCCEEDED:
                    {
                      currentAccount = Account.fromJson(value.object);
                      await BaseSharedPreferences.saveStringValue(
                          ManagerKeyStorage.accessToken,
                          currentAccount.accountAccessToken ?? '');
                      BaseNavigation.push(context,
                          routeName: ManagerRoutes.mainScreen,
                          clearStack: true);
                      break;
                    }
                  default:
                    {
                      printLogError('FAILED');
                      BaseUtils.showToast(S.of(context).loginFailed,
                          bgColor: AppColors.redPink);
                      if (await BaseSharedPreferences.containKey(
                          ManagerKeyStorage.accessToken)) {
                        await BaseSharedPreferences.remove(
                            ManagerKeyStorage.accessToken);
                      }
                      googleSignIn.disconnect();
                      resetValue();
                      break;
                    }
                }
              });
              break;
            }
          case ApiStatus.INTERNET_UNAVAILABLE:
            {
              printLogYellow('INTERNET_UNAVAILABLE');
              BaseUtils.showToast(S.of(context).internetUnavaiable,
                  bgColor: Colors.red);
              break;
            }
          default:
            {
              printLogError('FAILED');
              BaseUtils.showToast(S.of(context).loginFailed,
                  bgColor: AppColors.redPink);
              if (await BaseSharedPreferences.containKey(
                  ManagerKeyStorage.accessToken)) {
                await BaseSharedPreferences.remove(
                    ManagerKeyStorage.accessToken);
              }
              googleSignIn.disconnect();
              resetValue();
              break;
            }
        }
      });
    } else {
      BaseUtils.showToast(S.of(context).loginFailed,
          bgColor: AppColors.redPink);
    }
    isShowLoading = false;
  }

  Future<void> handleSignIn() async {
    try {
      print('Login with google');
      googleSignInAccount = await googleSignIn.signIn();
      var googleKey = await googleSignInAccount?.authentication;
      await handleGetData(accessToken: googleKey?.accessToken);
    } catch (err) {
      throw err;
    }
  }

  @action
  Future<void> handleGetData({String? accessToken}) async {
    GoogleSignInAccount? account = googleSignIn.currentUser;
    currentAccount = Account(
        accountId: account?.id,
        accountMail: account?.email,
        accountDisplayName: account?.displayName,
        accountUrlPhoto: account?.photoUrl,
        accountToken: accessToken);
    if (await BaseSharedPreferences.containKey(ManagerKeyStorage.accessToken)) {
      currentAccount.accountAccessToken =
          await BaseSharedPreferences.getStringValue(
              ManagerKeyStorage.accessToken);
    }
  }

  @action
  Future<void> handleSignOut(BuildContext context) async {
    googleSignIn.disconnect();
    BaseNavigation.push(context,
        routeName: ManagerRoutes.loginScreen, clearStack: true);
    if (await BaseSharedPreferences.containKey(
        ManagerKeyStorage.currentWorkspace)) {
      BaseSharedPreferences.remove(ManagerKeyStorage.currentWorkspace);
    }
    if (await BaseSharedPreferences.containKey(ManagerKeyStorage.accessToken)) {
      await BaseSharedPreferences.remove(ManagerKeyStorage.accessToken);
    }
  }

  @action
  Future<void> handleSignInSlient() => googleSignIn.signInSilently();
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
