import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'statistic_screen_store.g.dart';

class StatisticScreenStore = _StatisticScreenStore with _$StatisticScreenStore;

abstract class _StatisticScreenStore with Store, BaseStoreMixin {
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
