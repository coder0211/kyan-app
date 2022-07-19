import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:kyan/generated/l10n.dart';
import 'package:kyan/theme/colors.dart';
import 'package:kyan/theme/dimens.dart';
import 'package:kyan/theme/text_styles.dart';
import 'package:url_launcher/url_launcher.dart';

void showDialogAboutUs(BuildContext context, {required String mail}) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(Dimens.RADIUS_10)), //this right here
          child: Container(
            padding: EdgeInsets.all(Dimens.SCREEN_PADDING),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      text: S.current.productNameKyan + "\n\n",
                      style: AppTextStyle.titleScreen,
                      children: <TextSpan>[
                        TextSpan(
                            text: S.current.creator,
                            style: AppTextStyle.hint
                                .copyWith(color: AppColors.black)),
                        TextSpan(
                            text: S.current.textSpanMission +
                                S.current.textSpanLine1 +
                                S.current.textSpanLine2,
                            style: AppTextStyle.hint
                                .copyWith(color: AppColors.black)),
                      ],
                    ),
                  ),
                  SizedBox(height: Dimens.PADDING_20),
                  GestureDetector(
                      onTap: () {
                        launch(Uri(scheme: 'mailto', path: 'team@tdsof.dev')
                            .toString());
                      },
                      child: BaseText(S.current.contactUsTeamtdosf))
                ]),
          ),
        );
      });
}
