import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kyan/const/consts.dart';
import 'package:kyan/generated/l10n.dart';
import 'package:kyan/screen/statistic_screen/store/statistic_screen_store.dart';
import 'package:kyan/screen/tasks_screen/widgets/item_task.dart';
import 'package:kyan/theme/colors.dart';
import 'package:kyan/theme/dimens.dart';
import 'package:kyan/theme/shadows.dart';
import 'package:kyan/theme/text_styles.dart';
import 'package:kyan/widgets/custom_appbar_back.dart';
import 'package:month_picker_dialog_2/month_picker_dialog_2.dart';

class StatisticScreen extends BaseScreen {
  const StatisticScreen({Key? key}) : super(key: key);

  @override
  State<StatisticScreen> createState() => _StatisticScreenState();
}

class _StatisticScreenState
    extends BaseScreenState<StatisticScreen, StatisticScreenStore> {
  @override
  Widget buildSmallScreen(BuildContext context) {
    return _build(context);
  }

  Widget _build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        appBar: customAppBarBack(context, title: S.current.statistic),
        body: Padding(
          padding: const EdgeInsets.only(
              left: Dimens.SCREEN_PADDING, right: Dimens.SCREEN_PADDING),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: BaseUtils.getScreenWidth(context) * 0.1,
              ),
              Container(
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
                        GestureDetector(
                          onTap: () {
                            showMonthPicker(
                              context: context,
                              firstDate: DateTime(DateTime.now().year - 1, 5),
                              lastDate: DateTime(DateTime.now().year + 1, 9),
                              initialDate: DateTime.now(),
                            ).then((date) {});
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            decoration: BoxDecoration(
                                color: AppColors.primary,
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: Shadows.defaultShadow),
                            child: Observer(builder: (_) {
                              return 'Month - Year'.b1R(color: AppColors.white);
                            }),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Observer(builder: (_) {
                          return const Align(
                              alignment: Alignment.centerLeft,
                              child: BaseText('Done: 123'));
                        }),
                        Observer(builder: (_) {
                          return Align(
                              alignment: Alignment.centerLeft,
                              child: BaseText('Pending: 123',
                                  style: AppTextStyle.defaultStyle
                                      .copyWith(color: AppColors.redPink)));
                        })
                      ],
                    ),
                    Center(
                      child: Observer(builder: (_) {
                        double value = (16 / (16 == 0 ? 1 : 20));
                        return BaseCircleChart(
                          duration: TIME_ANIMATION,
                          key: UniqueKey(),
                          maxProgress: value * 100,
                          title: ((value * 100).ceil().toString() + '%').t1M(),
                        );
                      }),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Observer(builder: (_) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildItemTapBar(
                      'Done',
                      () {},
                      isDone: true,
                      isSelected: true,
                    ),
                    _buildItemTapBar(
                      'Pending',
                      () {},
                      isDone: false,
                      isSelected: true, //_statisticScreenStore.isDone,
                    )
                  ],
                );
              }),
              Expanded(
                child: Observer(builder: (_) {
                  return ListView.builder(
                      itemCount: 2,
                      itemBuilder: (BuildContext context, int index) {
                        return ItemTask(
                          title: 'Tong ket',
                          onPressedComplete: () {},
                          onPressed: () {},
                          isCompleted: false,
                          time: '',
                          isModeStatistic: true,
                        );
                      });
                }),
              ),
            ],
          ),
        ));
  }

  Widget _buildItemTapBar(String s, Function() onPressed,
      {required bool isDone, required bool isSelected}) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 100,
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            color: isSelected == isDone
                ? (isDone ? AppColors.green : AppColors.redPink)
                    .withOpacity(0.2)
                : AppColors.gray,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(isDone ? 10 : 0),
                topRight: Radius.circular(!isDone ? 10 : 0),
                bottomLeft: Radius.circular(isDone ? 10 : 0),
                bottomRight: Radius.circular(!isDone ? 10 : 0))),
        child: Center(
          child: Text(
            s,
            style: AppTextStyle.defaultStyle.copyWith(
              color: (isSelected == isDone
                  ? (isDone ? AppColors.green : AppColors.redPink)
                  : AppColors.white),
            ),
          ),
        ),
      ),
    );
  }

  // _getData() {
}
