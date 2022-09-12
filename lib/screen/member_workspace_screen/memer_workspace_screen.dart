import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:kyan/generated/l10n.dart';
import 'package:kyan/models/account.dart';
import 'package:kyan/models/workspace.dart';
import 'package:kyan/screen/login_screen/store/login_screen_store.dart';
import 'package:kyan/screen/member_workspace_screen/store/member_workspace_screen_store.dart';
import 'package:kyan/theme/colors.dart';
import 'package:kyan/theme/dimens.dart';
import 'package:kyan/theme/shadows.dart';
import 'package:kyan/theme/text_styles.dart';
import 'package:kyan/widgets/custom_appbar_back.dart';
import 'package:kyan/widgets/custom_circle_avatar.dart';
import 'package:kyan/widgets/custom_dialog_confirm.dart';
import 'package:provider/provider.dart';

class MemberWorkspaceSceen extends BaseScreen {
  const MemberWorkspaceSceen({Key? key}) : super(key: key);

  @override
  State<MemberWorkspaceSceen> createState() => _MemberWorkspaceSceenState();
}

class _MemberWorkspaceSceenState
    extends BaseScreenState<MemberWorkspaceSceen, MemberWorkspaceScreenStore> {
  @override
  Widget buildSmallScreen(BuildContext context) {
    return _build(context);
  }

  Widget _build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: customAppBarBack(context, title: S.current.memberWorkspace),
      body: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => _itemMemberWorkSpace(Account()),
          itemCount: 5),
    );
  }

  Widget _itemMemberWorkSpace(Account account) {
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
          // if (loginScreenStore.currentAccount.mail ==
          //         BaseNavigation.getArgs<Workspace>(context, key: 'workspace')
          //             .mailOwner &&
          //     loginScreenStore.currentAccount.mail != account.mail)
          GestureDetector(
              onTap: () {
                showDialogConfirm(context, icon: Icons.delete_forever,
                    onConfirm: () async {
                  // store.deleteMemberWorkspace(
                  //     idWorkSpace: BaseNavigation.getArgs<Workspace>(context,
                  //                 key: 'workspace')
                  //             .id ??
                  //         0,
                  //     mailAccount: account.mail ?? '');
                  // BaseNavigation.pop(context);
                  // BaseNavigation.pop(context);
                  // BaseNavigation.pop(context);
                }, title: S.current.confirmDeleteThis);
              },
              child: const Icon(Icons.delete_forever, color: AppColors.redPink))
        ],
      ),
    );
  }
}
