import 'package:coder0211/coder0211.dart';
import 'package:flutter/cupertino.dart';
import 'package:kyan/manager/manager_key_storage.dart';
import 'package:mobx/mobx.dart';

part 'work_schedule_calendar_screen_store.g.dart';

class WorkScheduleScreenStore = _WorkScheduleScreenStore
    with _$WorkScheduleScreenStore;

abstract class _WorkScheduleScreenStore with Store, BaseStoreMixin {
  List<int> lst = [
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23
  ];
  @observable
  DateTime _selectedDate = DateTime.now();

  DateTime get selectedDate => _selectedDate;

  set selectedDate(DateTime selectedDate) {
    _selectedDate = selectedDate;
  }

  @observable
  String _localeKey = 'en';

  String get localeKey => _localeKey;
  set localeKey(String localeKey) {
    _localeKey = localeKey;
  }

  Future<void> _getLanguage(BuildContext context) async {
    if (await BaseSharedPreferences.containKey(ManagerKeyStorage.language)) {
      localeKey = await BaseSharedPreferences.getStringValue(
          ManagerKeyStorage.language);
    } else {
      localeKey = 'en';
    }
  }

  @override
  void onInit(BuildContext context) {}

  @override
  void onDispose(BuildContext context) {}

  @override
  Future<void> onWidgetBuildDone(BuildContext context) async {
    await _getLanguage(context);
  }

  @override
  void resetValue() {}

  //... Some values and actions
}
