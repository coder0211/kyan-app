import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import '../screen/profile_screen/widgets/mdbts_search_code_join.dart';

void showDialogCustomTwoOption(BuildContext context,
    {required String option1, required String option2}) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Select your option'),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () {
                BaseNavigation.pop(context);
                mdbtsSearchCodeJoin(context);
              },
              child: Text(option1),
              //child: mdbtsSearchCodeJoin(context),
            ),
            SimpleDialogOption(
              onPressed: () {
                BaseNavigation.pop(context);
              },
              child: Text(option2),
            ),
          ],
        );
      });
}
