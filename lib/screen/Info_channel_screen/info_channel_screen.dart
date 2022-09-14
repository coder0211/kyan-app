import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:kyan/generated/l10n.dart';
import 'package:kyan/manager/manager_path_routes.dart';
import 'package:kyan/screen/Info_channel_screen/store/info_channel_screen_store.dart';
import 'package:kyan/screen/info_channel_screen/store/infor_channel_screen_store.dart';
import 'package:kyan/screen/login_screen/store/login_screen_store.dart';
import 'package:kyan/theme/colors.dart';
import 'package:kyan/theme/dimens.dart';
import 'package:kyan/theme/text_styles.dart';
import 'package:kyan/widgets/custom_appbar_back.dart';
import 'package:kyan/widgets/custom_circle_avatar.dart';
import 'package:kyan/widgets/custom_dialog_confirm.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoChannelScreen extends BaseScreen {
  final String title;
  final bool isChannel;
  final dynamic agrs;
  final bool isPrivate;
  final String urlAvatar;
  const InfoChannelScreen(
      {Key? key,
      required this.title,
      required this.isChannel,
      required this.agrs,
      required this.isPrivate,
      required this.urlAvatar})
      : super(key: key);

  @override
  State<InfoChannelScreen> createState() => _InfoChannelScreenState();
}

class _InfoChannelScreenState
    extends BaseScreenState<InfoChannelScreen, InfoChannelScreenStore> {
  @override
  Widget buildSmallScreen(BuildContext context) {
    return _build(context);
  }

  Widget _build(BuildContext context) {
    return Scaffold(
        appBar: customAppBarBack(context, title: S.current.infoChat),
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
                if (!widget.isChannel) _buildImage(),
                _buildBody(context),
              ],
            ),
          ),
        ));
  }

  Widget _buildImage() {
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.primary, width: 1)),
      width: 100,
      height: 100,
      child: Center(
        child: CustomCircleAvatar(imageUrl: widget.urlAvatar, width: 100),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (!widget.isChannel)
            Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment:
                      widget.isChannel ? Alignment.topLeft : Alignment.center,
                  child: BaseText(widget.title,
                      style: GoogleFonts.notoSans(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: AppColors.primary)
                          .copyWith(color: AppColors.black)),
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
              if (widget.isChannel)
                Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: widget.isChannel
                          ? Alignment.topLeft
                          : Alignment.center,
                      child: BaseText(widget.title,
                          style: GoogleFonts.notoSans(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: AppColors.primary)
                              .copyWith(color: AppColors.black)),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                  ],
                ),
              // if ((widget.agrs is Channel) &&
              //     _loginScreenStore.currentAccount.mail ==
              //         (widget.agrs as Channel).mailOwner)
              //   _buildRowTextIcon(
              //       title: 'Edit',
              //       iconData: Icons.create,
              //       colorIcon: AppColors.gray),
              // if (widget.isPrivate && widget.isChannel) Divider(),
              const SizedBox(height: 5),
              // if (widget.isPrivate && widget.isChannel)
              //   _buildRowTextIcon(
              //       title: S.current.members,
              //       iconData: Icons.add,
              //       colorIcon: AppColors.gray,
              // onPressIcon: () {
              //   BaseNavigation.push(
              //     context,
              //     routeName: ManagerRoutes.selectPeopleScreen,
              //     arguments: {
              //       'idWorkSpace':
              //           _conversationScreenStore.currentWorkspaceId,
              //       'ListSeleted': (widget.agrs as Channel)
              //           .listMember
              //           ?.map((e) => e.mail)
              //           .toList(),
              //       'idChannel': (widget.agrs as Channel).id
              //     },
              //   );
              // },
              //isShowIcon: true,
              // ((widget.agrs is Channel) &&
              //     _loginScreenStore.currentAccount.mail ==
              //         (widget.agrs as Channel).mailOwner)),
              //if (widget.isPrivate && widget.isChannel)
              // ListView.builder(
              //     shrinkWrap: true,
              //     physics: const NeverScrollableScrollPhysics(),
              //     itemCount: 2,
              //     // widget.isChannel
              //     //     ? (widget.agrs as Channel).listMember?.length
              //     //     : (widget.agrs as Conversation).listMember?.length,
              //     itemBuilder: (BuildContext context, int index) {
              //       return
              //       // (_loginScreenStore.currentAccount.mail !=
              //       //         (widget.agrs as Channel)
              //       //             .listMember
              //       //             ?.elementAt(index)
              //       //             .mail)
              //       //     ?
              //            ListTile(
              //               leading: const CustomCircleAvatar(
              //                   imageUrl: 'img url',
              //                   //(widget.agrs as Channel)
              //                   //     .listMember
              //                   //     ?.elementAt(index)
              //                   //     .urlPhoto,
              //                   width: 24),
              //               trailing:
              //               // ((widget.agrs is Channel) &&
              //               //         _loginScreenStore.currentAccount.mail ==
              //               //             (widget.agrs as Channel).mailOwner)
              //               //     ?
              //                    GestureDetector(
              //                       onTap: () {
              //                         showDialogConfirm(context,
              //                             onConfirm: () async {
              //                           BaseNavigation.pop(context);
              //                           // await _inforChannelScreenStore
              //                           //     .removeMemberChannel(
              //                           //         idChannel:
              //                           //             (widget.agrs as Channel)
              //                           //                     .id ??
              //                           //                 0,
              //                           //         mailAccount:
              //                           //             (widget.agrs as Channel)
              //                           //                     .listMember
              //                           //                     ?.elementAt(index)
              //                           //                     .mail ??
              //                           //                 '');
              //                           // await _conversationScreenStore
              //                           //     .getData(_loginScreenStore
              //                           //             .currentAccount.mail ??
              //                           //         '');
              //                           BaseNavigation.pop(context);
              //                           BaseNavigation.pop(context);
              //                         },
              //                             title:
              //                                 S.current.confirmLeaveWorkspace,
              //                             hightLight: 'Member of workspace');
              //                                 //' ${(widget.agrs as Channel).listMember?.elementAt(index).displayName}?');
              //                       },
              //                       child: BaseText(
              //                         S.current.remove,
              //                         style: GoogleFonts.notoSans(
              //                           fontWeight: FontWeight.w300,
              //                           fontSize: 12,
              //                           color: AppColors.gray)
              //                             .copyWith(color: AppColors.redPink),
              //                       ),
              //                     )
              //                   // : Container(
              //                   //     height: 1,
              //                   //     width: 1,
              //                   //   )
              //                   //
              //                   ,
              //               title:
              //               BaseText((widget.agrs as Channel)
              //                   .listMember
              //                   ?.elementAt(index)
              //                   .displayName))
              //           : Container();
              //     }),
              // if (widget.isPrivate && widget.isChannel) const Divider(),
              // if (widget.isPrivate && widget.isChannel)
              // GestureDetector(
              //     onTap: () async {
              //       showDialogConfirm(context, icon: Icons.logout_outlined,
              //           onConfirm: () async {
              // BaseNavigation.pop(context);
              // await _inforChannelScreenStore.leftChannel(
              //     channel: (widget.agrs as Channel),
              //     mailAccount:
              //         _loginScreenStore.currentAccount.mail ?? '');
              // await _conversationScreenStore.getData(
              //     _loginScreenStore.currentAccount.mail ?? '');
              // BaseNavigation.pop(context);
              // BaseNavigation.pop(context);
              //   }, title: S.current.confirmLeaveChannel);
              // },
              // child: _buildRowTextIcon(
              //     colorIcon: AppColors.redPink,
              //     colorText: AppColors.redPink,
              //     title: S.current.leaveChannel,
              //     iconData: Icons.logout_outlined)),
              // if ((widget.agrs is Channel) &&
              //         _loginScreenStore.currentAccount.mail ==
              //             (widget.agrs as Channel).mailOwner ||
              //     widget.agrs is Conversation)
              //   const Divider(),
              // if ((widget.agrs is Channel) &&
              //         _loginScreenStore.currentAccount.mail ==
              //             (widget.agrs as Channel).mailOwner ||
              //     widget.agrs is Conversation)
              //   GestureDetector(
              //     onTap: () {
              // showDialogConfirm(context, icon: Icons.delete_forever,
              //     onConfirm: () async {
              //   BaseNavigation.pop(context);

              //   if (widget.agrs is Channel) {
              //     await _inforChannelScreenStore.deleteChannel(
              //         idChannel: (widget.agrs as Channel).id ?? 0);
              //   } else {
              //     await _inforChannelScreenStore.deleteConversation(
              //         idConversation:
              //             (widget.agrs as Conversation).id ?? 0);
              //   }
              //   await _conversationScreenStore
              //       .getData(_loginScreenStore.currentAccount.mail ?? '');
              //   BaseNavigation.pop(context);
              //   BaseNavigation.pop(context);
              // }, title: S.current.confirmDeleteThis);
              // },
              // child: _buildRowTextIcon(
              //     colorIcon: AppColors.redPink,
              //     colorText: AppColors.redPink,
              //     title: S.current.delete,
              //     iconData: Icons.delete_forever),
              //),
              // const SizedBox(
              //   height: 45,
              // )
            ],
          ),
        ],
      ),
    );
  }

  _buildRowTextIcon(
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
          BaseText(title,
              style: GoogleFonts.notoSans(
                      fontWeight: FontWeight.w300,
                      fontSize: 14,
                      color: AppColors.black)
                  .copyWith(color: colorText)),
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
