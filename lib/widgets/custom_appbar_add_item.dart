import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:kyan/theme/colors.dart';

AppBar customAppBarAddItem(BuildContext context,
    {required String title, required VoidCallback function}) {
  return AppBar(
      title: title.t2R(color: AppColors.primary),
      foregroundColor: AppColors.primary,
      backgroundColor: AppColors.white,
      shadowColor: AppColors.transparent,
      leading: GestureDetector(
          onTap: () => BaseNavigation.pop(context),
          child: const Icon(Icons.navigate_before)),
      centerTitle: true,
      actions: [
        GestureDetector(
          onTap: () {
            function.call();
          },
          child: const Icon(Icons.add, size: 27),
        )
      ]);
}
