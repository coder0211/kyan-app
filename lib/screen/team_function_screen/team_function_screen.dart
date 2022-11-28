import 'dart:convert';

import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kyan/manager/manager_path_routes.dart';
import 'package:kyan/screen/team_function_screen/store/team_function_screen_store.dart';
import 'package:kyan/screen/team_tasks_screen/store/team_tasks_screen_store.dart';
import 'package:kyan/theme/colors.dart';
import 'package:kyan/theme/dimens.dart';
import 'package:kyan/widgets/custom_appbar_back.dart';

class TeamFunctionScreen extends BaseScreen {
  const TeamFunctionScreen({Key? key}) : super(key: key);

  set workspaceId(int workspaceId) {}

  @override
  State<TeamFunctionScreen> createState() => _TeamFunctionScreenState();
}

class _TeamFunctionScreenState
    extends BaseScreenState<TeamFunctionScreen, TeamFunctionScreenStore> {
  @override
  Widget buildSmallScreen(BuildContext context) {
    return _build(context);
  }

  Widget _build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: 'Team Function', isShowBack: false),
      body: _buildBody(),
      backgroundColor: AppColors.white,
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        const SizedBox(
          height: Dimens.SCREEN_PADDING,
        ),
        _jobSchedule(),
        _buildDivider(),
        _teamTask(),
      ],
    );
  }

  Widget _buildDivider() {
    return const Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: const Divider(color: AppColors.gray));
  }

  Padding _jobSchedule() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: Dimens.SCREEN_PADDING),
        child: Row(
          children: [
            Row(
              children: [
                const Icon(Icons.calendar_month_sharp, size: 27),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    BaseNavigation.push(context,
                        routeName: ManagerRoutes.workScheduleScreen);
                  },
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child:
                        'Check your work schedule'.b1R(color: AppColors.black),
                  ),
                )
              ],
            ),
          ],
        ));
  }

  Padding _teamTask() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: Dimens.SCREEN_PADDING),
        child: Row(
          children: [
            const Icon(Icons.task_alt, size: 27),
            const SizedBox(width: 10),
            GestureDetector(
              onTap: () {
                BaseNavigation.push(context,
                    routeName: ManagerRoutes.teamTasksScreen);
              },
              child: Align(
                alignment: Alignment.centerLeft,
                child: 'Team tasks'.b1R(color: AppColors.black),
              ),
            )
          ],
        ));
  }
}
