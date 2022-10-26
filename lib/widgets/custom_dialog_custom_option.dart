import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:kyan/theme/colors.dart';

void showDialogCustomTwoOption(BuildContext context,
    {required String option1,
    required String option2,
    required Function() func1,
    required Function() func2}) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: 'Select your option'
              .b1(color: AppColors.black, textAlign: TextAlign.center),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          children: <Widget>[
            const Divider(),
            SimpleDialogOption(
              onPressed: () {
                BaseNavigation.pop(context);
                func1.call();
              },
              child: option1.b1(
                  color: AppColors.primary, textAlign: TextAlign.center),
            ),
            SimpleDialogOption(
              onPressed: () {
                BaseNavigation.pop(context);
                func2.call();
              },
              child: option2.b1(
                  color: AppColors.black, textAlign: TextAlign.center),
            ),
          ],
        );
      });
}
