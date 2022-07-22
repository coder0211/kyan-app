import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:kyan/theme/colors.dart';
import 'package:kyan/theme/dimens.dart';
import 'package:kyan/theme/shadows.dart';

class ItemTask extends StatelessWidget {
  final bool isCompleted;
  final String title;
  final String time;
  final Function() onPressed;
  final Function() onPressedComplete;
  final isModeStatistic;
  const ItemTask(
      {Key? key,
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
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            boxShadow: isCompleted ? null : Shadows.shadow1,
            border: isCompleted
                ? Border.all(color: AppColors.lightPrimary, width: 1)
                : null,
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
                  children: [
                    title.b1R(),
                    const SizedBox(height: 2),
                    time.b2R(color: AppColors.gray),
                  ],
                ),
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
