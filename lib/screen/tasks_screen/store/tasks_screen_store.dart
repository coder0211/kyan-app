import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:kyan/manager/manager_address.dart';
import 'package:kyan/manager/manager_key_storage.dart';
import 'package:kyan/models/task.dart';
import 'package:kyan/screen/login_screen/store/login_screen_store.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

part 'tasks_screen_store.g.dart';

class TasksScreenStore = _TasksScreenStore with _$TasksScreenStore;

abstract class _TasksScreenStore with Store, BaseStoreMixin {
  //? --      Variables      -->
  BaseAPI _api = BaseAPI();

  @observable
  ObservableList<Task> _tasks = ObservableList<Task>();
  ObservableList<Task> get tasks => _tasks;

  set tasks(ObservableList<Task> tasks) {
    _tasks = tasks;
  }

  late LoginScreenStore _loginScreenStore;

  @observable
  String _localeKey = 'en';

  String get localeKey => _localeKey;
  set localeKey(String localeKey) {
    _localeKey = localeKey;
  }

  @observable
  bool _isShowLoading = false;

  bool get isShowLoading => _isShowLoading;

  set isShowLoading(bool isShowLoading) {
    _isShowLoading = isShowLoading;
  }

  @observable
  String _accountUrlPhoto = '';

  String get accountUrlPhoto => _accountUrlPhoto;

  set accountUrlPhoto(String accountUrlPhoto) {
    _accountUrlPhoto = accountUrlPhoto;
  }

  @observable
  String _accountDisplayName = '';

  String get accountDisplayName => _accountDisplayName;

  set accountDisplayName(String accountDisplayName) {
    _accountDisplayName = accountDisplayName;
  }

  //? --      Funtions      -->

  @override
  void onInit(BuildContext context) {
    _loginScreenStore = context.read<LoginScreenStore>();
    accountUrlPhoto = _loginScreenStore.currentAccount.accountUrlPhoto ?? '';
    accountDisplayName =
        _loginScreenStore.currentAccount.accountDisplayName ?? '';
  }

  @override
  void onDispose(BuildContext context) {}

  @action
  String convertTimeTask(Task task) {
    DateTime g = new DateFormat('yyyy-MM-dd')
        .parse(task.taskDueTimeGTE.toString().split('T')[0]);
    DateTime l = DateFormat('yyyy-MM-dd')
        .parse(task.taskDueTimeLTE.toString().split('T')[0]);
    return DateFormat('dd/MM/yyyy').format(g) +
        (g != l ? (' - ' + DateFormat('dd/MM/yyyy').format(l)) : '');
  }

  @action
  Future<void> getListTask() async {
    Map<String, dynamic> headers = {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiIxMTU3MjUyMDAxODc2NTUwNTE0NTQiLCJpYXQiOjE2NTgzNjk1NTAsImV4cCI6MTY2NzAwOTU1MH0.-ZXmXZinyRNx6Pi6QbqmuFM-Ftncj1x7w5FKUHa4XCk'
    };

    await _api
        .fetchData(ManagerAddress.taskGetAll,
            method: ApiMethod.GET, headers: headers)
        .then((value) {
      switch (value.apiStatus) {
        case ApiStatus.SUCCEEDED:
          {
            printLogSusscess('SUCCEEDED');
            tasks.clear();
            value.object.forEach((it) => tasks.add(Task.fromJson(it)));
            // Handle success response here
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

  @override
  Future<void> onWidgetBuildDone(BuildContext context) async {
    await _getLanguage(context);
    await getListTask();
  }

  @override
  void resetValue() {}

  Future<void> _getLanguage(BuildContext context) async {
    if (await BaseSharedPreferences.containKey(ManagerKeyStorage.language)) {
      localeKey = await BaseSharedPreferences.getStringValue(
          ManagerKeyStorage.language);
    } else {
      localeKey = 'en';
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
