import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'mdbts_search_code_join_store.g.dart';

class SearchCodeJoinScreenStore = _SearchCodeJoinScreenStore
    with _$SearchCodeJoinScreenStore;

abstract class _SearchCodeJoinScreenStore with Store, BaseStoreMixin {
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
