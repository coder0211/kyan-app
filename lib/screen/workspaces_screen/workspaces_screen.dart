import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kyan/generated/l10n.dart';
import 'package:kyan/manager/manager_path_routes.dart';
import 'package:kyan/screen/create_workspace_screen/create_workspace_screen.dart';
import 'package:kyan/screen/mdbts_search_code_join_screen.dart/mdbts_search_code_join.dart';
import 'package:kyan/screen/workspaces_screen/store/workspaces_screen_store.dart';
import 'package:kyan/theme/colors.dart';
import 'package:kyan/theme/dimens.dart';
import 'package:kyan/theme/images.dart';
import 'package:kyan/widgets/custom_circle_avatar.dart';
import 'package:kyan/models/workspace.dart';
import 'package:kyan/const/consts.dart';
import 'package:google_fonts/google_fonts.dart';

class WorkspaceScreen extends BaseScreen {
  const WorkspaceScreen({Key? key}) : super(key: key);

  @override
  State<WorkspaceScreen> createState() => _WorkspaceScreenState();
}

class _WorkspaceScreenState
    extends BaseScreenState<WorkspaceScreen, WorkspacesScreenStore> {
  @override
  Widget buildSmallScreen(BuildContext context) {
    return _build(context);
  }

  Widget _build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 10, horizontal: Dimens.SCREEN_PADDING),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: BaseText(S.current.workspace,
                            style: GoogleFonts.notoSans(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: AppColors.primary))),
                    GestureDetector(
                      onTap: () {
                        mdbtsSearchCodeJoinScreen(context);
                      },
                      child: const Icon(
                        Icons.search,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                      child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: ((context, index) => GestureDetector(
                        onTap: () {
                          BaseNavigation.pop(context);
                          //await _onPressedItem(index);
                        },
                        child: _itemWorkSpace(
                            store.currentWorkspaceId ==
                                store.workspaces[index].workspaceId,
                            workspace: store.workspaces[index]))),
                    itemCount: store.workspaces.length,
                  )),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: Dimens.SCREEN_PADDING),
                    child: BaseButton(
                        bgColor: AppColors.primary,
                        onPressed: () {
                          mdbtsCreateWorkspaceScreen(context);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            BaseText(
                              S.current.createWorkspace,
                              style: GoogleFonts.notoSans(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: AppColors.white),
                              textOverflow: TextOverflow.ellipsis,
                            ),
                          ],
                        )),
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }

  Widget _itemWorkSpace(isChoose, {required Workspace workspace}) {
    return AnimatedContainer(
      margin: const EdgeInsets.symmetric(
          horizontal: Dimens.SCREEN_PADDING, vertical: 2),
      duration: const Duration(milliseconds: TIME_ANIMATION_SHORT),
      decoration: BoxDecoration(
        color: isChoose ? AppColors.lightPrimary : AppColors.transparent,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.white, width: 2),
                shape: BoxShape.circle),
            child: CustomCircleAvatar(
              width: 45,
              imageUrl: workspace.workspaceUrlPhoto,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BaseText(
                  workspace.workspaceName,
                  textOverflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                  style: GoogleFonts.notoSans(
                      fontWeight: FontWeight.w300,
                      fontSize: 16,
                      color: AppColors.black),
                ),
                GestureDetector(
                  onTap: () {
                    BaseUtils.copy(context,
                        content: workspace.workspaceCodeJoin.toString(),
                        bgColor: null);
                  },
                  child: Row(
                    children: [
                      RichText(
                        text: TextSpan(
                          text: S.current.code,
                          style: GoogleFonts.notoSans(
                              fontWeight: FontWeight.w300,
                              fontSize: 14,
                              color: AppColors.black),
                          children: <TextSpan>[
                            TextSpan(
                                text: workspace.workspaceCodeJoin.toString(),
                                style: GoogleFonts.notoSans(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: AppColors.primary)),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Icon(
                        Icons.copy,
                        size: 15,
                        color: AppColors.gray,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: () {
              BaseNavigation.push(context,
                  routeName: ManagerRoutes.staticScreen,
                  arguments: {'workspace': workspace});
            },
            child: Row(
              children: [
                BaseText(
                  //'(${workspace.listMember?.length})',
                  '',
                  style: GoogleFonts.notoSans(
                      fontWeight: FontWeight.w300,
                      fontSize: 14,
                      color: AppColors.black),
                ),
                const BaseSVG(
                  path: Images.iconMember,
                  width: 20,
                  color: AppColors.black,
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
