import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kyan/models/channel_message.dart';
import 'package:kyan/screen/list_message_screen/list_message_screen_store/list_message_screen_store.dart';
import 'package:kyan/screen/list_message_screen/widgets/message_bubble.dart';
import 'package:kyan/theme/colors.dart';
import 'package:kyan/theme/dimens.dart';
import 'package:kyan/widgets/custom_text_form_field.dart';
import 'package:google_fonts/google_fonts.dart';

class ListMessageScreen extends BaseScreen {
  final dynamic agrs;
  final isModeSearch;
  const ListMessageScreen(
      {Key? key, required this.agrs, this.isModeSearch = false})
      : super(key: key);

  @override
  State<ListMessageScreen> createState() => _ListMessageScreenState();
}

class _ListMessageScreenState
    extends BaseScreenState<ListMessageScreen, ListMessageScreenStore> {
  TextEditingController _searchController = TextEditingController();

  @override
  Widget buildSmallScreen(BuildContext context) {
    return _build(context);
  }

  Widget _build(BuildContext context) {
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 1));
        },
        child: Observer(builder: (_) {
          List<ChannelMessage> list = store.chatScreenStore.messages.toList();

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 10,
                    left: Dimens.SCREEN_PADDING,
                    right: Dimens.SCREEN_PADDING),
                child: CustomTextFormField(
                  onChanged: (_) {
                    setState(() {});
                  },
                  textEditingController: _searchController,
                  hintText: 'Search here ...',
                  hintStyle: GoogleFonts.notoSans(
                      fontWeight: FontWeight.w300,
                      fontSize: 12,
                      color: AppColors.gray),
                  isModeBorder: true,
                ),
              ),
              Expanded(
                child: Scrollbar(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(
                        vertical: Dimens.SCREEN_PADDING),
                    reverse: true,
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      return MessageBubble(
                          message: list.elementAt(index),
                          child: list
                                  .elementAt(index)
                                  .channelMessageContent
                                  ?.b1R() ??
                              const SizedBox.shrink());
                    },
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
