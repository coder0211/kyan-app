import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import '../screen/profile_screen/widgets/mdbts_search_code_join.dart';

void showDialogCustomOption(BuildContext context) {
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
              child: const Text('Join'),
              //child: mdbtsSearchCodeJoin(context),
            ),
            SimpleDialogOption(
              onPressed: () {
                BaseNavigation.pop(context);
              },
              child: const Text('Create'),
            ),
          ],
        );
      });
}
