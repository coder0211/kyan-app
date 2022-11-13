import 'dart:convert';
import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kyan/generated/l10n.dart';
import 'package:kyan/manager/manager_path_routes.dart';
import 'package:kyan/manager/manager_socket.dart';
import 'package:kyan/models/workspace.dart';
import 'package:kyan/screen/conversation_screen/store/conversation_screen_store.dart';
import 'package:kyan/screen/conversation_screen/widgets/item_channel_chat.dart';
import 'package:kyan/screen/conversation_screen/widgets/item_people_chat.dart';
import 'package:kyan/screen/conversation_screen/widgets/modal_bottom_sheet_add_channel.dart';
import 'package:kyan/theme/colors.dart';
import 'package:kyan/theme/images.dart';
import 'package:kyan/utils/utils.dart';
import 'package:kyan/widgets/custom_appbar_back.dart';
import 'package:kyan/widgets/custom_text_form_field.dart';
import 'package:kyan/widgets/expanded_selection.dart';
import 'package:google_fonts/google_fonts.dart';

class ConversationScreen extends BaseScreen {
  const ConversationScreen({Key? key}) : super(key: key);

  @override
  State<ConversationScreen> createState() => _ConversationScreenState();
}

class _ConversationScreenState
    extends BaseScreenState<ConversationScreen, ConversationScreenStore> {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget buildSmallScreen(BuildContext context) {
    return _build(context);
  }

  Widget _build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: customAppBar(context,
          title: S.of(context).conversation, isShowBack: false),
      body: GestureDetector(
        onTap: () {
          BaseUtils.hideKeyboard(context);
        },
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return Observer(
      builder: (_) => CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            actions: [Container()],
            shadowColor: AppColors.transparent,
            backgroundColor: AppColors.white,
            title: CustomTextFormField(
              onChanged: (_) {},
              hintText: S.of(context).searchHere,
              hintStyle: GoogleFonts.notoSans(
                  fontWeight: FontWeight.w300,
                  fontSize: 12,
                  color: AppColors.gray),
              isModeBorder: true,
            ),
            floating: true,
            pinned: true,
            primary: true,
          ),
          SliverAppBar(
            automaticallyImplyLeading: false,
            actions: [Container()],
            shadowColor: AppColors.transparent,
            backgroundColor: AppColors.white,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    GestureDetector(onTap: () {
                      store.isExpandedChannel = !store.isExpandedChannel;
                    }, child: Observer(builder: (_) {
                      return RotationTransition(
                        turns: AlwaysStoppedAnimation(
                            store.isExpandedChannel ? 0 : -0.25),
                        child: Image.asset(
                          Images.iconShowMoreGray,
                          width: 20,
                        ),
                      );
                    })),
                    S.of(context).channel.b2R(color: AppColors.gray),
                  ],
                ),
                GestureDetector(
                    onTap: () {
                      showModalBottomSheetAddChannel(context);
                    },
                    child: const Icon(Icons.add, color: AppColors.gray))
              ],
            ),
            floating: true,
            toolbarHeight: 30,
          ),
          Observer(
            builder: (_) => SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return ExpandedSection(
                      expand: store.isExpandedChannel,
                      child: (store.channels
                              .elementAt(index)
                              .channelName!
                              .toLowerCase()
                              .contains(
                                  store.searchController.text.toLowerCase()))
                          ? ItemChannelChat(
                              onPressed: () {
                                ManagerSocket.initSocket(
                                    idChannel: store.channels
                                        .elementAt(index)
                                        .channelId);
                                BaseNavigation.push(context,
                                    routeName: ManagerRoutes.chatScreen,
                                    arguments: {
                                      'channelId': store.channels
                                          .elementAt(index)
                                          .channelId
                                    });
                              },
                              titleChannel:
                                  store.channels.elementAt(index).channelName ??
                                      '',
                            )
                          : Container());
                },
                childCount: store.channels.length,
              ),
            ),
          ),
          SliverAppBar(
            automaticallyImplyLeading: false,
            actions: [Container()],
            shadowColor: AppColors.transparent,
            backgroundColor: AppColors.white,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    GestureDetector(onTap: () {
                      store.isExpandedPeople = !store.isExpandedPeople;
                    }, child: Observer(builder: (_) {
                      return RotationTransition(
                        turns: AlwaysStoppedAnimation(
                            store.isExpandedPeople ? 0 : -0.25),
                        child: Image.asset(Images.iconShowMoreGray, width: 20),
                      );
                    })),
                    S.of(context).people.b2R(color: AppColors.gray)
                  ],
                ),
                GestureDetector(
                    onTap: () {
                      BaseNavigation.push(context,
                          routeName:
                              ManagerRoutes.selectPeopleConversationScreen,
                          arguments: {'idWorkSpace': store.currentWorkspaceId});
                    },
                    child: const Icon(Icons.add, color: AppColors.gray))
              ],
            ),
            pinned: true,
            toolbarHeight: 30,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Observer(builder: (_) {
                  return ExpandedSection(
                      expand: store.isExpandedPeople,
                      child: ItemPeopleChat(
                        avatarUrl: 'https://giorgiopandiani.art/animated-gifs',
                        onPressed: () {},
                        titleChannel: 'titleChannel',
                      ));
                });
              },
              childCount: store.conversations.length,
            ),
          ),
          const SliverAppBar(
            shadowColor: AppColors.transparent,
            backgroundColor: AppColors.white,
            title: SizedBox(),
            toolbarHeight: 96,
          ),
        ],
      ),
    );
  }

  void getDataLocal() async {
    var temp = await Utils.getCurrentWorkSpace();
    if (temp != null) {
      var value = json.decode(temp);
      Workspace? _workspace = Workspace.fromJson(value);
      store.currentWorkspaceId = _workspace.workspaceId;
      store.currentWorkspace = _workspace;
    }

    // await store
    //     .getData(store.loginScreenStore.currentAccount.accountMail ?? '');
  }
}
