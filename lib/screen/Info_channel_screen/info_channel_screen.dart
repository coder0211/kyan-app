import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:kyan/generated/l10n.dart';
import 'package:kyan/theme/colors.dart';
import 'package:kyan/theme/dimens.dart';
import 'package:kyan/widgets/custom_appbar_back.dart';
import 'package:kyan/widgets/custom_circle_avatar.dart';

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

class _InfoChannelScreenState extends State<InfoChannelScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(context, title: S.of(context).infoChat),
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
                _buildImage(),
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
      child: const Center(
        child: CustomCircleAvatar(imageUrl: '', width: 100),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (true)
            Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: true ? Alignment.topLeft : Alignment.center,
                  child: 'title'.b1(color: AppColors.black),
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
              if (true)
                Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: true ? Alignment.topLeft : Alignment.center,
                      child: 'title'.b1(color: AppColors.black),
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

  Container _buildRowTextIcon(
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
          title.b1R(color: colorText),
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
