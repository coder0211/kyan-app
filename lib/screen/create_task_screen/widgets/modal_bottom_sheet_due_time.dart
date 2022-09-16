import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:kyan/generated/l10n.dart';
import 'package:kyan/theme/colors.dart';
import 'package:kyan/theme/dimens.dart';
import 'package:kyan/theme/text_styles.dart';
import 'package:kyan/widgets/custom_date_picker.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> showModalBottomSheetDueTime(BuildContext context,
    {required DateRangePickerController dateRangePickerController,
    required DateRangePickerView dateRangePickerView,
    required List<DateTime> blackoutDates,
    required Function() onPressedDone}) async {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    isDismissible: true,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15), topRight: Radius.circular(15)),
    ),
    builder: (BuildContext builder) {
      return Padding(
        padding: const EdgeInsets.all(Dimens.SCREEN_PADDING),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            BaseText(
              S.current.dueTime,
              style: GoogleFonts.notoSans(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: AppColors.primary),
            ),
            CustomDatePicker(
              blackoutDates: blackoutDates,
              dateRangePickerController: dateRangePickerController,
              dateRangePickerView: dateRangePickerView,
            ),
            const SizedBox(
              height: 10,
            ),
            BaseButton(
              onPressed: onPressedDone,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BaseText(
                    S.current.doneUpper,
                    style: GoogleFonts.notoSans(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: AppColors.white),
                  )
                ],
              ),
              bgColor: AppColors.primary,
            )
          ],
        ),
      );
    },
  );
}
