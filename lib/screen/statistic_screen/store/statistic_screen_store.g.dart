// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statistic_screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StatisticScreenStore on _StatisticScreenStore, Store {
  late final _$_currentWorkspaceIdAtom =
      Atom(name: '_StatisticScreenStore._currentWorkspaceId', context: context);

  @override
  int get _currentWorkspaceId {
    _$_currentWorkspaceIdAtom.reportRead();
    return super._currentWorkspaceId;
  }

  @override
  set _currentWorkspaceId(int value) {
    _$_currentWorkspaceIdAtom.reportWrite(value, super._currentWorkspaceId, () {
      super._currentWorkspaceId = value;
    });
  }

  late final _$getPersonalStatisticAsyncAction = AsyncAction(
      '_StatisticScreenStore.getPersonalStatistic',
      context: context);

  @override
  Future<void> getPersonalStatistic(BuildContext context) {
    return _$getPersonalStatisticAsyncAction
        .run(() => super.getPersonalStatistic(context));
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
