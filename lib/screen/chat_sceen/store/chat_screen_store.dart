import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:kyan/manager/manager_address.dart';
import 'package:kyan/manager/manager_key_storage.dart';
import 'package:kyan/manager/manager_socket.dart';
import 'package:kyan/models/channel_message.dart';
import 'package:kyan/models/conversation.dart';
import 'package:kyan/screen/conversation_screen/store/conversation_screen_store.dart';
import 'package:kyan/screen/login_screen/store/login_screen_store.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
part 'chat_screen_store.g.dart';

class ChatScreenStore = _ChatScreenStore with _$ChatScreenStore;

abstract class _ChatScreenStore with Store, BaseStoreMixin {
  @observable
  bool _isShowLoading = false;

  bool get isShowLoading => _isShowLoading;

  set isShowLoading(bool isShowLoading) {
    _isShowLoading = isShowLoading;
  }

  @observable
  ObservableList<ChannelMessage> messages = ObservableList<ChannelMessage>();

  @observable
  String _demo = '';

  String get demo => _demo;

  set demo(String demo) {
    _demo = demo;
  }

  @observable
  ScrollController scrollController = ScrollController();

  @observable
  bool _isChannel = true;

  bool get isChannel => _isChannel;

  set isChannel(bool isChannel) {
    _isChannel = isChannel;
  }

  @observable
  dynamic _spaceChat;

  dynamic get spaceChat => _spaceChat;

  set spaceChat(dynamic spaceChat) {
    _spaceChat = spaceChat;
  }

  BaseAPI _baseAPI = BaseAPI();
  int page = 0;
  int limit = 50;
  bool isLastMessager = false;

  int channelId = -1;
  String urlPhoto = '';
  String title = '';
  int isPrivate = -1;
  dynamic args = null;

  late LoginScreenStore loginScreenStore;
  late ConversationScreenStore conversationScreenStore;
  @override
  void onInit(BuildContext context) {
    loginScreenStore = context.read<LoginScreenStore>();
    conversationScreenStore = context.read<ConversationScreenStore>();
  }

  Future<void> getAccountMail({String? accessToken}) async {
    loginScreenStore.handleGetData();
  }

  @override
  void onDispose(BuildContext context) {
    messages.clear();
    ManagerSocket.socket.clearListeners();
  }

  @override
  Future<void> onWidgetBuildDone(BuildContext context) async {
    channelId = BaseNavigation.getArgs(context, key: 'channelId');
    urlPhoto = BaseNavigation.getArgs(context, key: 'urlPhoto');
    title = BaseNavigation.getArgs(context, key: 'title');
    isPrivate = BaseNavigation.getArgs(context, key: 'isPrivate');
    args = BaseNavigation.getArgs(context, key: 'args');
  }

  @override
  void resetValue() {}

  @action
  void setMessage(dynamic message, {required String accountId}) {
    messages.add(ChannelMessage.fromJson(message));
    messages.last.owner = message['channelMessageSenderId'] == accountId
        ? MessageOwner.myself
        : MessageOwner.other;
  }

  @action
  void addMessage(dynamic message, {required String accountId}) {
    List<ChannelMessage> _temp = [];
    _temp.addAll(messages);
    messages.clear();
    messages.add(ChannelMessage.fromJson(message));
    messages.last.owner = messages[0].channelMessageSenderId == accountId
        ? MessageOwner.myself
        : MessageOwner.other;
    messages.addAll(_temp);
  }

  @action
  Future<void> getData<T>(
      {required String accountId, required T value, bool isAdd = false}) async {
    isShowLoading = true;
    await _getAllChannelMessage();
    isShowLoading = false;
  }

  @action
  Future<void> loadMore<T>(
      {required String accountId, required T value}) async {
    // page++;
    await getData<T>(accountId: accountId, value: value, isAdd: true);
  }

  @action
  Future<void> sendMessageConversationSocket(String content,
      {required String mailSend, required Conversation conversation}) async {}

  @action
  Future<void> receiveMessageConversationSocket(
      {required Future<void> function}) async {}

  @action
  Future<void> sendMessageChannelSocket(
    String content,
  ) async {}

  @action
  Future<void> receiveMessageChannelSocket(
      {required Future<void> function}) async {}

  Future<void> _getAllChannelMessage() async {
    String accessToken = '';
    if (await BaseSharedPreferences.containKey(ManagerKeyStorage.accessToken)) {
      accessToken = await BaseSharedPreferences.getStringValue(
          ManagerKeyStorage.accessToken);
    }
    Map<String, dynamic> headers = {'Authorization': accessToken};
    Map<String, dynamic> params = {};
  }

  //... Some values and actions
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
