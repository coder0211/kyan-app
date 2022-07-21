import 'package:flutter/material.dart';
import 'package:kyan/theme/colors.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDatePicker extends StatelessWidget {
  final DateRangePickerView dateRangePickerView;
  final DateRangePickerController dateRangePickerController;
  final List<DateTime> blackoutDates;
  const CustomDatePicker(
      {Key? key,
      required this.dateRangePickerView,
      required this.dateRangePickerController,
      required this.blackoutDates})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: SfDateRangePicker(
        todayHighlightColor: AppColors.primary,
        selectionColor: AppColors.primary,
        startRangeSelectionColor: AppColors.primary,
        endRangeSelectionColor: AppColors.primary,
        rangeSelectionColor: AppColors.primary.withOpacity(0.2),
        view: dateRangePickerView,
        selectionTextStyle: GoogleFonts.notoSans(color: Colors.white),
        monthViewSettings: DateRangePickerMonthViewSettings(
            firstDayOfWeek: 1,
            blackoutDates: blackoutDates,
            dayFormat: 'EEE',
            weekNumberStyle: DateRangePickerWeekNumberStyle(
                textStyle: GoogleFonts.notoSans(
              color: AppColors.primary,
            ))),
        onSelectionChanged: (a) {},
        selectionMode: DateRangePickerSelectionMode.range,
        headerStyle: DateRangePickerHeaderStyle(
          textStyle: GoogleFonts.notoSans(
              fontWeight: FontWeight.w300,
              fontSize: 16,
              color: AppColors.black),
        ),
        monthFormat: "EEE dd' ${''}' MM",
        monthCellStyle: DateRangePickerMonthCellStyle(
            todayTextStyle: GoogleFonts.notoSans(color: AppColors.primary),
            blackoutDateTextStyle: GoogleFonts.notoSans(
                color: AppColors.primary,
                decoration: TextDecoration.lineThrough)),
        rangeTextStyle: GoogleFonts.notoSans(color: AppColors.primary),
        controller: dateRangePickerController,
        onViewChanged: (dateRangePickerViewChangedArgs) {},
      ),
    );
  }
}
