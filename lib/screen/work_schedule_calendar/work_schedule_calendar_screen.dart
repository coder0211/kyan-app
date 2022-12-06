import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kyan/screen/work_schedule_calendar/store/work_schedule_calendar_screen_store.dart';
import 'package:kyan/screen/work_schedule_calendar/widget/item_day.dart';
import 'package:kyan/theme/colors.dart';
import 'package:kyan/theme/dimens.dart';
import 'package:kyan/widgets/custom_appbar_back.dart';

class WorkScheduleScreen extends BaseScreen {
  const WorkScheduleScreen({Key? key}) : super(key: key);

  @override
  State<WorkScheduleScreen> createState() => _WorkScheduleScreenState();
}

class _WorkScheduleScreenState
    extends BaseScreenState<WorkScheduleScreen, WorkScheduleScreenStore> {
  @override
  Widget buildSmallScreen(BuildContext context) {
    return _build(context);
  }

  Widget _build(BuildContext context) {
    return Scaffold(
      appBar: _buildHeader(context),
      body: _buildListDay(),
      backgroundColor: AppColors.white,
    );
  }

  AppBar _buildHeader(BuildContext context) {
    return customAppBar(context, title: 'Your Schedule', isShowBack: true);
  }

  Widget _buildTimeLine(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 10),
          Observer(builder: (_) {
            return CalendarTimeline(
              initialDate: store.selectedDate,
              firstDate: DateTime(2022, 1, 1),
              lastDate: DateTime(2056, 11, 20),
              onDateSelected: (date) {
                store.selectedDate = date;
              },
              leftMargin: 20,
              monthColor: AppColors.gray,
              dayColor: AppColors.gray,
              activeDayColor: Colors.white,
              activeBackgroundDayColor: AppColors.primary,
              dotsColor: AppColors.black,
              selectableDayPredicate: (date) {
                return true;
              },
              locale: store.localeKey,
            );
          }),
        ],
      ),
    );
  }

  Padding _buildListDay() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimens.SCREEN_PADDING),
      child: Column(
        children: [
          _buildTimeLine(context),
          Expanded(
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {},
                      child: ItemDay(
                        description: '',
                        title: store.lst.elementAt(index).toString(),
                      ));
                },
                itemCount: store.lst.length),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return const Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: const Divider(color: AppColors.gray));
  }
}
