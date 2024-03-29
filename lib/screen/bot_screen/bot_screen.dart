import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:kyan/generated/l10n.dart';
import 'package:kyan/manager/manager_path_routes.dart';
import 'package:kyan/screen/bot_screen/store/bot_screen_store.dart';
import 'package:kyan/screen/bot_screen/widget/item_bot.dart';
import 'package:kyan/theme/colors.dart';
import 'package:kyan/theme/dimens.dart';
import 'package:kyan/theme/images.dart';
import 'package:kyan/widgets/custom_appbar_back.dart';

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
      appBar:
          customAppBar(context, title: S.of(context).bot, isShowBack: false),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Dimens.SCREEN_PADDING),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {
                          BaseNavigation.push(context,
                              routeName: ManagerRoutes.pomodoroBotScreen);
                        },
                        child: const ItemBot(
                          iconColor: AppColors.primary,
                          iconPath: Images.iconTime,
                          description: 'time countdown',
                          title: 'Kyan Reminder',
                        ));
                  },
                  itemCount: 1),
            ),
          ],
        ),
      ),
    );
  }
}
