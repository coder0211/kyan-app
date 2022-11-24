import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:kyan/generated/l10n.dart';
import 'package:kyan/manager/manager_address.dart';
import 'package:kyan/manager/manager_key_storage.dart';
import 'package:kyan/manager/manager_path_routes.dart';
import 'package:kyan/models/channel.dart';
import 'package:kyan/models/conversation.dart';
import 'package:kyan/models/result_post.dart';
import 'package:kyan/models/workspace.dart';
import 'package:kyan/screen/login_screen/store/login_screen_store.dart';
import 'package:kyan/screen/main_screen/store/main_screen_store.dart';
import 'package:kyan/utils/utils.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
part 'conversation_screen_store.g.dart';

class ConversationScreenStore = _ConversationScreenStore
    with _$ConversationScreenStore;

abstract class _ConversationScreenStore with Store, BaseStoreMixin {
  late MainScreenStore mainScreenStore;
  late LoginScreenStore loginScreenStore;
  late ConversationScreenStore conversationScreenStore;
  BaseAPI _api = BaseAPI();
  @observable
  ObservableList<Channel> channels = ObservableList<Channel>();
  @observable
  ObservableList<Conversation> conversations = ObservableList<Conversation>();
  @observable
  Channel? createChannel = Channel();
  @observable
  TextEditingController createChanelNameController = TextEditingController();
  @observable
  TextEditingController searchController = TextEditingController();

  @observable
  bool _isShowLoading = true;

  bool get isShowLoading => _isShowLoading;

  set isShowLoading(bool isShowLoading) {
    _isShowLoading = isShowLoading;
  }

  @observable
  bool _isExpandedChannel = false;

  bool get isExpandedChannel => _isExpandedChannel;

  set isExpandedChannel(bool isExpandedChannel) {
    _isExpandedChannel = isExpandedChannel;
  }

  @observable
  bool _isExpandedPeople = false;

  bool get isExpandedPeople => _isExpandedPeople;

  set isExpandedPeople(bool isExpandedPeople) {
    _isExpandedPeople = isExpandedPeople;
  }

  @observable
  bool _isPrivateCreate = false;

  bool get isPrivateCreate => _isPrivateCreate;

  set isPrivateCreate(bool isPrivateCreate) {
    _isPrivateCreate = isPrivateCreate;
  }

  @observable
  int? _currentWorkspaceId;

  int? get currentWorkspaceId => _currentWorkspaceId;

  set currentWorkspaceId(int? currentWorkspaceId) {
    _currentWorkspaceId = currentWorkspaceId;
  }

  @observable
  int idChannelCreate = -1;
  Workspace? _currentWorkspace;

  Workspace? get currentWorkspace => _currentWorkspace;

  set currentWorkspace(Workspace? currentWorkspace) {
    _currentWorkspace = currentWorkspace;
  }

  @override
  void onInit(BuildContext context) {
    mainScreenStore = context.read<MainScreenStore>();
    loginScreenStore = context.read<LoginScreenStore>();
  }

  @override
  void onDispose(BuildContext context) {}

  @override
  Future<void> onWidgetBuildDone(BuildContext context) async {
    await _getWorkspaceId();
    await getData();
  }

  @override
  void resetValue() async {
    isExpandedChannel = true;
    isExpandedPeople = true;
    isShowLoading = true;
    isPrivateCreate = false;
    currentWorkspaceId = null;
    channels = ObservableList<Channel>();
    conversations = ObservableList<Conversation>();
    createChannel = Channel();
    createChanelNameController.text = '';
    isPrivateCreate = false;
    //BaseSharedPreferences.remove(CURRENT_WORKSPACE);
    currentWorkspace = null;
  }

  @action
  Future<void> saveCurrentWorkSpace({required int? workspaceId}) async {
    await Utils.saveCurrentWorkSpace(workspaceId.toString());
  }

  @action
  Future<void> getData() async {
    print('currentWorkspaceId: ${currentWorkspaceId}');
    Map<String, dynamic> headers = {
      'Authorization': mainScreenStore.accessToken,
    };
    Map<String, dynamic> params = {
      'channelWorkspaceId': currentWorkspaceId ?? -1,
      'accountId': loginScreenStore.currentAccount.accountId,
    };
    if (currentWorkspaceId != null) {
      isShowLoading = true;
      await _api
          .fetchData(ManagerAddress.channelGetAllByWorkspace,
              headers: headers, params: params, method: ApiMethod.GET)
          .then((value) {
        switch (value.apiStatus) {
          case ApiStatus.SUCCEEDED:
            {
              printLogSusscess('SUCCEEDED');
              channels.clear();
              value.object.forEach((element) {
                channels.add(Channel.fromJson(element));
              });
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

      // get conversation
      // await _api
      //     .fetchData(ManagerAddress.conversationGetAll,
      //         headers: headers, params: params, method: ApiMethod.GET)
      //     .then((value) {
      //   switch (value.apiStatus) {
      //     case ApiStatus.SUCCEEDED:
      //       {
      //         printLogSusscess('SUCCEEDED');
      //         conversations.clear();
      //         value.object.forEach((element) {
      //           conversations.add(Conversation.fromJson(element));
      //         });
      //         break;
      //       }
      //     case ApiStatus.INTERNET_UNAVAILABLE:
      //       printLogYellow('INTERNET_UNAVAILABLE');
      //       BaseUtils.showToast('INTERNET UNAVAILABLE', bgColor: Colors.red);
      //       break;
      //     default:
      //       printLogError('FAILED');
      //       // Handle failed response here
      //       break;
      //   }
      // });
    } else {
      channels = ObservableList<Channel>();
      conversations = ObservableList<Conversation>();
    }
    isShowLoading = false;
  }

  @action
  Future<void> onClickAddChannelChat(BuildContext context,
      {required Channel channel}) async {
    Map<String, dynamic> headers = {
      'Authorization': mainScreenStore.accessToken,
    };

    await _api
        .fetchData(ManagerAddress.createOrUpdateChannelChat,
            headers: headers, body: channel.toJson(), method: ApiMethod.POST)
        .then((value) {
      switch (value.apiStatus) {
        case ApiStatus.SUCCEEDED:
          {
            printLogSusscess('SUCCEEDED');
            ResultPost resultPost = ResultPost();
            resultPost = ResultPost.fromJson(
                (value.object ?? {}) as Map<String, dynamic>);
            idChannelCreate = resultPost.insertId ?? -1;
            // Handle success response here
            createChannel = Channel();
            break;
          }
        case ApiStatus.INTERNET_UNAVAILABLE:
          printLogYellow('INTERNET_UNAVAILABLE');
          BaseUtils.showToast('INTERNET UNAVAILABLE', bgColor: Colors.red);
          break;
        default:
          printLogError('FAILED');
          Utils.showToast(S.of(context).createChannelFailed);
          // Handle failed response here
          break;
      }
    });
    //createChannel = Channel();
    createChanelNameController.text = '';
  }

  @action
  Future<void> onPressedItem(BuildContext context,
      {required String title,
      required String urlPhoto,
      int? isPrivate,
      required dynamic agrs,
      int? channelId}) async {
    print(agrs.toString());

    BaseNavigation.push(context,
        routeName: ManagerRoutes.chatScreen,
        arguments: {
          'title': title,
          'urlPhoto': urlPhoto,
          'isPrivate': isPrivate,
          'agrs': agrs,
          'channelId': channelId
        });
  }

  Future<void> _getWorkspaceId() async {
    if (await BaseSharedPreferences.containKey(
        ManagerKeyStorage.currentWorkspace)) {
      currentWorkspaceId = int.tryParse(
              await BaseSharedPreferences.getStringValue(
                  ManagerKeyStorage.currentWorkspace)) ??
          -1;
    }
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
