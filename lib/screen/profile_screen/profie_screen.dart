import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:kyan/generated/l10n.dart';
import 'package:kyan/manager/manager_path_routes.dart';
import 'package:kyan/screen/profile_screen/profile_screen_store/profile_screen_store.dart';
import 'package:kyan/theme/colors.dart';
import 'package:kyan/theme/dimens.dart';
import 'package:kyan/theme/images.dart';
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
    return Scaffold(
        backgroundColor: AppColors.white,
        body: SingleChildScrollView(
          padding:
              const EdgeInsets.symmetric(horizontal: Dimens.SCREEN_PADDING),
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                  padding: EdgeInsets.only(
                      top: BaseUtils.getScreenWidth(context) * 0.3)),
              const SizedBox(
                height: 10,
              ),
              const CustomCircleAvatar(
                  imageUrl: Images.iconProfile, width: 100),

              const SizedBox(
                height: 10,
              ),
              'Username'.b1R(),
              const SizedBox(
                height: 5,
              ),
              // email address
              'User email address'.b2R(),
              const SizedBox(
                height: 20,
              ),
              const Divider(),
              GestureDetector(
                onTap: () {
                  launch(
                      Uri(scheme: 'mailto', path: 'team@tdof.dev').toString());
                },
                child: _buildRowTextIcon(
                    title: S.current.feedBack, iconData: Icons.feedback),
              ),

              const Divider(),
              GestureDetector(
                onTap: () {
                  BaseNavigation.push(context,
                      routeName: ManagerRoutes.splashScreen);
                },
                child: _buildRowTextIcon(
                    title: S.current.statistical, iconData: Icons.bar_chart),
              ),
              const Divider(),
              GestureDetector(
                  onTap: () {
                    showDialogAboutUs(context,
                        mail: ManagerRoutes.splashScreen); // statical screen
                  },
                  child: _buildRowTextIcon(
                      title: S.current.aboutUs,
                      iconData: Icons.info_outline_rounded)),
              const Divider(),
              GestureDetector(
                  onTap: () async {
                    showDialogConfirm(context,
                        icon: Icons.logout,
                        title: S.current.confirmLogout, onConfirm: () async {
                      // await ManagerProvider.dispose(context);
                      // await _loginScreenStore.handleSignOut(context);
                    });
                  },
                  child: _buildRowTextIcon(
                      title: S.current.logout,
                      iconData: Icons.logout,
                      colorIcon: AppColors.redPink,
                      colorText: AppColors.redPink))
            ],
          ),
        ));
  }

  Widget _buildRowTextIcon(
      {required String title,
      required IconData iconData,
      Color colorIcon = AppColors.black,
      Color colorText = AppColors.black}) {
    return Container(
      color: AppColors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          title.b1R(),
          Icon(
            iconData,
            color: colorIcon,
          )
        ],
      ),
    );
  }
}
