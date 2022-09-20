import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kyan/const/consts.dart';
import 'package:kyan/generated/l10n.dart';
import 'package:kyan/models/account.dart';
import 'package:kyan/screen/team_tasks_screen/store/team_tasks_screen_store.dart';
import 'package:kyan/screen/team_tasks_screen/widgets/item_team_task.dart';
import 'package:kyan/theme/colors.dart';
import 'package:kyan/theme/dimens.dart';
import 'package:kyan/theme/shadows.dart';
import 'package:kyan/theme/text_styles.dart';
import 'package:kyan/widgets/custom_appbar_back.dart';
import 'package:kyan/widgets/custom_circle_avatar.dart';
import 'package:google_fonts/google_fonts.dart';

class TeamTasksScreen extends BaseScreen {
  const TeamTasksScreen({Key? key}) : super(key: key);

  @override
  State<TeamTasksScreen> createState() => _TeamTasksScreenState();
}

class _TeamTasksScreenState
    extends BaseScreenState<TeamTasksScreen, TeamTasksScreenStore> {
  @override
  Widget buildSmallScreen(BuildContext context) {
    return _build(context);
  }

  Widget _build(BuildContext context) {
    return Scaffold(
      appBar: customAppBarBack(context, title: S.current.managerTasks),
      body: _buildBody(),
      backgroundColor: AppColors.white,
    );
  }

  Widget _buildBody() {
    return Column(
      children: [_buildAssignTo(), _buildStatisic(), _buildContentTasks()],
    );
  }

  Padding _buildAssignTo() {
    List<Account> accounts = [];
    accounts.add(Account());
    store.selectedAccount = accounts[0];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimens.SCREEN_PADDING),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: Dimens.SCREEN_PADDING,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BaseText(S.current.assignTo),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: Observer(builder: (_) {
                  return DropdownButton(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    underline: const SizedBox(),
                    value: store.selectedAccount,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: accounts.map((Account items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Row(
                          children: [
                            if (items.accountUrlPhoto != null)
                              CustomCircleAvatar(
                                imageUrl: items.accountUrlPhoto,
                                width: 40,
                              )
                            else
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                  color: AppColors.gray,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(Icons.child_care_outlined),
                              ),
                            const SizedBox(
                              width: 10,
                            ),
                            BaseText(items.accountDisplayName ?? 'All')
                          ],
                        ),
                      );
                    }).toList(),
                    onChanged: (Account? account) async {
                      store.selectedAccount = account ?? accounts[0];
                    },
                  );
                }),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Expanded _buildContentTasks() {
    return Expanded(
      child: Observer(
        builder: (_) => RefreshIndicator(
          onRefresh: () async {
            //await _getData();
          },
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                automaticallyImplyLeading: false,
                actions: [Container()],
                shadowColor: AppColors.transparent,
                backgroundColor: AppColors.white,
                title: Observer(builder: (_) {
                  return Text(S.current.todo + ': 2',
                      style: GoogleFonts.notoSans(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: AppColors.gray)
                          .copyWith(color: AppColors.orange));
                }),
                floating: true,
              ),
              Observer(builder: (_) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return ItemTeamTask(
                        onPressed: () => {},
                        onPressedComplete: () async {},
                        time: 'TimeRange',
                        title: 'summary',
                        isCompleted: false,
                        avatarUrl: 'avatarURL',
                      );
                    },
                    childCount: 2,
                  ),
                );
              }),
              SliverAppBar(
                automaticallyImplyLeading: false,
                actions: [Container()],
                shadowColor: AppColors.transparent,
                backgroundColor: AppColors.white,
                title: Observer(builder: (_) {
                  return Text(S.current.done + ': 2',
                      style: GoogleFonts.notoSans(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: AppColors.gray)
                          .copyWith(color: AppColors.primary));
                }),
                pinned: true,
                toolbarHeight: 30,
              ),
              Observer(builder: (_) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return ItemTeamTask(
                        onPressed: () {},
                        onPressedComplete: () async {},
                        time: 'time',
                        title: 'sumary',
                        isCompleted: true,
                        avatarUrl: 'urlAvatar',
                      );
                    },
                    childCount: 2, //store.tasksDone.length,
                  ),
                );
              }),
              const SliverAppBar(
                shadowColor: AppColors.transparent,
                backgroundColor: AppColors.white,
                title: SizedBox(),
                toolbarHeight: 96,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildStatisic() {
    return Container(
      margin: const EdgeInsets.all(Dimens.SCREEN_PADDING),
      padding: const EdgeInsets.only(
          top: Dimens.SCREEN_PADDING, bottom: Dimens.SCREEN_PADDING),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: Shadows.itemTask,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Observer(builder: (_) {
                return Align(
                    alignment: Alignment.centerLeft,
                    child: BaseText(
                      'Done : 2', //${_teamTaskScreenStore.tasksDone.length}',
                      style: AppTextStyle.defaultStyle,
                    ));
              }),
              Observer(builder: (_) {
                return Align(
                    alignment: Alignment.centerLeft,
                    child: BaseText(
                        'Doing : 2', //${_teamTaskScreenStore.tasksDoing.length}',
                        style: AppTextStyle.defaultStyle
                            .copyWith(color: AppColors.redPink)));
              })
            ],
          ),
          Center(
            child: Observer(builder: (_) {
              double value = 20;
              return BaseCircleChart(
                duration: TIME_ANIMATION,
                key: UniqueKey(),
                maxProgress: value * 100,
                title: BaseText((value * 100).ceil().toString() + "%"),
              );
            }),
          ),
        ],
      ),
    );
  }
}
