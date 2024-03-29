import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kyan/const/consts.dart';
import 'package:kyan/generated/l10n.dart';
import 'package:kyan/manager/manager_path_routes.dart';
import 'package:kyan/models/channel.dart';
import 'package:kyan/models/conversation.dart';
import 'package:kyan/screen/chat_sceen/store/chat_screen_store.dart';
import 'package:kyan/screen/chat_sceen/widgets/input_chat_screen.dart';
import 'package:kyan/screen/list_message_screen/list_message_screen.dart';
import 'package:kyan/theme/colors.dart';
import 'package:kyan/theme/dimens.dart';
import 'package:kyan/theme/images.dart';
import 'package:kyan/widgets/custom_appbar_back.dart';
import 'package:kyan/widgets/custom_circle_avatar.dart';
import 'package:kyan/widgets/custom_dialog_confirm.dart';

class ChatScreen extends BaseScreen {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends BaseScreenState<ChatScreen, ChatScreenStore> {
  @override
  Widget buildSmallScreen(BuildContext context) {
    return _build(context);
  }

  Widget _build(BuildContext context) {
    return Scaffold(
      endDrawer: _buildInfoChannel(),
      appBar: _buildAppBar(),
      body: GestureDetector(
          onTap: () => BaseUtils.hideKeyboard(context),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 63),
            child: Observer(builder: (_) {
              return ListMessageScreen(agrs: store.spaceChat);
            }),
          )),
      bottomSheet: InputChatScreen(
        chatScreenStore: store,
      ),
    );
  }

  Widget _buildInfoChannel() {
    return Observer(builder: (_) {
      return Scaffold(
          appBar: customAppBar(context, title: S.of(context).infoChat),
          backgroundColor: AppColors.white,
          body: SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: Dimens.SCREEN_PADDING),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  if (!store.isChannel) _buildImage(),
                  Observer(builder: (_) => _buildBody(context)),
                ],
              ),
            ),
          ));
    });
  }

  PreferredSizeWidget _buildAppBar() {
    int? isPrivate = BaseNavigation.getArgs(context, key: 'isPrivate');
    String title = BaseNavigation.getArgs(context, key: 'title');
    return AppBar(
      title: Builder(
          builder: (context) => GestureDetector(
                onTap: () => Scaffold.of(context).openEndDrawer(),
                child: Row(
                  children: [
                    if (isPrivate == 1)
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: AppColors.white),
                        child: Center(
                          child: Image.asset(
                            Images.iconPrivate,
                            width: 20,
                          ),
                        ),
                      )
                    else if (isPrivate == 0)
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: AppColors.white),
                        child: Center(
                          child: Image.asset(
                            Images.iconPublic,
                            width: 20,
                          ),
                        ),
                      )
                    else
                      const CustomCircleAvatar(
                        width: 35,
                        imageUrl: DEFAULT_AVATAR,
                      ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(child: title.t1M(color: AppColors.white)),
                  ],
                ),
              )),
      backgroundColor: AppColors.primary,
      shadowColor: AppColors.primary.withOpacity(0.5),
      leading: GestureDetector(
          onTap: () {
            BaseNavigation.pop(context);
          },
          child: const Icon(Icons.navigate_before)),
      actions: [
        Builder(builder: (context) => Container()),
      ],
    );
  }

  Widget _buildImage() {
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.primary, width: 1)),
      width: 100,
      height: 100,
      child: const Center(
        child: CustomCircleAvatar(imageUrl: '', width: 100),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    int? isPrivate = BaseNavigation.getArgs(context, key: 'isPrivate');
    String title = BaseNavigation.getArgs(context, key: 'title');
    return (store.isShowLoading == true)
        ? const BaseIndicator()
        : Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                if (!store.isChannel)
                  Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: store.isChannel
                            ? Alignment.topLeft
                            : Alignment.center,
                        child: title.b1R(color: AppColors.black),
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                    ],
                  ),
                ListView(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  children: [
                    if (store.isChannel)
                      if (true)
                        Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Align(
                              alignment: store.isChannel
                                  ? Alignment.topLeft
                                  : Alignment.center,
                              child: title.b1(color: AppColors.black),
                            ),
                            const SizedBox(
                              height: 35,
                            ),
                          ],
                        ),
                    const SizedBox(height: 5),
                    if (store.isChannel && isPrivate == 1)
                      _buildRowTextIcon(
                        title: S.of(context).members,
                        iconData: Icons.add,
                        colorIcon: AppColors.gray,
                        onPressIcon: () async {
                          (store.checkIsOwnerMember() == 1)
                              ? BaseNavigation.push(context,
                                  routeName:
                                      ManagerRoutes.selectPeopleChannelScreen,
                                  arguments: {
                                      'channelId': store.currentChannelId,
                                      'members': store.memberChannel
                                    })
                              : BaseUtils.showToast('You are not a host',
                                  bgColor: AppColors.primary);
                        },
                      ),
                    // list members
                    if (isPrivate == 1 && store.isChannel)
                      Observer(builder: (_) {
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: store.memberChannel.length,
                          itemBuilder: ((context, index) {
                            return Observer(builder: (_) {
                              return ListTile(
                                leading: CustomCircleAvatar(
                                  imageUrl: store.memberChannel
                                      .elementAt(index)
                                      .accountUrlPhoto
                                      .toString(),
                                  width: 24,
                                ),
                                trailing: GestureDetector(
                                  onTap: () async {
                                    showDialogConfirm(
                                      context,
                                      title: S.of(context).confirmDeleteThis,
                                      hightLight: '',
                                      onConfirm: () async {
                                        store.onClickDeleteChannelMember(
                                            context,
                                            channelId: BaseNavigation.getArgs(
                                                context,
                                                key: 'channelId'),
                                            accountId: store.memberChannel
                                                .elementAt(index)
                                                .accountId
                                                .toString());
                                        BaseNavigation.pop(context);

                                        await store
                                            .getAllChannelMember(context);
                                      },
                                    );
                                  },
                                  child: store.checkIsOwnerMember() == 1
                                      ? const BaseSVG(
                                          path: Images.iconRemoveAccount,
                                          color: AppColors.redPink)
                                      : const SizedBox.shrink(),
                                ),
                                title: BaseText(store.memberChannel
                                    .elementAt(index)
                                    .accountDisplayName),
                              );
                            });
                          }),
                        );
                      }),
                    if (isPrivate == 1 && store.isChannel) const Divider(),
                    if (isPrivate == 1 && store.isChannel)
                      GestureDetector(
                        onTap: () async {
                          showDialogConfirm(context,
                              icon: Icons.logout_outlined, onConfirm: () async {
                            store.onClickDeleteChannelMember(context,
                                channelId: BaseNavigation.getArgs(context,
                                    key: 'channelId'),
                                accountId: store
                                    .loginScreenStore.currentAccount.accountId
                                    .toString());
                            BaseNavigation.pop(context);
                            BaseNavigation.pop(context);
                            BaseNavigation.pop(context);
                          }, title: S.of(context).confirmLeaveChannel);
                        },
                        child: _buildRowTextIcon(
                            colorIcon: AppColors.redPink,
                            colorText: AppColors.redPink,
                            title: S.of(context).leaveChannel,
                            iconData: Icons.logout_outlined),
                      ),

                    if (store.spaceChat is Channel &&
                            store.loginScreenStore.currentAccount.accountMail ==
                                (store.spaceChat as Channel).accountMailOwner ||
                        store.spaceChat is Conversation)
                      const Divider(),
                    if (store.spaceChat is Channel &&
                            store.loginScreenStore.currentAccount.accountMail ==
                                (store.spaceChat as Channel).accountMailOwner ||
                        store.spaceChat is Conversation)
                      GestureDetector(
                        onTap: () {
                          showDialogConfirm(context,
                              icon: Icons.delete_forever,
                              title: S.of(context).confirmDeleteThis,
                              onConfirm: () async {
                            BaseNavigation.pop(context);
                          });
                        },
                        child: _buildRowTextIcon(
                            colorIcon: AppColors.redPink,
                            colorText: AppColors.redPink,
                            title: S.current.delete,
                            iconData: Icons.delete_forever),
                      ),
                    const SizedBox(
                      height: 45,
                    )
                  ],
                ),
              ],
            ),
          );
  }

  Container _buildRowTextIcon(
      {required String title,
      required IconData iconData,
      Color colorIcon = AppColors.black,
      Color colorText = AppColors.black,
      bool isShowIcon = true,
      Function? onPressIcon}) {
    return Container(
      color: AppColors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          title.b2R(color: AppColors.black),
          isShowIcon
              ? GestureDetector(
                  onTap: () {
                    onPressIcon?.call();
                  },
                  child: Icon(
                    iconData,
                    color: colorIcon,
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
