// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ChatScreenStore on _ChatScreenStore, Store {
  late final _$messagesAtom =
      Atom(name: '_ChatScreenStore.messages', context: context);

  @override
  ObservableList<ChannelMessage> get messages {
    _$messagesAtom.reportRead();
    return super.messages;
  }

  @override
  set messages(ObservableList<ChannelMessage> value) {
    _$messagesAtom.reportWrite(value, super.messages, () {
      super.messages = value;
    });
  }

  late final _$memberChannelAtom =
      Atom(name: '_ChatScreenStore.memberChannel', context: context);

  @override
  ObservableList<Account> get memberChannel {
    _$memberChannelAtom.reportRead();
    return super.memberChannel;
  }

  @override
  set memberChannel(ObservableList<Account> value) {
    _$memberChannelAtom.reportWrite(value, super.memberChannel, () {
      super.memberChannel = value;
    });
  }

  late final _$channelAtom =
      Atom(name: '_ChatScreenStore.channel', context: context);

  @override
  Channel get channel {
    _$channelAtom.reportRead();
    return super.channel;
  }

  @override
  set channel(Channel value) {
    _$channelAtom.reportWrite(value, super.channel, () {
      super.channel = value;
    });
  }

  late final _$_currentChannelIdAtom =
      Atom(name: '_ChatScreenStore._currentChannelId', context: context);

  @override
  int? get _currentChannelId {
    _$_currentChannelIdAtom.reportRead();
    return super._currentChannelId;
  }

  @override
  set _currentChannelId(int? value) {
    _$_currentChannelIdAtom.reportWrite(value, super._currentChannelId, () {
      super._currentChannelId = value;
    });
  }

  late final _$_isShowLoadingAtom =
      Atom(name: '_ChatScreenStore._isShowLoading', context: context);

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

  late final _$_demoAtom =
      Atom(name: '_ChatScreenStore._demo', context: context);

  @override
  String get _demo {
    _$_demoAtom.reportRead();
    return super._demo;
  }

  @override
  set _demo(String value) {
    _$_demoAtom.reportWrite(value, super._demo, () {
      super._demo = value;
    });
  }

  late final _$scrollControllerAtom =
      Atom(name: '_ChatScreenStore.scrollController', context: context);

  @override
  ScrollController get scrollController {
    _$scrollControllerAtom.reportRead();
    return super.scrollController;
  }

  @override
  set scrollController(ScrollController value) {
    _$scrollControllerAtom.reportWrite(value, super.scrollController, () {
      super.scrollController = value;
    });
  }

  late final _$_isChannelAtom =
      Atom(name: '_ChatScreenStore._isChannel', context: context);

  @override
  bool get _isChannel {
    _$_isChannelAtom.reportRead();
    return super._isChannel;
  }

  @override
  set _isChannel(bool value) {
    _$_isChannelAtom.reportWrite(value, super._isChannel, () {
      super._isChannel = value;
    });
  }

  late final _$_spaceChatAtom =
      Atom(name: '_ChatScreenStore._spaceChat', context: context);

  @override
  dynamic get _spaceChat {
    _$_spaceChatAtom.reportRead();
    return super._spaceChat;
  }

  @override
  set _spaceChat(dynamic value) {
    _$_spaceChatAtom.reportWrite(value, super._spaceChat, () {
      super._spaceChat = value;
    });
  }

  late final _$getDataAsyncAction =
      AsyncAction('_ChatScreenStore.getData', context: context);

  @override
  Future<void> getData<T>(
      {required String accountId, required T value, bool isAdd = false}) {
    return _$getDataAsyncAction.run(() =>
        super.getData<T>(accountId: accountId, value: value, isAdd: isAdd));
  }

  late final _$loadMoreAsyncAction =
      AsyncAction('_ChatScreenStore.loadMore', context: context);

  @override
  Future<void> loadMore<T>({required String accountId, required T value}) {
    return _$loadMoreAsyncAction
        .run(() => super.loadMore<T>(accountId: accountId, value: value));
  }

  late final _$sendMessageConversationSocketAsyncAction = AsyncAction(
      '_ChatScreenStore.sendMessageConversationSocket',
      context: context);

  @override
  Future<void> sendMessageConversationSocket(String content,
      {required String mailSend, required Conversation conversation}) {
    return _$sendMessageConversationSocketAsyncAction.run(() => super
        .sendMessageConversationSocket(content,
            mailSend: mailSend, conversation: conversation));
  }

  late final _$receiveMessageConversationSocketAsyncAction = AsyncAction(
      '_ChatScreenStore.receiveMessageConversationSocket',
      context: context);

  @override
  Future<void> receiveMessageConversationSocket(
      {required Future<void> function}) {
    return _$receiveMessageConversationSocketAsyncAction
        .run(() => super.receiveMessageConversationSocket(function: function));
  }

  late final _$sendMessageChannelSocketAsyncAction = AsyncAction(
      '_ChatScreenStore.sendMessageChannelSocket',
      context: context);

  @override
  Future<void> sendMessageChannelSocket(String content) {
    return _$sendMessageChannelSocketAsyncAction
        .run(() => super.sendMessageChannelSocket(content));
  }

  late final _$receiveMessageChannelSocketAsyncAction = AsyncAction(
      '_ChatScreenStore.receiveMessageChannelSocket',
      context: context);

  @override
  Future<void> receiveMessageChannelSocket({required Future<void> function}) {
    return _$receiveMessageChannelSocketAsyncAction
        .run(() => super.receiveMessageChannelSocket(function: function));
  }

  late final _$_ChatScreenStoreActionController =
      ActionController(name: '_ChatScreenStore', context: context);

  @override
  void setMessage(dynamic message, {required String accountId}) {
    final _$actionInfo = _$_ChatScreenStoreActionController.startAction(
        name: '_ChatScreenStore.setMessage');
    try {
      return super.setMessage(message, accountId: accountId);
    } finally {
      _$_ChatScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addMessage(dynamic message, {required String accountId}) {
    final _$actionInfo = _$_ChatScreenStoreActionController.startAction(
        name: '_ChatScreenStore.addMessage');
    try {
      return super.addMessage(message, accountId: accountId);
    } finally {
      _$_ChatScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
messages: ${messages},
memberChannel: ${memberChannel},
channel: ${channel},
scrollController: ${scrollController}
    ''';
  }
}
