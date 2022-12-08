import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kyan/generated/l10n.dart';
import 'package:kyan/manager/manager_path_routes.dart';
import 'package:kyan/screen/tasks_screen/store/tasks_screen_store.dart';
import 'package:kyan/screen/tasks_screen/widgets/item_task.dart';
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
        child: Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Observer(
          builder: (_) => (store.isShowLoading)
              ? const BaseIndicator()
              : RefreshIndicator(
                  onRefresh: () async {},
                  child: CustomScrollView(
                    physics: const BouncingScrollPhysics(),
                    slivers: [
                      SliverAppBar(
                        automaticallyImplyLeading: false,
                        centerTitle: false,
                        actions: [Container()],
                        shadowColor: AppColors.transparent,
                        backgroundColor: AppColors.white,
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Observer(builder: (_) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child:
                                    '${S.of(context).todo} (${store.tasks.length - store.countTaskDone})'
                                        .b1(color: AppColors.redPink),
                              );
                            }),
                            GestureDetector(
                              onTap: () {
                                store.selectedDate = DateTime.now();
                                store.getListTask();
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: AppColors.lightPrimary,
                                ),
                                child: S
                                    .of(context)
                                    .today
                                    .b1(color: AppColors.orange),
                              ),
                            ),
                          ],
                        ),
                        floating: true,
                        toolbarHeight: 30,
                      ),
                      Observer(builder: (_) {
                        return SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                              return ((store.tasks
                                          .elementAt(index)
                                          .taskIsDone ==
                                      0)
                                  ? ItemTask(
                                      onPressed: () {
                                        BaseNavigation.push(context,
                                            routeName:
                                                ManagerRoutes.createTaskScreen,
                                            arguments: {
                                              'task': store.tasks[index],
                                              'title': 'Edit task'
                                            });
                                      },
                                      onPressedComplete: () async {
                                        await store.onPressedComplete(context,
                                            task: store.tasks[index]);
                                      },
                                      time: store
                                          .convertTimeTask(store.tasks[index]),
                                      title: store.tasks
                                              .elementAt(index)
                                              .taskSummary ??
                                          '',
                                      isCompleted: false,
                                      // false,
                                    )
                                  : const SizedBox.shrink());
                            },
                            childCount: store.tasks.length,
                          ),
                        );
                      }),
                      SliverAppBar(
                        automaticallyImplyLeading: false,
                        centerTitle: false,
                        actions: [Container()],
                        shadowColor: AppColors.transparent,
                        backgroundColor: AppColors.white,
                        title: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Observer(
                                builder: (_) =>
                                    '${S.of(context).done} (${store.countTaskDone})'
                                        .b1(color: AppColors.primary))),
                        pinned: true,
                        toolbarHeight: 30,
                      ),
                      Observer(builder: (_) {
                        return SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                              return ((store.tasks
                                          .elementAt(index)
                                          .taskIsDone ==
                                      1)
                                  ? ItemTask(
                                      onPressed: () {
                                        BaseNavigation.push(context,
                                            routeName:
                                                ManagerRoutes.createTaskScreen,
                                            arguments: {
                                              'task': store.tasks[index],
                                              'title': 'Create task'
                                            });
                                      },
                                      onPressedComplete: () async {
                                        await store.onPressedComplete(context,
                                            task: store.tasks[index]);
                                      },
                                      time: store.convertTimeTask(
                                          store.tasks.elementAt(index)),
                                      title: store.tasks[index].taskSummary
                                          .toString(),
                                      isCompleted: true)
                                  : const SizedBox.shrink());
                            },
                            childCount: store.tasks.length,
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
      ],
    ));
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
                GestureDetector(
                  onTap: () {
                    Scaffold.of(context).openDrawer();
                  },
                  child: CustomCircleAvatar(
                    imageUrl: store.accountUrlPhoto,
                    width: 50,
                    isShowBordered: true,
                    borderColor: AppColors.primary,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      S.of(context).hi.b2R(color: AppColors.gray),
                      store.accountDisplayName.b1(color: AppColors.primary)
                    ],
                  ),
                ),
                S.of(context).task.h1R(color: AppColors.primary)
              ],
            ),
          ),
          const SizedBox(height: 10),
          Observer(builder: (_) {
            return CalendarTimeline(
              initialDate: store.selectedDate,
              firstDate: DateTime(2022, 1, 1),
              lastDate: DateTime(2056, 11, 20),
              onDateSelected: (date) {
                store.selectedDate = date;
                store.getListTask();
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
          })
        ],
      ),
    );
  }
}
