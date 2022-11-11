import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:kyan/manager/manager_address.dart';
import 'package:kyan/models/channel.dart';
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
  BaseAPI _api = BaseAPI();
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
  bool _isExpandedChannel = true;

  bool get isExpandedChannel => _isExpandedChannel;

  set isExpandedChannel(bool isExpandedChannel) {
    _isExpandedChannel = isExpandedChannel;
  }

  @observable
  bool _isExpandedPeople = true;

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
  Future<void> onWidgetBuildDone(BuildContext context) async {}

  @override
  void resetValue() async {
    isExpandedChannel = true;
    isExpandedPeople = true;
    isPrivateCreate = false;
    //channels = ObservableList<Channel>();
    createChannel = Channel();
    createChanelNameController.text = '';
    //BaseSharedPreferences.remove('currentWorkspace');
    currentWorkspace = null;
  }

  @action
  Future<void> onCLickAddChannelChat(BuildContext context,
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
            // Handle success response here
            createChannel = Channel();
          }

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
    //createChannel = Channel();
    createChanelNameController.text = '';
  }

  @action
  Future<void> saveCurrentWorkSpace({required int? workspaceId}) async {
    await Utils.saveCurrentWorkSpace(workspaceId.toString());
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
