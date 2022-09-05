import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:kyan/screen/create_workspace/create_workspace_screen.dart';
import '../screen/profile_screen/widgets/mdbts_search_code_join.dart';

void showDialogCustomTwoOption(BuildContext context,
    {required String option1,
    required String option2,
    required Function() func1,
    required Function() func2}) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: 'Select your option'.t1M(),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () {
                BaseNavigation.pop(context);
                func1.call();
              },
              child: option1.t2R(),
            ),
            SimpleDialogOption(
              onPressed: () {
                BaseNavigation.pop(context);
                func2.call();
              },
              child: option2.t2R(),
            ),
          ],
        );
      });
}
