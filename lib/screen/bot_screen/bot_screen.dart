import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kyan/generated/l10n.dart';
import 'package:kyan/manager/manager_path_routes.dart';
import 'package:kyan/screen/bot_screen/store/bot_screen_store.dart';
import 'package:kyan/screen/bot_screen/widget/item_bot.dart';
import 'package:kyan/theme/colors.dart';
import 'package:kyan/theme/dimens.dart';
import 'package:kyan/theme/text_styles.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

class BotScreen extends BaseScreen {
  const BotScreen({Key? key}) : super(key: key);

  @override
  State<BotScreen> createState() => _BotScreenState();
}

class _BotScreenState extends BaseScreenState<BotScreen, BotScreenStore> {
  @override
  Widget buildSmallScreen(BuildContext context) {
    return _build(context);
  }

  Widget _build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.primary,
        title: BaseText(S.current.bot,
            style: GoogleFonts.notoSans(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: AppColors.primary)),
        centerTitle: true,
        shadowColor: AppColors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Dimens.SCREEN_PADDING),
        child: Column(
          children: [
            // CustomTextFormField(
            //   hintText: 'Search bot..',
            //   bgColor: AppColors.white,
            //   onChanged: (value) {
            //     print(value);
            //   },
            //   isModeBorder: true,
            // ),
            Expanded(
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        BaseNavigation.push(context,
                            routeName: ManagerRoutes.pomodoroBotScreen);
                      },
                      child: Observer(builder: (_) {
                        return const ItemBot(
                          iconColor: AppColors.primary,
                          iconPath: 'icon path',
                          description: 'description',
                          title: 'title',
                        );
                      }),
                    );
                  },
                  itemCount: 2),
            ),
          ],
        ),
      ),
    );
  }
}