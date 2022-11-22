import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:kyan/manager/manager_address.dart';
import 'package:kyan/manager/manager_socket.dart';
import 'package:kyan/models/account.dart';
import 'package:kyan/models/channel.dart';
import 'package:kyan/models/channel_message.dart';
import 'package:kyan/models/conversation.dart';
import 'package:kyan/screen/conversation_screen/store/conversation_screen_store.dart';
import 'package:kyan/screen/login_screen/store/login_screen_store.dart';
import 'package:kyan/screen/main_screen/store/main_screen_store.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
part 'chat_screen_store.g.dart';

class ChatScreenStore = _ChatScreenStore with _$ChatScreenStore;

abstract class _ChatScreenStore with Store, BaseStoreMixin {
  @observable
  ObservableList<ChannelMessage> messages = ObservableList<ChannelMessage>();
  @observable
  late ObservableList<Account> memberChannel = ObservableList<Account>();
  @observable
  Channel channel = Channel();
  BaseAPI _api = BaseAPI();
  late MainScreenStore _mainScreenStore;
  late ChatScreenStore _chatScreenStore;
  int page = 0;
  int limit = 50;
  bool isLastMessager = false;

  String urlPhoto = '';
  String title = '';
  int isPrivate = -1;
  dynamic args = null;
  @observable
  int? _currentChannelId;

  int? get currentChannelId => _currentChannelId;

  set currentChannelId(int? currentChannelId) {
    _currentChannelId = currentChannelId;
  }

  @observable
  bool _isShowLoading = true;

  bool get isShowLoading => _isShowLoading;

  set isShowLoading(bool isShowLoading) {
    _isShowLoading = isShowLoading;
  }

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

  late LoginScreenStore loginScreenStore;
  late ConversationScreenStore conversationScreenStore;
  @override
  void onInit(BuildContext context) async {
    loginScreenStore = context.read<LoginScreenStore>();
    conversationScreenStore = context.read<ConversationScreenStore>();
    _mainScreenStore = context.read<MainScreenStore>();
    _chatScreenStore = context.read<ChatScreenStore>();
    currentChannelId = BaseNavigation.getArgs(context, key: 'channelId');
  }

  Future<void> getAccountMail({String? accessToken}) async {
    loginScreenStore.handleGetData();
  }

  @override
  void onDispose(BuildContext context) async {
    messages.clear();
    ManagerSocket.socket.clearListeners();
    //await _chatScreenStore.getAllChannelMember(context);
  }

  @override
  Future<void> onWidgetBuildDone(BuildContext context) async {
    isPrivate = BaseNavigation.getArgs(context, key: 'isPrivate');
    currentChannelId = BaseNavigation.getArgs(context, key: 'channelId');
    await _chatScreenStore.getAllChannelMember(context);
  }

  @override
  void resetValue() {
    urlPhoto = '';
    title = '';
    isPrivate = -1;
    args = null;
    channel = new Channel();
  }

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
    Map<String, dynamic> headers = {
      'Authorization': _mainScreenStore.accessToken
    };
    Map<String, dynamic> params = {};
  }

  int checkIsOwnerMember() {
    for (int i = 0; i < memberChannel.length; i++) {
      if (memberChannel.elementAt(i) == 1 &&
          memberChannel.elementAt(i).accountId.toString() ==
              loginScreenStore.currentAccount.accountId) {
        return 1;
      }
    }
    return 0;
  }

  Future<void> getAllChannelMember(BuildContext context) async {
    Map<String, dynamic> headers = {
      'Authorization': _mainScreenStore.accessToken
    };

    Map<String, dynamic> params = {
      'channelId': currentChannelId,
    };
    isShowLoading = true;
    await _api
        .fetchData(
            ManagerAddress.
                //channelGetOne,
                channelMemberGetAll,
            headers: headers,
            params: params,
            method: ApiMethod.GET)
        .then((value) {
      switch (value.apiStatus) {
        case ApiStatus.SUCCEEDED:
          {
            printLogSusscess('SUCCEEDED');

            memberChannel.clear();
            value.object.forEach((element) {
              memberChannel.add(Account.fromJson(element));
            });

            // channel = Channel.fromJson(value.object);
            // memberChannel.clear();
            // memberChannel.addAll(channel.listMember ?? []);
            break;
          }

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
    isShowLoading = false;
  }

  Future<void> onClickDeleteChannelMember(BuildContext context,
      {required int? channelId, required String accountId}) async {
    Map<String, dynamic> headers = {
      'Authorization': _mainScreenStore.accessToken
    };
    Map<String, dynamic> body = {
      'channelId': channelId,
      'accountId': accountId,
    };
    isShowLoading = true;
    await _api
        .fetchData(ManagerAddress.channelMemberDelete,
            headers: headers, body: body, method: ApiMethod.DELETE)
        .then((value) {
      switch (value.apiStatus) {
        case ApiStatus.SUCCEEDED:
          printLogSusscess('SUCCEEDED');
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

    isShowLoading = false;
    await _chatScreenStore.getAllChannelMember(context);
  }
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
