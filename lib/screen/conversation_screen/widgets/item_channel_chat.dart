import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:kyan/theme/colors.dart';
import 'package:kyan/theme/dimens.dart';
import 'package:kyan/theme/images.dart';

class ItemChannelChat extends StatelessWidget {
  final bool isPrivate;
  final String titleChannel;
  final Function() onPressed;
  const ItemChannelChat(
      {Key? key,
      this.isPrivate = false,
      required this.titleChannel,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed.call();
      },
      child: Container(
        margin: const EdgeInsets.only(left: 10),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5))),
        padding: const EdgeInsets.symmetric(
            horizontal: Dimens.SCREEN_PADDING, vertical: 10),
        child: Row(
          children: [
            Image.asset(
              isPrivate ? Images.iconPrivate : Images.iconPublic,
              width: 20,
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: titleChannel.b2R(color: AppColors.black),
            ),
          ],
        ),
      ),
    );
  }
}
