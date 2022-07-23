// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MainScreenStore on _MainScreenStore, Store {
  late final _$_indexTabBarAtom =
      Atom(name: '_MainScreenStore._indexTabBar', context: context);

  @override
  int get _indexTabBar {
    _$_indexTabBarAtom.reportRead();
    return super._indexTabBar;
  }

  @override
  set _indexTabBar(int value) {
    _$_indexTabBarAtom.reportWrite(value, super._indexTabBar, () {
      super._indexTabBar = value;
    });
  }

  late final _$_MainScreenStoreActionController =
      ActionController(name: '_MainScreenStore', context: context);

  @override
  void setIndexTabBar({required int value}) {
    final _$actionInfo = _$_MainScreenStoreActionController.startAction(
        name: '_MainScreenStore.setIndexTabBar');
    try {
      return super.setIndexTabBar(value: value);
    } finally {
      _$_MainScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onPressedAddTask(BuildContext context) {
    final _$actionInfo = _$_MainScreenStoreActionController.startAction(
        name: '_MainScreenStore.onPressedAddTask');
    try {
      return super.onPressedAddTask(context);
    } finally {
      _$_MainScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
