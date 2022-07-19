import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:kyan/generated/l10n.dart';
import 'package:kyan/theme/colors.dart';
import 'package:kyan/theme/dimens.dart';
import 'package:kyan/theme/text_styles.dart';

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
              borderRadius:
                  BorderRadius.circular(Dimens.RADIUS_10)), //this right here
          child: Container(
            padding: EdgeInsets.all(Dimens.PADDING_10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: Dimens.PADDING_10,
                ),
                if (img != null)
                  Image.asset(img)
                else
                  Icon(icon, size: Dimens.HEIGHT_96, color: AppColors.redPink),
                SizedBox(
                  height: Dimens.PADDING_10,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: title,
                    style: AppTextStyle.titleConfirmDialog,
                    children: <TextSpan>[
                      TextSpan(
                          text: hightLight,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: colorTextHightLight)),
                    ],
                  ),
                ),
                SizedBox(height: Dimens.PADDING_20),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () => BaseNavigation.pop(context),
                      child: BaseText(S.current.cancel,
                          style: AppTextStyle.textButtonConfirmDialog,
                          textAlign: TextAlign.center),
                    ),
                    GestureDetector(
                      onTap: () async {
                        await onConfirm.call();
                      },
                      child: BaseText(S.current.confirm,
                          style: AppTextStyle.textButtonConfirmDialog
                              .copyWith(color: AppColors.redPink),
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
