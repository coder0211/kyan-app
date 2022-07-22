import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:kyan/generated/l10n.dart';
import 'package:kyan/theme/colors.dart';
import 'package:kyan/theme/dimens.dart';
import 'package:google_fonts/google_fonts.dart';

void showDialogConfirm(BuildContext context,
    {String? img,
    IconData icon = Icons.remove_circle_outline_rounded,
    required String title,
    required Function onConfirm,
    String hightLight = '',
    Color colorTextHightLight = AppColors.redPink}) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)), //this right here
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 10,
                ),
                if (img != null)
                  Image.asset(img)
                else
                  Icon(icon, size: 96, color: AppColors.redPink),
                const SizedBox(
                  height: 10,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: title,
                    style: GoogleFonts.notoSans(
                        fontWeight: FontWeight.w300,
                        fontSize: 16,
                        color: AppColors.black),
                    // style: AppTextStyle.titleConfirmDialog,
                    children: <TextSpan>[
                      TextSpan(
                          text: hightLight,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: colorTextHightLight)),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                        onTap: () => BaseNavigation.pop(context),
                        child: S.current.cancel.b1(
                            color: Colors.black, textAlign: TextAlign.center)),
                    GestureDetector(
                      onTap: () async {
                        await onConfirm.call();
                      },
                      child: S.current.confirm.b1(
                          color: AppColors.redPink,
                          textAlign: TextAlign.center),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      });
}
