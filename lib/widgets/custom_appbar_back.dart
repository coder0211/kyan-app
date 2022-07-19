import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:kyan/theme/colors.dart';
import 'package:kyan/theme/text_styles.dart';

AppBar customAppBarBack(BuildContext context, {required String title}) {
  return AppBar(
    title: Text(title, style: AppTextStyle.titleScreen),
    foregroundColor: AppColors.primary,
    backgroundColor: AppColors.white,
    shadowColor: AppColors.transparent,
    leading: GestureDetector(
        onTap: () => BaseNavigation.pop(context),
        child: Icon(Icons.navigate_before)),
    centerTitle: true,
    actions: [
      Builder(builder: (context) => Container()),
    ],
  );
}
