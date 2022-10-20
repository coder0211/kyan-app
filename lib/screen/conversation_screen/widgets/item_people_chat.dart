import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:kyan/theme/colors.dart';
import 'package:kyan/theme/dimens.dart';
import 'package:kyan/widgets/custom_circle_avatar.dart';

class ItemPeopleChat extends StatelessWidget {
  final String avatarUrl;
  final String titleChannel;
  final Function() onPressed;
  const ItemPeopleChat(
      {Key? key,
      required this.titleChannel,
      required this.onPressed,
      required this.avatarUrl})
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
            CustomCircleAvatar(
              width: 35,
              imageUrl: avatarUrl,
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(child: titleChannel.b2R(color: AppColors.black))
          ],
        ),
      ),
    );
  }
}
