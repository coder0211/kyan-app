import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:kyan/generated/l10n.dart';
import 'package:kyan/screen/splash_screen/store/splash_screen_store.dart';
import 'package:kyan/theme/colors.dart';
import 'package:kyan/theme/images.dart';

class SplashScreen extends BaseScreen {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState
    extends BaseScreenState<SplashScreen, SplashScreenStore> {
  @override
  Widget buildSmallScreen(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    return Scaffold(
        backgroundColor: AppColors.white,
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(Images.iconLogoAppWhite,
                  height: 0.4.w(context), width: 0.4.w(context)),
              S.of(context).appName.h1R(color: AppColors.primary)
            ],
          ),
        ));
  }
}
