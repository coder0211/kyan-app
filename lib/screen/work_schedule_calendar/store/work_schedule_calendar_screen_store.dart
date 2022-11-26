import 'package:coder0211/coder0211.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

part 'work_schedule_calendar_screen_store.g.dart';

class WorkScheduleScreenStore = _WorkScheduleScreenStore
    with _$WorkScheduleScreenStore;

abstract class _WorkScheduleScreenStore with Store, BaseStoreMixin {
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
