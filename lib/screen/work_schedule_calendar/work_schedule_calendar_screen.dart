import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:kyan/screen/work_schedule_calendar/store/work_schedule_calendar_screen_store.dart';
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
      body: _buildBody(context),
      backgroundColor: AppColors.white,
    );
  }

  _buildHeader(BuildContext context) {
    return customAppBar(context, title: 'Your Schedule', isShowBack: true);
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: Dimens.SCREEN_PADDING,
        ),
        _dayOfWeek(context),
      ],
    );
  }

  Padding _dayOfWeek(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: Dimens.SCREEN_PADDING),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: 'Today'.b1R(),
                ),
              ],
            ),
            _buildDivider(),
            Row(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: 'Day of week'.b1R(),
                ),
              ],
            ),
            _buildDivider(),
            Row(
              children: [
                GestureDetector(onTap: () {}, child: 'Week of month'.b1R()),
              ],
            ),
            _buildDivider(),
          ],
        ));
  }

  Widget _buildDivider() {
    return const Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: const Divider(color: AppColors.gray));
  }
}
