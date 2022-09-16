import 'dart:convert';

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
import 'package:kyan/utils/utils.dart';
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

  _buildAssignTo() {
    List<Account> accounts = [];
    accounts.add(Account());
    //accounts.addAll(_taskScreenStore.workspace.listMember!);
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
                      // await store.getData(
                      //     assignTo:
                      //         _teamTaskScreenStore.selectedAccount.mail ?? null,
                      //     idWorkspace: _taskScreenStore.workspace.id);
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

  _buildContentTasks() {
    return Expanded(
      child: Observer(
        builder: (_) => (false) //store.isShowLoading)
            ? const BaseIndicator()
            : RefreshIndicator(
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
                            //"(${_teamTaskScreenStore.tasksDoing.length})",
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
                              // store.onPressedTask(context,
                              //     task: store.tasksDoing[index]),
                              onPressedComplete: () async {
                                // await store.updateTask(
                                //     assignTo: store.selectedAccount.mail ?? '',
                                //     idWorkspace: _taskScreenStore.workspace.id,
                                //     task: store.tasksDoing[index]);
                              },
                              time: 'TimeRange',
                              // store
                              //     .convertTimeTask(store.tasksDoing[index]),
                              title:
                                  'summary', //store.tasksDoing[index].summary.toString(),
                              isCompleted: false,
                              avatarUrl: 'avatarURL',
                              // _getAvatarUrl(
                              //     store.tasksDoing[index].assignTo ?? ''),
                            );
                          },
                          childCount: 2,
                          //store.tasksDoing.length,
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
                            //"(${_teamTaskScreenStore.tasksDone.length})",
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
                              onPressed: () {
                                // store.onPressedTask(context,
                                //     task: store.tasksDone[index]);
                                // _getData();
                              },
                              onPressedComplete: () async {
                                // await store.updateTask(
                                //     idWorkspace: _taskScreenStore.workspace.id,
                                //     assignTo:
                                //         store.selectedAccount.mail ?? null,
                                //     task: store.tasksDone[index]);
                              },
                              time: 'time',
                              //store.convertTimeTask(store.tasksDone[index]),
                              title:
                                  'sumary', //store.tasksDone[index].summary.toString(),
                              isCompleted: true,
                              avatarUrl: 'urlAvatar',
                              // _getAvatarUrl(
                              //     store.tasksDone[index].assignTo ?? ''),
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

  // String _getAvatarUrl(String mail) {
  //   String url = '';
  //   _taskScreenStore.workspace.listMember!.forEach((e) {
  //     if (e.mail == mail) {
  //       url = e.urlPhoto ?? '';
  //     }
  //   });
  //   return url;
  // }

  // Future<void> _getData() async {
  //   var temp = await BaseUtils.getCurrentWorkSpace();
  //   if (temp != null) {
  //     var value = json.decode(temp);
  //     _taskScreenStore.workspace = Workspace.fromJson(value);
  //   }
  //   await store.getData(
  //       assignTo: store.selectedAccount.mail ?? null,
  //       idWorkspace: store.workspace.id);
  // }

  _buildStatisic() {
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
              // (_teamTaskScreenStore.tasksDone.length /
              //     ((_teamTaskScreenStore.tasksDoing.length +
              //                 _teamTaskScreenStore.tasksDone.length) ==
              //             0
              //         ? 1
              //         : (_teamTaskScreenStore.tasksDoing.length +
              //             _teamTaskScreenStore.tasksDone.length)));
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
