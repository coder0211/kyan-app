import 'package:coder0211/coder0211.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:kyan/generated/l10n.dart';
import 'package:kyan/screen/intro_screen/store/intro_screen_store.dart';
import 'package:kyan/theme/colors.dart';
import 'package:kyan/theme/dimens.dart';
import 'package:kyan/theme/images.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroScreen extends BaseScreen {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends BaseScreenState<IntroScreen, IntroScreenStore> {
  Widget _buildImage(String assetName, [double height = 200]) {
    return Image.asset('$assetName', height: height);
  }

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
    TextStyle bodyStyle = GoogleFonts.notoSans(fontSize: 19.0);

    PageDecoration pageDecoration = PageDecoration(
      titleTextStyle:
          GoogleFonts.notoSans(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: AppColors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: store.introKey,
      globalBackgroundColor: AppColors.white,
      globalHeader: Align(
        alignment: Alignment.topRight,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
                top: Dimens.SCREEN_PADDING, right: Dimens.SCREEN_PADDING),
            child: _buildImage(Images.iconLogoAppWhite, 65),
          ),
        ),
      ),
      pages: [
        PageViewModel(
          title: S.current.bigCommunity,
          body: S.current.bodyCommunity,
          image: _buildImage(Images.imageIntro1),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: S.current.remoteControl,
          body: S.current.bodyRemoteControl,
          image: _buildImage(Images.imageIntro2),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: S.current.friendlyLayout,
          body: S.current.bodyFriendlyLayout,
          image: _buildImage(Images.imageIntro3),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: S.current.taskManager,
          body: S.current.bodyTaskManager,
          image: _buildImage(Images.imageIntro4),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => store.onIntroEnd(context),
      onSkip: () =>
          store.onIntroEnd(context), // You can override onSkip callback
      showSkipButton: false,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: true,
      back: const Icon(Icons.arrow_back, color: AppColors.primary),
      skip: S.current.skip.t2R(color: AppColors.primary),
      next: const Icon(Icons.arrow_forward, color: AppColors.primary),
      done: S.current.done.t2R(color: AppColors.primary),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: AppColors.gray,
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
