// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ConversationScreenStore on _ConversationScreenStore, Store {
  late final _$createChannelAtom =
      Atom(name: '_ConversationScreenStore.createChannel', context: context);

  @override
  Channel? get createChannel {
    _$createChannelAtom.reportRead();
    return super.createChannel;
  }

  @override
  set createChannel(Channel? value) {
    _$createChannelAtom.reportWrite(value, super.createChannel, () {
      super.createChannel = value;
    });
  }

  late final _$createChanelNameControllerAtom = Atom(
      name: '_ConversationScreenStore.createChanelNameController',
      context: context);

  @override
  TextEditingController get createChanelNameController {
    _$createChanelNameControllerAtom.reportRead();
    return super.createChanelNameController;
  }

  @override
  set createChanelNameController(TextEditingController value) {
    _$createChanelNameControllerAtom
        .reportWrite(value, super.createChanelNameController, () {
      super.createChanelNameController = value;
    });
  }

  late final _$searchControllerAtom =
      Atom(name: '_ConversationScreenStore.searchController', context: context);

  @override
  TextEditingController get searchController {
    _$searchControllerAtom.reportRead();
    return super.searchController;
  }

  @override
  set searchController(TextEditingController value) {
    _$searchControllerAtom.reportWrite(value, super.searchController, () {
      super.searchController = value;
    });
  }

  late final _$_isShowLoadingAtom =
      Atom(name: '_ConversationScreenStore._isShowLoading', context: context);

  @override
  bool get _isShowLoading {
    _$_isShowLoadingAtom.reportRead();
    return super._isShowLoading;
  }

  @override
  set _isShowLoading(bool value) {
    _$_isShowLoadingAtom.reportWrite(value, super._isShowLoading, () {
      super._isShowLoading = value;
    });
  }

  late final _$_isExpandedChannelAtom = Atom(
      name: '_ConversationScreenStore._isExpandedChannel', context: context);

  @override
  bool get _isExpandedChannel {
    _$_isExpandedChannelAtom.reportRead();
    return super._isExpandedChannel;
  }

  @override
  set _isExpandedChannel(bool value) {
    _$_isExpandedChannelAtom.reportWrite(value, super._isExpandedChannel, () {
      super._isExpandedChannel = value;
    });
  }

  late final _$_isExpandedPeopleAtom = Atom(
      name: '_ConversationScreenStore._isExpandedPeople', context: context);

  @override
  bool get _isExpandedPeople {
    _$_isExpandedPeopleAtom.reportRead();
    return super._isExpandedPeople;
  }

  @override
  set _isExpandedPeople(bool value) {
    _$_isExpandedPeopleAtom.reportWrite(value, super._isExpandedPeople, () {
      super._isExpandedPeople = value;
    });
  }

  late final _$_isPrivateCreateAtom =
      Atom(name: '_ConversationScreenStore._isPrivateCreate', context: context);

  @override
  bool get _isPrivateCreate {
    _$_isPrivateCreateAtom.reportRead();
    return super._isPrivateCreate;
  }

  @override
  set _isPrivateCreate(bool value) {
    _$_isPrivateCreateAtom.reportWrite(value, super._isPrivateCreate, () {
      super._isPrivateCreate = value;
    });
  }

  late final _$_currentWorkspaceIdAtom = Atom(
      name: '_ConversationScreenStore._currentWorkspaceId', context: context);

  @override
  int? get _currentWorkspaceId {
    _$_currentWorkspaceIdAtom.reportRead();
    return super._currentWorkspaceId;
  }

  @override
  set _currentWorkspaceId(int? value) {
    _$_currentWorkspaceIdAtom.reportWrite(value, super._currentWorkspaceId, () {
      super._currentWorkspaceId = value;
    });
  }

  late final _$_currentWorkspaceAtom = Atom(
      name: '_ConversationScreenStore._currentWorkspace', context: context);

  @override
  Workspace? get _currentWorkspace {
    _$_currentWorkspaceAtom.reportRead();
    return super._currentWorkspace;
  }

  @override
  set _currentWorkspace(Workspace? value) {
    _$_currentWorkspaceAtom.reportWrite(value, super._currentWorkspace, () {
      super._currentWorkspace = value;
    });
  }

  late final _$onCLickAddChannelChatAsyncAction = AsyncAction(
      '_ConversationScreenStore.onCLickAddChannelChat',
      context: context);

  @override
  Future<void> onCLickAddChannelChat(BuildContext context,
      {required Channel channel}) {
    return _$onCLickAddChannelChatAsyncAction
        .run(() => super.onCLickAddChannelChat(context, channel: channel));
  }

  late final _$saveCurrentWorkSpaceAsyncAction = AsyncAction(
      '_ConversationScreenStore.saveCurrentWorkSpace',
      context: context);

  @override
  Future<void> saveCurrentWorkSpace({required int? workspaceId}) {
    return _$saveCurrentWorkSpaceAsyncAction
        .run(() => super.saveCurrentWorkSpace(workspaceId: workspaceId));
  }

  @override
  String toString() {
    return '''
createChannel: ${createChannel},
createChanelNameController: ${createChanelNameController},
searchController: ${searchController}
    ''';
  }
}
