import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kyan/generated/l10n.dart';
import 'package:kyan/screen/login_screen/store/login_screen_store.dart';
import 'package:kyan/theme/colors.dart';
import 'package:kyan/theme/dimens.dart';
import 'package:kyan/theme/images.dart';

class LoginScreen extends BaseScreen {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends BaseScreenState<LoginScreen, LoginScreenStore> {
  @override
  Widget buildLarge(BuildContext context) {
    return 'Large'.t1M();
  }

  @override
  Widget buildMedium(BuildContext context) {
    return 'Medium'.t1M();
  }

  @override
  Widget buildSmall(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    return Scaffold(
        backgroundColor: AppColors.white,
        body: Stack(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: Dimens.SCREEN_PADDING),
                child:
                    Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                  Image.asset(Images.iconLogoAppWhite,
                      width: BaseUtils.getScreenWidth(context) * 0.42),
                  const SizedBox(height: 22),
                  S.current.welcome.t2R(color: AppColors.black),
                  S.current.descriptionWelcome.b2R(color: AppColors.black),
                  const SizedBox(height: 35),
                  BaseButton(
                    onPressed: () async {
                      await store.onPressLogin.call(context);
                    },
                    child: Stack(
                      children: [
                        Image.asset(Images.iconGoogle, width: 32),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: S.current.loginWithGoogle
                                .b1(color: AppColors.white),
                          ),
                        ),
                      ],
                    ),
                    bgColor: AppColors.primary,
                    splashColor: AppColors.white,
                  )
                ]),
              ),
            ),
            Observer(
                builder: (_) => store.isShowLoading
                    ? Container(
                        height: 1.0.h(context),
                        width: 1.0.w(context),
                        color: AppColors.gray.withOpacity(0.35),
                        child: const Center(
                          child: BaseIndicator(),
                        ),
                      )
                    : Container())
          ],
        ));
  }
}
