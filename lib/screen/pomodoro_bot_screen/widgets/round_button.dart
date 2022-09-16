import 'package:flutter/material.dart';
import 'package:kyan/theme/colors.dart';
import 'package:kyan/theme/dimens.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({
    Key? key,
    required this.icon,
  }) : super(key: key);
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
      ),
      child: CircleAvatar(
        backgroundColor: AppColors.primary,
        radius: 35,
        child: Icon(
          icon,
          size: 35,
          color: AppColors.white,
        ),
      ),
    );
  }
}
