// import 'package:coder0211/coder0211.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_mobx/flutter_mobx.dart';
// import 'package:kyan/const/consts.dart';
// import 'package:kyan/generated/l10n.dart';
// import 'package:kyan/screen/login_screen/store/login_screen_store.dart';
// import 'package:kyan/screen/statistic_screen/store/statistic_screen_store.dart';
// import 'package:kyan/screen/task_screen/widgets/item_task.dart';
// import 'package:kyan/theme/colors.dart';
// import 'package:kyan/theme/dimens.dart';
// import 'package:kyan/theme/shadows.dart';
// import 'package:kyan/theme/text_styles.dart';
// import 'package:kyan/widgets/custom_appbar_back.dart';
// import 'package:provider/provider.dart';
// import 'package:month_picker_dialog/month_picker_dialog.dart';

// class StatisticScreen extends BaseScreen {
//   const StatisticScreen({Key? key}) : super(key: key);

//   @override
//   State<StatisticScreen> createState() => _StatisticScreenState();
// }

// class _StatisticScreenState extends BaseScreenState<StatisticScreen>
//     with SingleTickerProviderStateMixin {
//   late StatisticScreenStore _statisticScreenStore;
//   late LoginScreenStore _loginScreenStore;
//   late Animation<double> _animation;
//   late AnimationController _animationController;

//   @override
//   void initState() {
//     _statisticScreenStore = context.read<StatisticScreenStore>();
//     _loginScreenStore = context.read<LoginScreenStore>();

//     BaseUtils.onWidgetBuildDone(_getData);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     GlobalKey _key = GlobalKey();
//     super.build(context);
//     return Scaffold(
//         backgroundColor: AppColors.white,
//         appBar: customAppBarBack(context, title: S.current.statistic),
//         body: Padding(
//           padding: const EdgeInsets.only(
//               left: Dimens.SCREEN_PADDING, right: Dimens.SCREEN_PADDING),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               SizedBox(
//                 height: BaseUtils.getScreenWidth(context) * 0.1,
//               ),
//               Container(
//                 padding: EdgeInsets.only(
//                     top: Dimens.SCREEN_PADDING, bottom: Dimens.SCREEN_PADDING),
//                 decoration: BoxDecoration(
//                   color: AppColors.white,
//                   borderRadius: BorderRadius.circular(Dimens.RADIUS_10),
//                   boxShadow: Shadows.itemTask,
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         GestureDetector(
//                           onTap: () {
//                             showMonthPicker(
//                               context: context,
//                               firstDate: DateTime(DateTime.now().year - 1, 5),
//                               lastDate: DateTime(DateTime.now().year + 1, 9),
//                               initialDate: DateTime.now(),
//                             ).then((date) {
//                               if (date != null) {
//                                 _statisticScreenStore.month = date.month;
//                                 _statisticScreenStore.year = date.year;
//                                 _getData();
//                                 setState(() {});
//                               }
//                             });
//                           },
//                           child: Container(
//                             padding: EdgeInsets.symmetric(
//                                 vertical: Dimens.PADDING_5,
//                                 horizontal: Dimens.PADDING_10),
//                             decoration: BoxDecoration(
//                                 color: AppColors.primary,
//                                 borderRadius:
//                                     BorderRadius.circular(Dimens.RADIUS_5),
//                                 boxShadow: Shadows.defaultShadow),
//                             child: Observer(builder: (_) {
//                               return BaseText(
//                                 '${_statisticScreenStore.month} - ${_statisticScreenStore.year}',
//                                 style: AppTextStyle.titleItemBot
//                                     .copyWith(color: AppColors.white),
//                               );
//                             }),
//                           ),
//                         ),
//                         SizedBox(height: Dimens.PADDING_10),
//                         Observer(builder: (_) {
//                           return Align(
//                               alignment: Alignment.centerLeft,
//                               child: BaseText(
//                                 'Done : ${_statisticScreenStore.taskDone.length}',
//                                 style: AppTextStyle.defaultStyle,
//                               ));
//                         }),
//                         Observer(builder: (_) {
//                           return Align(
//                               alignment: Alignment.centerLeft,
//                               child: BaseText(
//                                   'Pending : ${_statisticScreenStore.taskPending.length}',
//                                   style: AppTextStyle.defaultStyle
//                                       .copyWith(color: AppColors.redPink)));
//                         })
//                       ],
//                     ),
//                     Center(
//                       child: Observer(builder: (_) {
//                         double value = (_statisticScreenStore.taskDone.length /
//                             (_statisticScreenStore.tasks.length == 0
//                                 ? 1
//                                 : _statisticScreenStore.tasks.length));
//                         return BaseCircleChart(
//                           duration: TIME_ANIMATION,
//                           key: UniqueKey(),
//                           maxProgress: value * 100,
//                           title:
//                               BaseText((value * 100).ceil().toString() + "%"),
//                         );
//                       }),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: Dimens.PADDING_20,
//               ),
//               Observer(builder: (_) {
//                 return Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     _buildItemTapBar(
//                       'Done',
//                       () {
//                         _statisticScreenStore.isDone = true;
//                       },
//                       isDone: true,
//                       isSelected: _statisticScreenStore.isDone,
//                     ),
//                     _buildItemTapBar(
//                       'Pending',
//                       () {
//                         _statisticScreenStore.isDone = false;
//                       },
//                       isDone: false,
//                       isSelected: _statisticScreenStore.isDone,
//                     )
//                   ],
//                 );
//               }),
//               Expanded(
//                 child: Observer(builder: (_) {
//                   return ListView.builder(
//                       itemCount: _statisticScreenStore.isDone
//                           ? _statisticScreenStore.taskDone.length
//                           : _statisticScreenStore.taskPending.length,
//                       itemBuilder: (BuildContext context, int index) {
//                         return ItemTask(
//                           title: _statisticScreenStore.isDone
//                               ? _statisticScreenStore.taskDone[index].summary ??
//                                   ''
//                               : _statisticScreenStore
//                                       .taskPending[index].summary ??
//                                   '',
//                           onPressedComplete: () {},
//                           onPressed: () {},
//                           isCompleted: false,
//                           time: _statisticScreenStore.convertTimeTask(
//                               _statisticScreenStore.isDone
//                                   ? _statisticScreenStore.taskDone[index]
//                                   : _statisticScreenStore.taskPending[index]),
//                           isModeStatistic: true,
//                         );
//                       });
//                 }),
//               ),
//             ],
//           ),
//         ));
//   }

//   Widget _buildItemTapBar(String s, Function() onPressed,
//       {required bool isDone, required bool isSelected}) {
//     return GestureDetector(
//       onTap: onPressed,
//       child: Container(
//         width: 100,
//         padding: EdgeInsets.symmetric(vertical: 10),
//         decoration: BoxDecoration(
//             color: isSelected == isDone
//                 ? (isDone ? AppColors.green : AppColors.redPink)
//                     .withOpacity(0.2)
//                 : AppColors.gray,
//             borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(isDone ? 10 : 0),
//                 topRight: Radius.circular(!isDone ? 10 : 0),
//                 bottomLeft: Radius.circular(isDone ? 10 : 0),
//                 bottomRight: Radius.circular(!isDone ? 10 : 0))),
//         child: Center(
//           child: Text(
//             s,
//             style: AppTextStyle.defaultStyle.copyWith(
//               color: (isSelected == isDone
//                   ? (isDone ? AppColors.green : AppColors.redPink)
//                   : AppColors.white),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   _getData() {
//     _statisticScreenStore.getData(
//         mailAccount: _loginScreenStore.currentAccount.mail ?? '');
//   }
// }
