import 'dart:io';

import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kyan/generated/l10n.dart';
import 'package:kyan/manager/manager_path_routes.dart';
import 'package:kyan/models/account.dart';
import 'package:kyan/screen/member_workspace_screen/store/member_workspace_screen_store.dart';
import 'package:kyan/theme/colors.dart';
import 'package:kyan/theme/dimens.dart';
import 'package:kyan/theme/images.dart';
import 'package:kyan/theme/shadows.dart';
import 'package:kyan/theme/text_styles.dart';
import 'package:kyan/utils/utils.dart';
import 'package:kyan/widgets/custom_appbar_add_item.dart';
import 'package:kyan/widgets/custom_appbar_back.dart';
import 'package:kyan/widgets/custom_circle_avatar.dart';
import 'package:kyan/widgets/custom_dialog_confirm.dart';

class MemberWorkspaceScreen extends BaseScreen {
  const MemberWorkspaceScreen({Key? key}) : super(key: key);

  @override
  State<MemberWorkspaceScreen> createState() => _MemberWorkspaceScreenState();
}

class _MemberWorkspaceScreenState
    extends BaseScreenState<MemberWorkspaceScreen, MemberWorkspaceScreenStore> {
  @override
  Widget buildSmallScreen(BuildContext context) {
    return _build(context);
  }

  Widget _build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context),
          _itemShowCodeJoin(context),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
              child: 'Members:'.b1R()),
          Expanded(
            child: Observer(
              builder: (_) {
                return ListView.builder(
                    padding: EdgeInsets.zero,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => _itemMemberWorkSpace(
                        context,
                        account: store.members.elementAt(index)),
                    itemCount: store.members.length);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Observer(
      builder: (context) {
        return SafeArea(
          child: (store.checkIsOwnerMember() == 1)
              ? customAppBarAddItem(context,
                  title: S.of(context).memberWorkspace, function: () {
                  BaseNavigation.push(context,
                      routeName: ManagerRoutes.selectPeopleScreen,
                      arguments: {
                        'workspaceId':
                            BaseNavigation.getArgs(context, key: 'workspaceId'),
                      });
                })
              : customAppBar(
                  context,
                  title: S.of(context).memberWorkspace,
                ),
        );
      },
    );
  }

  Widget _itemShowCodeJoin(BuildContext context) {
    return Observer(
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.symmetric(
              vertical: 5, horizontal: Dimens.SCREEN_PADDING),
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: Shadows.defaultShadow),
          child: Row(
            children: [
              Padding(
                  padding: const EdgeInsets.all(0),
                  child: Column(children: ['Worksapce Code Join: '.b1R()])),
              Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                    store.workspace.workspaceCodeJoin.toString().b1R()
                  ])),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                  onTap: () {
                    Clipboard.setData(new ClipboardData(
                        text: store.workspace.workspaceCodeJoin));
                    Utils.showToast('Copied Successfully');
                  },
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                    child: BaseSVG(
                      path: Images.iconCopy,
                      color: AppColors.gray,
                      width: 25,
                      height: 25,
                    ),
                  )),
            ],
          ),
        );
      },
    );
  }

  Widget _itemMemberWorkSpace(BuildContext context,
      {required Account account}) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(
          vertical: 5, horizontal: Dimens.SCREEN_PADDING),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: Shadows.defaultShadow),
      child: Row(
        children: [
          CustomCircleAvatar(
            width: 35,
            imageUrl: account.accountUrlPhoto,
          ),
          const SizedBox(width: Dimens.SCREEN_PADDING),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BaseText(
                  account.accountDisplayName,
                  style: AppTextStyle.defaultStyle
                      .copyWith(color: AppColors.black),
                  textOverflow: TextOverflow.ellipsis,
                ),
                BaseText(account.accountMail,
                    style: AppTextStyle.defaultStyle
                        .copyWith(color: AppColors.gray),
                    textOverflow: TextOverflow.ellipsis),
              ],
            ),
          ),
          (store.checkIsOwnerMember() == 1)
              ? GestureDetector(
                  onTap: () {
                    showDialogConfirm(context, icon: Icons.delete_forever,
                        onConfirm: () async {
                      store.onClickDelete(context,
                          accountId: account.accountId.toString());
                      BaseUtils.showToast('Delete successfully!',
                          bgColor: AppColors.primary);
                    }, title: S.of(context).confirmDeleteThis);
                  },
                  child: const BaseSVG(
                      path: Images.iconRemoveAccount, color: AppColors.redPink))
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
