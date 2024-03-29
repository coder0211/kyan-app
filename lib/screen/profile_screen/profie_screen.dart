import 'package:cached_network_image/cached_network_image.dart';
import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kyan/const/consts.dart';
import 'package:kyan/enums/enum_languages.dart';
import 'package:kyan/generated/l10n.dart';
import 'package:kyan/manager/manager_path_routes.dart';
import 'package:kyan/manager/manager_provider.dart';
import 'package:kyan/models/workspace.dart';
import 'package:kyan/screen/mdbts_search_code_join_screen.dart/mdbts_search_code_join.dart';
import 'package:kyan/screen/profile_screen/store/profile_screen_store.dart';
import 'package:kyan/screen/profile_screen/widgets/swipe_languages.dart';
import 'package:kyan/theme/colors.dart';
import 'package:kyan/theme/dimens.dart';
import 'package:kyan/theme/images.dart';
import 'package:kyan/theme/shadows.dart';
import 'package:kyan/widgets/custom_circle_avatar.dart';
import 'package:kyan/widgets/custom_dialog_about_us.dart';
import 'package:kyan/widgets/custom_dialog_confirm.dart';
import 'package:kyan/widgets/custom_dialog_custom_option.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:kyan/screen/create_workspace_screen/create_workspace_screen.dart';

class ProfileScreen extends BaseScreen {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState
    extends BaseScreenState<ProfileScreen, ProfileScreenStore> {
  late TextEditingController textController = TextEditingController();

  @override
  Widget buildSmallScreen(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    return Container(
      width: 0.8.w(context),
      height: 1.0.h(context),
      decoration: BoxDecoration(
        boxShadow: Shadows.shadow5,
        color: AppColors.white,
        borderRadius: const BorderRadius.horizontal(right: Radius.circular(26)),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.horizontal(right: Radius.circular(26)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildInfo(),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(Dimens.SCREEN_PADDING),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            S.of(context).workspace.b2(),
                            Row(children: [
                              GestureDetector(
                                  onTap: () => {
                                        showDialogCustomTwoOption(context,
                                            option1: 'Join',
                                            option2: 'Create', func1: () {
                                          mdbtsSearchCodeJoinScreen(context);
                                        }, func2: () {
                                          mdbtsCreateWorkspaceScreen(context);
                                        })
                                      },
                                  child: const Icon(Icons.add, size: 27))
                            ])
                          ]),
                      _buildDivider(),
                      Padding(
                          padding: const EdgeInsets.symmetric(vertical: 1),
                          child: Observer(
                            builder: (_) => _buildListWorkspace(),
                          )),
                      _buildActions()
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildRowIconText(
      {required String title,
      required String iconData,
      Color colorText = AppColors.black}) {
    return Container(
      color: AppColors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            iconData,
            height: 16,
          ),
          const SizedBox(width: 10),
          title.b2R(color: colorText)
        ],
      ),
    );
  }

  Widget _buildInfo() {
    return Container(
      width: 0.8.w(context),
      decoration: const BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(26),
              bottomLeft: Radius.circular(26),
              bottomRight: Radius.circular(26))),
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            CustomCircleAvatar(
                imageUrl: store.accountUrlPhoto,
                width: 128,
                isShowBordered: true),
            const SizedBox(
              height: 20,
            ),
            store.accountDisplayName.b1(color: AppColors.white),
            const SizedBox(
              height: 5,
            ),
            store.accountMail.b2R(color: AppColors.white),
            const SizedBox(height: 20)
          ],
        ),
      ),
    );
  }

  Widget _buildActions() {
    return SafeArea(
      top: false,
      left: false,
      right: false,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildDivider(),
          Align(
              alignment: Alignment.centerLeft,
              child: S.of(context).settings.b2()),
          _buildDivider(),
          GestureDetector(
            onTap: () {
              launch(Uri(scheme: MAIL_TO, path: MAIL_US).toString());
            },
            child: _buildRowIconText(
                title: S.of(context).feedBack, iconData: Images.iconFeedback),
          ),
          _buildDivider(),
          GestureDetector(
            onTap: () {
              BaseNavigation.push(context,
                  routeName: ManagerRoutes.staticScreen);
            },
            child: _buildRowIconText(
                title: S.of(context).statistical,
                iconData: Images.iconStatistics),
          ),
          _buildDivider(),
          GestureDetector(
              onTap: () {
                showDialogAboutUs(context,
                    mail: ManagerRoutes.splashScreen); // statical screen
              },
              child: _buildRowIconText(
                  title: S.of(context).aboutUs, iconData: Images.iconAbout)),
          _buildDivider(),
          _buildActionChangeLanguages(),
          _buildDivider(),
          GestureDetector(
              onTap: () async {
                showDialogConfirm(context,
                    icon: Icons.logout,
                    title: S.of(context).confirmLogout, onConfirm: () async {
                  await ManagerProvider.dispose(context);
                  await store.logout(context);
                });
              },
              child: _buildRowIconText(
                  title: S.of(context).logout,
                  iconData: Images.iconLogout,
                  colorText: AppColors.redPink)),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return const Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: const Divider(color: AppColors.gray));
  }

  Widget _buildActionChangeLanguages() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Observer(
            builder: (_) => _buildRowIconText(
                title: (S.of(context).language + ' : ${store.localeLanguage}'),
                iconData: Images.iconLanguage)),
        Observer(
          builder: (_) => SwipeLanguages(
            onTapVi: () async {
              await store.setLanguages(context,
                  languageCode: EnumLanguages.vi.name);
            },
            onTapEn: () async {
              await store.setLanguages(context,
                  languageCode: EnumLanguages.en.name);
            },
            isEn: store.isEn,
          ),
        )
      ],
    );
  }

  Widget _buildListWorkspace() {
    return ListView.builder(
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: store.workspaces.length,
      itemBuilder: (context, index) => _buildItemWorkspace(
          item: store.workspaces[index],
          isSelected:
              store.currentWorkspaceId == store.workspaces[index].workspaceId,
          onPressedWorkspace: () async {
            await store.onPressedWorkspace(context,
                workspace: store.workspaces.elementAt(index));
            BaseNavigation.pop(context);
            await store.tasksScreenStore.getListTask();
          }),
    );
  }

  Widget _buildItemWorkspace(
      {required Workspace item,
      required bool isSelected,
      required VoidCallback onPressedWorkspace}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: TIME_ANIMATION),
      margin: const EdgeInsets.symmetric(vertical: 2),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: isSelected ? Shadows.shadow1 : null,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          _buildWorkspacePhoto(
            isSelected: isSelected,
            imageUrl: item.workspaceUrlPhoto ?? DEFAULT_PHOTO_WORKSPACE,
          ),
          const SizedBox(width: 5),
          Expanded(
              child: GestureDetector(
                  onTap: () {
                    onPressedWorkspace.call();
                  },
                  child: (item.workspaceName ?? '').b2R())),
          GestureDetector(
              onTap: () {
                BaseNavigation.push(context,
                    routeName: ManagerRoutes.memberWorkspaceScreen,
                    arguments: {'workspaceId': item.workspaceId});
              },
              child: const Icon(
                Icons.people_alt_outlined,
                size: 27,
              ))
        ],
      ),
    );
  }

  Widget _buildWorkspacePhoto({
    String? imageUrl,
    double? width,
    bool isSelected = true,
  }) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.transparent,
            width: 2),
      ),
      child: (imageUrl != null)
          ? CachedNetworkImage(
              width: width ?? 52,
              height: width ?? 52,
              imageUrl: imageUrl,
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        color: isSelected ? AppColors.gray : AppColors.gray,
                        width: 1),
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: imageProvider, fit: BoxFit.cover)),
              ),
              placeholder: (context, url) => const BaseIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            )
          : Container(
              width: width ?? 52,
              height: width ?? 52,
              decoration: BoxDecoration(
                color: AppColors.redPink,
                border: Border.all(
                    color: isSelected ? AppColors.transparent : AppColors.gray,
                    width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(child: 'W'.b1(color: AppColors.white)),
            ),
    );
  }
}
