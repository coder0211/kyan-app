import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kyan/generated/l10n.dart';
import 'package:kyan/manager/manager_path_routes.dart';
import 'package:kyan/screen/conversation_screen/store/conversation_screen_store.dart';
import 'package:kyan/screen/conversation_screen/widgets/item_channel_chat.dart';
import 'package:kyan/screen/conversation_screen/widgets/item_people_chat.dart';
import 'package:kyan/screen/conversation_screen/widgets/modal_bottom_sheet_add_channel.dart';
import 'package:kyan/screen/workspaces_screen/workspaces_screen.dart';
import 'package:kyan/theme/colors.dart';
import 'package:kyan/theme/dimens.dart';
import 'package:kyan/theme/images.dart';
import 'package:kyan/widgets/custom_circle_avatar.dart';
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
      appBar: AppBar(
        title: _buildHeader(),
        shadowColor: AppColors.transparent,
        backgroundColor: AppColors.white,
        automaticallyImplyLeading: false,
        leadingWidth: 0,
        actions: [Container()],
      ),
      endDrawer: _buildDrawer(),
      body: GestureDetector(
        onTap: () {
          BaseUtils.hideKeyboard(context);
        },
        child: _buildBody(),
      ),
    );
  }

  Widget _buildHeader() {
    return Observer(builder: (_) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: Dimens.SCREEN_PADDING),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      BaseNavigation.push(context,
                          routeName: ManagerRoutes.mainScreen,
                          clearStack: true);
                    },
                    child: const Icon(
                      Icons.navigate_before,
                      color: AppColors.primary,
                    )),
                S.current.conversation.b1(color: AppColors.primary),
                _buildWorkSpace(),
              ],
            ),
          ],
        ),
      );
    });
  }

  Container _buildWorkSpace() {
    return Container(
      child: Observer(builder: (_) {
        return Row(
          children: [
            const SizedBox(width: 10),
            'workspace name'.b1(),
            const CustomCircleAvatar(
              width: 30,
              imageUrl:
                  'https://image.archify.com/blog/03-How-to-Create-a-Comfortable-Workspace-at-Home.jpg',
            )
          ],
        );
      }),
    );
  }

  Widget _buildBody() {
    return Observer(
        builder: ((_) => CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  actions: [Container()],
                  shadowColor: AppColors.transparent,
                  backgroundColor: AppColors.white,
                  title: CustomTextFormField(
                    onChanged: (_) {
                      setState(() {});
                    },
                    hintText: S.current.searchHere,
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
                          GestureDetector(
                            onTap: () {},
                            child: Observer(builder: (_) {
                              return RotationTransition(
                                turns: const AlwaysStoppedAnimation(0),
                                child: Image.asset(
                                  Images.iconShowMoreGray,
                                  width: 20,
                                ),
                              );
                            }),
                          ),
                          S.current.channel.b2R(color: AppColors.gray),
                        ],
                      ),
                      GestureDetector(
                          onTap: () => showModalBottomSheetAddChannel(context),
                          child: const Icon(Icons.add, color: AppColors.gray))
                    ],
                  ),
                  floating: true,
                  toolbarHeight: 30,
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return Observer(builder: (_) {
                        return ExpandedSection(
                            expand: true,
                            child: ItemChannelChat(
                              onPressed: () {
                                BaseNavigation.push(
                                  context,
                                  routeName: ManagerRoutes.chatScreen,
                                  clearStack: true,
                                );
                              },
                              titleChannel: '',
                            ));
                      });
                    },
                    childCount: 2,
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
                          GestureDetector(
                              onTap: () {},
                              child: Observer(builder: (_) {
                                return RotationTransition(
                                  turns: const AlwaysStoppedAnimation(0),
                                  child: Image.asset(Images.iconShowMoreGray,
                                      width: 20),
                                );
                              })),
                          S.current.people.b2R(color: AppColors.gray)
                        ],
                      ),
                      GestureDetector(
                          onTap: () {},
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
                            child: ItemPeopleChat(
                          avatarUrl:
                              'https://giorgiopandiani.art/animated-gifs',
                          onPressed: () {},
                          titleChannel: 'titleChannel',
                        ));
                      });
                    },
                    childCount: 2,
                  ),
                ),
                const SliverAppBar(
                  shadowColor: AppColors.transparent,
                  backgroundColor: AppColors.white,
                  title: SizedBox(),
                  toolbarHeight: 96,
                ),
              ],
            )));
  }

  Drawer _buildDrawer() {
    return const Drawer(child: WorkspaceScreen());
  }
}
