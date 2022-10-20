import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:kyan/theme/colors.dart';
import 'package:kyan/theme/dimens.dart';
import 'package:kyan/theme/shadows.dart';
import 'package:kyan/widgets/custom_circle_avatar.dart';

class ItemTeamTask extends StatelessWidget {
  final bool isCompleted;
  final String title;
  final String avatarUrl;
  final String time;
  final Function() onPressed;
  final Function() onPressedComplete;
  final isModeStatistic;
  const ItemTeamTask(
      {Key? key,
      required this.avatarUrl,
      this.isCompleted = false,
      required this.title,
      required this.time,
      required this.onPressed,
      required this.onPressedComplete,
      this.isModeStatistic = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(
            top: 10, left: Dimens.SCREEN_PADDING, right: Dimens.SCREEN_PADDING),
        padding: const EdgeInsets.all(10),
        height: 65,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            boxShadow: isCompleted ? null : Shadows.itemTask,
            color: AppColors.white),
        child: InkWell(
          onTap: () {
            onPressed.call();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [title.b1R(), time.b2R(color: AppColors.gray)],
                ),
              ),
              CustomCircleAvatar(
                imageUrl: avatarUrl,
                width: 20,
              ),
              if (!isModeStatistic)
                Checkbox(
                  activeColor: AppColors.primary,
                  value: isCompleted,
                  onChanged: (_value) {
                    onPressedComplete.call();
                  },
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                ),
            ],
          ),
        ));
  }
}
