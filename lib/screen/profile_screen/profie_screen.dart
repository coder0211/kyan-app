import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kyan/generated/l10n.dart';
import 'package:kyan/manager/manager_path_routes.dart';
import 'package:kyan/manager/manager_provider.dart';
import 'package:kyan/screen/profile_screen/store/profile_screen_store.dart';
import 'package:kyan/screen/profile_screen/widgets/swipe_languages.dart';
import 'package:kyan/theme/colors.dart';
import 'package:kyan/theme/dimens.dart';
import 'package:kyan/theme/images.dart';
import 'package:kyan/theme/shadows.dart';
import 'package:kyan/widgets/custom_circle_avatar.dart';
import 'package:kyan/widgets/custom_dialog_about_us.dart';
import 'package:kyan/widgets/custom_dialog_confirm.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends BaseScreen {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState
    extends BaseScreenState<ProfileScreen, ProfileScreenStore> {
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
        borderRadius: const BorderRadius.horizontal(right: Radius.circular(20)),
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildInfo(),
            Padding(
              padding: const EdgeInsets.all(Dimens.SCREEN_PADDING),
              child: Column(
                children: [_buildRowData(), _buildActions()],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildRowData() {
    return Column(
      children: [
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: ['20'.b1R(), 'Tasks'.b1()],
            ),
            Column(
              children: ['3'.b1R(), 'Workspace'.b1()],
            ),
            Column(
              children: ['20'.b1R(), 'Threads'.b1()],
            )
          ],
        ),
        const SizedBox(height: 20),
        _buildDivider()
      ],
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
            height: 26,
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
      decoration: BoxDecoration(
          boxShadow: Shadows.shadow4,
          color: AppColors.primary,
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20))),
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
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Observer(
                builder: (_) =>
                    (S.current.language + ' : ${store.localeLanguage}').b2R()),
            Observer(
              builder: (_) => SwipeLanguages(
                onTapVi: () async {
                  await store.setLanguages(context, language: 'vi');
                },
                onTapEn: () async {
                  await store.setLanguages(context, language: 'en');
                },
                isEn: store.localeLanguage == 'en',
              ),
            )
          ],
        ),
        _buildDivider(),
        GestureDetector(
          onTap: () {
            launch(Uri(scheme: 'mailto', path: 'team@tdof.dev').toString());
          },
          child: _buildRowIconText(
              title: S.current.feedBack, iconData: Images.iconFeedback),
        ),
        _buildDivider(),
        GestureDetector(
          onTap: () {
            BaseNavigation.push(context, routeName: ManagerRoutes.splashScreen);
          },
          child: _buildRowIconText(
              title: S.current.statistical, iconData: Images.iconStatistics),
        ),
        _buildDivider(),
        GestureDetector(
            onTap: () {
              showDialogAboutUs(context,
                  mail: ManagerRoutes.splashScreen); // statical screen
            },
            child: _buildRowIconText(
                title: S.current.aboutUs, iconData: Images.iconAbout)),
        _buildDivider(),
        GestureDetector(
            onTap: () async {
              showDialogConfirm(context,
                  icon: Icons.logout,
                  title: S.current.confirmLogout, onConfirm: () async {
                await ManagerProvider.dispose(context);
                await store.logout(context);
              });
            },
            child: _buildRowIconText(
                title: S.current.logout,
                iconData: Images.iconLogout,
                colorText: AppColors.redPink)),
      ],
    );
  }

  Widget _buildDivider() {
    return const Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: const Divider(color: AppColors.gray));
  }
}
