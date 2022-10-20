import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kyan/const/consts.dart';
import 'package:kyan/generated/l10n.dart';
import 'package:kyan/manager/manager_path_routes.dart';
import 'package:kyan/screen/Info_channel_screen/info_channel_screen.dart';
import 'package:kyan/screen/chat_sceen/store/chat_screen_store.dart';
import 'package:kyan/screen/chat_sceen/widgets/input_chat_screen.dart';
import 'package:kyan/theme/colors.dart';
import 'package:kyan/theme/images.dart';
import 'package:kyan/widgets/custom_circle_avatar.dart';

class ChatScreen extends BaseScreen {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends BaseScreenState<ChatScreen, ChatScreenStore> {
  @override
  Widget buildSmallScreen(BuildContext context) {
    return _build(context);
  }

  Widget _build(BuildContext context) {
    return Scaffold(
      endDrawer: _buildDrawer(),
      appBar: _buildAppBar(),
      body: GestureDetector(
          onTap: () => BaseUtils.hideKeyboard(context),
          child: const Padding(
            padding: EdgeInsets.only(bottom: 63),
          )),
      bottomSheet: InputChatScreen(
        chatScreenStore: store,
      ),
    );
  }

  Widget _buildDrawer() {
    return Observer(builder: (_) {
      return InfoChannelScreen(
          urlAvatar: '',
          title: 'Public or private',
          isChannel: true,
          agrs: store.spaceChat,
          isPrivate: false);
    });
  }

  PreferredSizeWidget _buildAppBar() {
    bool? isPrivate =
        false; //BaseNavigation.getArgs(context, key: 'isPrivate');
    return AppBar(
      title: Builder(
          builder: (context) => GestureDetector(
                onTap: () => Scaffold.of(context).openEndDrawer(),
                child: Row(
                  children: [
                    if (isPrivate == null)
                      const CustomCircleAvatar(
                        width: 35,
                        imageUrl: DEFAULT_AVATAR,
                      )
                    else
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: AppColors.white),
                        child: Center(
                          child: Image.asset(
                            isPrivate ? Images.iconPrivate : Images.iconPublic,
                            width: 20,
                          ),
                        ),
                      ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: S.current.titile.t1M(color: AppColors.white)),
                  ],
                ),
              )),
      backgroundColor: AppColors.primary,
      shadowColor: AppColors.primary.withOpacity(0.5),
      leading: GestureDetector(
          onTap: () {
            BaseNavigation.push(context,
                routeName: ManagerRoutes.conversationScreen);
          },
          child: const Icon(Icons.navigate_before)),
      actions: [
        Builder(builder: (context) => Container()),
      ],
    );
  }
}
