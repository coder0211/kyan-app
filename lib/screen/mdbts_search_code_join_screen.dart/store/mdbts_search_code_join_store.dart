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

  @action
  Future<void> getData() async {
    BaseAPI _api = BaseAPI();
    BaseAPI.domain = 'https://example.com';
    await _api.fetchData('/data', method: ApiMethod.GET).then((value) {
      switch (value.apiStatus) {
        case ApiStatus.SUCCEEDED:
          printLogSusscess('SUCCEEDED');
          // Handle success response here
          break;
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
  Future<void> onWidgetBuildDone(BuildContext context) async {}

  @override
  void resetValue() {}

  //... Some values and actions
}
