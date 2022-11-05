import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kyan/generated/l10n.dart';
import 'package:kyan/manager/manager_path_routes.dart';
import 'package:kyan/models/account.dart';
import 'package:kyan/screen/member_workspace_screen/store/member_workspace_screen_store.dart';
import 'package:kyan/theme/colors.dart';
import 'package:kyan/theme/dimens.dart';
import 'package:kyan/theme/shadows.dart';
import 'package:kyan/theme/text_styles.dart';
import 'package:kyan/widgets/custom_appbar_add_item.dart';
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
        children: [
          _buildHeader(context),
          Flexible(
            child: Observer(builder: (_) {
              return ListView.builder(
                  padding: EdgeInsets.zero,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => _itemMemberWorkSpace(
                      account: store.members.elementAt(index)),
                  itemCount: store.members.length);
            }),
          ),
          _itemAddMember(),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return customAppBarAddItem(context, title: S.of(context).memberWorkspace,
        function: () {
      BaseNavigation.push(context,
          routeName: ManagerRoutes.selectPeopleScreen,
          arguments: {
            'workspaceId': BaseNavigation.getArgs(context, key: 'workspaceId'),
          });
    });
  }

  Widget _itemAddMember() {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(
          vertical: 5, horizontal: Dimens.SCREEN_PADDING),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: Shadows.defaultShadow),
    );
  }

  Widget _itemMemberWorkSpace({required Account account}) {
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
          GestureDetector(
              onTap: () {
                showDialogConfirm(context, icon: Icons.delete_forever,
                    onConfirm: () async {
                  store.onClickDelete(context,
                      accountId: account.accountId.toString());
                  BaseNavigation.pop(context);
                  BaseNavigation.pop(context);
                }, title: S.of(context).confirmDeleteThis);
              },
              child:
                  const Icon(Icons.delete_forever, color: AppColors.redPink)),
        ],
      ),
    );
  }
}
