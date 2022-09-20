import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:kyan/generated/l10n.dart';
import 'package:kyan/screen/info_channel_screen/store/info_channel_screen_store.dart';
import 'package:kyan/theme/colors.dart';
import 'package:kyan/theme/dimens.dart';
import 'package:kyan/widgets/custom_appbar_back.dart';
import 'package:kyan/widgets/custom_circle_avatar.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoChannelScreen extends BaseScreen {
  final String title;
  final bool isChannel;
  final dynamic agrs;
  final bool isPrivate;
  final String urlAvatar;
  const InfoChannelScreen(
      {Key? key,
      required this.title,
      required this.isChannel,
      required this.agrs,
      required this.isPrivate,
      required this.urlAvatar})
      : super(key: key);

  @override
  State<InfoChannelScreen> createState() => _InfoChannelScreenState();
}

class _InfoChannelScreenState
    extends BaseScreenState<InfoChannelScreen, InfoChannelScreenStore> {
  @override
  Widget buildSmallScreen(BuildContext context) {
    return _build(context);
  }

  Widget _build(BuildContext context) {
    return Scaffold(
        appBar: customAppBarBack(context, title: S.current.infoChat),
        backgroundColor: AppColors.white,
        body: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: Dimens.SCREEN_PADDING),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                if (!widget.isChannel) _buildImage(),
                _buildBody(context),
              ],
            ),
          ),
        ));
  }

  Widget _buildImage() {
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.primary, width: 1)),
      width: 100,
      height: 100,
      child: Center(
        child: CustomCircleAvatar(imageUrl: widget.urlAvatar, width: 100),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (!widget.isChannel)
            Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment:
                      widget.isChannel ? Alignment.topLeft : Alignment.center,
                  child: BaseText(widget.title,
                      style: GoogleFonts.notoSans(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: AppColors.primary)
                          .copyWith(color: AppColors.black)),
                ),
                const SizedBox(
                  height: 35,
                ),
              ],
            ),
          ListView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            children: [
              if (widget.isChannel)
                Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: widget.isChannel
                          ? Alignment.topLeft
                          : Alignment.center,
                      child: BaseText(widget.title,
                          style: GoogleFonts.notoSans(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: AppColors.primary)
                              .copyWith(color: AppColors.black)),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                  ],
                ),
              const SizedBox(height: 5),
            ],
          ),
        ],
      ),
    );
  }

  _buildRowTextIcon(
      {required String title,
      required IconData iconData,
      Color colorIcon = AppColors.black,
      Color colorText = AppColors.black,
      bool isShowIcon = true,
      Function? onPressIcon}) {
    return Container(
      color: AppColors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BaseText(title,
              style: GoogleFonts.notoSans(
                      fontWeight: FontWeight.w300,
                      fontSize: 14,
                      color: AppColors.black)
                  .copyWith(color: colorText)),
          isShowIcon
              ? GestureDetector(
                  onTap: () {
                    onPressIcon?.call();
                  },
                  child: Icon(
                    iconData,
                    color: colorIcon,
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
