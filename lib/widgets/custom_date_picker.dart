import 'package:flutter/material.dart';
import 'package:kyan/theme/colors.dart';
import 'package:kyan/theme/text_styles.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

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
        selectionTextStyle: const TextStyle(color: Colors.white),
        monthViewSettings: DateRangePickerMonthViewSettings(
            firstDayOfWeek: 1,
            blackoutDates: blackoutDates,
            dayFormat: 'EEE',
            weekNumberStyle: const DateRangePickerWeekNumberStyle(
                textStyle: TextStyle(
              color: AppColors.primary,
            ))),
        onSelectionChanged: (a) {},
        selectionMode: DateRangePickerSelectionMode.range,
        headerStyle: const DateRangePickerHeaderStyle(
          //TODO
          textStyle: const TextStyle(),
        ),
        monthFormat: "EEE dd' ${''}' MM",
        monthCellStyle: const DateRangePickerMonthCellStyle(
            todayTextStyle: TextStyle(color: AppColors.primary),
            blackoutDateTextStyle: TextStyle(
                color: AppColors.primary,
                decoration: TextDecoration.lineThrough)),
        //TODO
        rangeTextStyle: TextStyle(color: AppColors.primary),
        controller: dateRangePickerController,
        onViewChanged: (dateRangePickerViewChangedArgs) {},
      ),
    );
  }
}
