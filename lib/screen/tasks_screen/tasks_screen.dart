import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kyan/generated/l10n.dart';
import 'package:kyan/screen/tasks_screen/store/tasks_screen_store.dart';
import 'package:kyan/screen/tasks_screen/widget/item_task.dart';
import 'package:kyan/theme/colors.dart';
import 'package:kyan/theme/dimens.dart';
import 'package:kyan/widgets/custom_circle_avatar.dart';

class TasksScreen extends BaseScreen {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends BaseScreenState<TasksScreen, TasksScreenStore> {
  @override
  Widget buildSmallScreen(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    return Scaffold(
        extendBody: true,
        backgroundColor: AppColors.white,
        body: Column(
          children: [_buildHeader(), _buildContent()],
        ));
  }

  Widget _buildContent() {
    return Expanded(
      child: Observer(
        builder: (_) => (store.isShowLoading)
            ? const BaseIndicator()
            : RefreshIndicator(
                onRefresh: () async {
                  // TODO:
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
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: '${S.current.todo} (${10})'
                                  .b1(color: AppColors.redPink),
                            ),
                            GestureDetector(
                              onTap: () {
                                // TODO:
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: AppColors.lightPrimary,
                                ),
                                child:
                                    S.current.today.b1(color: AppColors.orange),
                              ),
                            ),
                          ],
                        );
                      }),
                      floating: true,
                      toolbarHeight: 30,
                    ),
                    Observer(builder: (_) {
                      return SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                            return ItemTask(
                              onPressed: () {},
                              onPressedComplete: () {},
                              time: '10/05/2022',
                              title: 'Working with a Sliver',
                              isCompleted: false,
                            );
                          },
                          childCount: 5,
                        ),
                      );
                    }),
                    SliverAppBar(
                      automaticallyImplyLeading: false,
                      actions: [Container()],
                      shadowColor: AppColors.transparent,
                      backgroundColor: AppColors.white,
                      title: Observer(builder: (_) {
                        return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: '${S.current.done} (${10})'
                                .b1(color: AppColors.primary));
                      }),
                      pinned: true,
                      toolbarHeight: 30,
                    ),
                    Observer(builder: (_) {
                      return SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                            return ItemTask(
                              onPressed: () {},
                              onPressedComplete: () {},
                              time: '10/05/2022',
                              title: 'Working on the ',
                              isCompleted: true,
                            );
                          },
                          childCount: 10,
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

  Widget _buildHeader() {
    return SafeArea(
      bottom: false,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: Dimens.SCREEN_PADDING,
                left: Dimens.SCREEN_PADDING,
                right: Dimens.SCREEN_PADDING),
            child: Row(
              children: [
                CustomCircleAvatar(
                  imageUrl: store.accountUrlPhoto,
                  width: 40,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      S.current.hi.b2R(color: AppColors.gray),
                      store.accountDisplayName.b1(color: AppColors.primary)
                    ],
                  ),
                ),
                S.current.task.h1R(color: AppColors.primary)
              ],
            ),
          ),
          const SizedBox(height: 10),
          Observer(builder: (_) {
            return CalendarTimeline(
              initialDate: DateTime.now(),
              firstDate: DateTime(2022, 1, 1),
              lastDate: DateTime(2056, 11, 20),
              onDateSelected: (date) {},
              leftMargin: 20,
              monthColor: AppColors.gray,
              dayColor: AppColors.gray,
              activeDayColor: Colors.white,
              activeBackgroundDayColor: AppColors.primary,
              dotsColor: AppColors.black,
              selectableDayPredicate: (date) {
                return true;
              },
              locale: 'en_US',
            );
          })
        ],
      ),
    );
  }
}
