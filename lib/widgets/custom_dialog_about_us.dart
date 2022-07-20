import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:kyan/generated/l10n.dart';
import 'package:kyan/theme/colors.dart';
import 'package:kyan/theme/dimens.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';

void showDialogAboutUs(BuildContext context, {required String mail}) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)), //this right here
          child: Container(
            padding: const EdgeInsets.all(Dimens.SCREEN_PADDING),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  RichText(
                    //TODO
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      text: S.current.productNameKyan + '\n\n',
                      children: <TextSpan>[
                        TextSpan(
                            text: S.current.creator,
                            style: GoogleFonts.notoSans(
                                fontWeight: FontWeight.w300,
                                fontSize: 12,
                                color: AppColors.black)),
                        TextSpan(
                            text: S.current.textSpanMission +
                                S.current.textSpanLine1 +
                                S.current.textSpanLine2,
                            style: GoogleFonts.notoSans(
                                fontWeight: FontWeight.w300,
                                fontSize: 12,
                                color: AppColors.black))
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                      onTap: () {
                        launch(Uri(scheme: 'mailto', path: 'team@tdsof.dev')
                            .toString());
                      },
                      child: S.current.contactUsTeamtdosf
                          .d1(color: AppColors.black))
                ]),
          ),
        );
      });
}
