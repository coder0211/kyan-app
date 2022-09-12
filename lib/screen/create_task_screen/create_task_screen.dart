import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kyan/const/consts.dart';
import 'package:kyan/generated/l10n.dart';
import 'package:kyan/models/account.dart';
import 'package:kyan/screen/create_task_screen/store/create_task_screen_store.dart';
import 'package:kyan/screen/create_task_screen/widgets/modal_bottom_sheet_due_time.dart';
import 'package:kyan/screen/login_screen/store/login_screen_store.dart';
import 'package:kyan/theme/colors.dart';
import 'package:kyan/theme/dimens.dart';
import 'package:kyan/theme/images.dart';
import 'package:kyan/theme/text_styles.dart';
import 'package:kyan/utils/utils.dart';
import 'package:kyan/widgets/custom_circle_avatar.dart';
import 'package:kyan/widgets/custom_dialog_confirm.dart';
import 'package:kyan/widgets/custom_text_form_field.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateTaskScreen extends BaseScreen {
  const CreateTaskScreen({Key? key}) : super(key: key);

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState
    extends BaseScreenState<CreateTaskScreen, CreateTaskScreenStore> {
  @override
  Widget buildSmallScreen(BuildContext context) {
    return _build(context);
  }

  Widget _build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        body: SafeArea(
          bottom: false,
          child: GestureDetector(
              onTap: () {
                BaseUtils.hideKeyboard(context);
              },
              child: Observer(
                builder: (_) => BaseViewLoading(
                  isLoading: false,
                  child: SafeArea(
                    top: false,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: Dimens.SCREEN_PADDING),
                      child: Column(
                        children: [
                          _buildHeader(),
                          Expanded(
                            child: SingleChildScrollView(
                              physics: const BouncingScrollPhysics(),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      BaseText(S.current.summary),
                                      Row(
                                        children: [
                                          BaseText(S.current.done),
                                          Observer(builder: (_) {
                                            return Checkbox(
                                              activeColor: AppColors.primary,
                                              value: true,
                                              onChanged: (_value) {},
                                              shape:
                                                  const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5)),
                                              ),
                                            );
                                          }),
                                        ],
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  CustomTextFormField(
                                    hintText: S.current.hintSummary,
                                    hintStyle: GoogleFonts.notoSans(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 12,
                                        color: AppColors.gray),
                                    // textEditingController:
                                    //     _createTaskScreenStore
                                    //         .summaryEditController,
                                    // onChanged: (value) {
                                    //   _createTaskScreenStore.isActiveButton =
                                    //       value.text.isNotEmpty;
                                    // },
                                  ),
                                  const SizedBox(height: 10),
                                  BaseText(S.current.description),
                                  const SizedBox(height: 0),
                                  CustomTextFormField(
                                    height: 108,
                                    maxLines: MAX_LINE_TEXT_FIELD,
                                    hintText: S.current.descriptionTask,
                                    hintStyle: GoogleFonts.notoSans(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 12,
                                        color: AppColors.gray),
                                    // textEditingController:
                                    //     _createTaskScreenStore
                                    //         .descriptionEditController,
                                  ),
                                  const SizedBox(height: 10),
                                  BaseText(S.current.dueTime),
                                  const SizedBox(height: 10),
                                  GestureDetector(
                                    onTap: () {
                                      showModalBottomSheetDueTime(context,
                                          blackoutDates: store.blackoutDates,
                                          dateRangePickerController:
                                              store.dateRangePickerController,
                                          dateRangePickerView:
                                              store.dateRangePickerView,
                                          onPressedDone: () =>
                                              store.getDueTime(context));
                                    },
                                    child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 5),
                                        height: 52,
                                        decoration: BoxDecoration(
                                          color: AppColors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Observer(
                                            builder: (_) => Row(
                                                  children: [
                                                    BaseText(
                                                      'startDay - dueDay',
                                                      textOverflow:
                                                          TextOverflow.ellipsis,
                                                      style:
                                                          GoogleFonts.notoSans(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300,
                                                              fontSize: 12,
                                                              color: AppColors
                                                                  .gray),
                                                    ),
                                                  ],
                                                ))),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Visibility(
                                    // visible: BaseNavigation.getArgs<String>(
                                    //         context,
                                    //         key: 'title') ==
                                    //     S.current.editTask,
                                    visible: true,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          right: Dimens.SCREEN_PADDING),
                                      child: GestureDetector(
                                        onTap: () {
                                          showDialogConfirm(context,
                                              onConfirm: () async {
                                            BaseNavigation.pop(context);
                                            store.isShowLoading = false;
                                            // _createTaskScreenStore.deleteTask(
                                            //     id: agrs!.id ?? 0);
                                            // await _taskScreenStore.getData(
                                            //     mailAccount: _loginScreenStore
                                            //             .currentAccount.mail ??
                                            //         '');
                                            //store.isShowLoading = false;
                                            //_regetDateTeamTask();
                                            BaseNavigation.pop(context);
                                          },
                                              title:
                                                  S.current.confirmDeleteTask);
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            const Icon(
                                              Icons.close,
                                              color: AppColors.redPink,
                                            ),
                                            BaseText(S.current.deleteTask,
                                                style: GoogleFonts.notoSans(
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        fontSize: 12,
                                                        color: AppColors.gray)
                                                    .copyWith(
                                                        color:
                                                            AppColors.redPink)),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Observer(builder: (_) {
                                    return Row(
                                      children: [
                                        BaseText(S.current.withWorkspace),
                                        Checkbox(
                                          activeColor: AppColors.primary,
                                          value: store.isWithWorkspace,
                                          onChanged: (_value) {
                                            // store.isWithWorkspace =
                                            //     _value ?? false;
                                          },
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5)),
                                          ),
                                        )
                                      ],
                                    );
                                    //: Container();
                                  }),
                                  Observer(builder: (_) {
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        BaseText(S.current.assignTo),
                                        const SizedBox(height: 10),
                                        const Padding(
                                          padding: EdgeInsets.only(left: 10),
                                          // child: Observer(builder: (_) {
                                          //   return DropdownButton(
                                          //     borderRadius:
                                          //         const BorderRadius.all(
                                          //             Radius.circular(10)),
                                          //     underline: const SizedBox(),
                                          //     value: store.selectedAccount,
                                          //     icon: const Icon(
                                          //         Icons.keyboard_arrow_down),
                                          //     items: store.workspace.listMember
                                          //         ?.map((Account items) {
                                          //       return DropdownMenuItem(
                                          //         value: items,
                                          //         child: Row(
                                          //           children: [
                                          //             const CustomCircleAvatar(
                                          //               //imageUrl: 'urlPhoto',
                                          //               width: 40,
                                          //             ),
                                          //             const SizedBox(
                                          //               width: 5,
                                          //             ),
                                          //             const BaseText('')
                                          //           ],
                                          //         ),
                                          //       );
                                          //     }).toList(),
                                          //     onChanged: (Account? account) {
                                          //       // store.selectedAccount =
                                          //       //     account ?? Account();
                                          //     },
                                          //   );
                                          // }),
                                        ),
                                      ],
                                    );
                                  })
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )),
        ),
        bottomSheet: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: Dimens.SCREEN_PADDING,
              vertical: Dimens.SCREEN_PADDING),
          child: Observer(builder: (_) {
            return BaseButton(
              onPressed: () async {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BaseText(
                      // BaseNavigation.getArgs<String>(context, key: 'title') ==
                      //         S.current.createTask
                      //     ? S.current.create
                      //     : S.current.updateUpper,
                      'Edit or Create',
                      style: GoogleFonts.notoSans(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: AppColors.white)),
                ],
              ),
              bgColor:
                  !store.isActiveButton ? AppColors.gray : AppColors.primary,
            );
          }),
        ));
  }

  // void _regetDateTeamTask() {
  //   _teamTaskScreenStore.getData(
  //       assignTo: _teamTaskScreenStore.selectedAccount.mail ?? null,
  //       idWorkspace: _taskScreenStore.workspace.id);
  // }

  Widget _buildHeader() {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Center(
              child: Text('title',
                  //BaseNavigation.getArgs<String>(context, key: 'title'),
                  style: GoogleFonts.notoSans(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: AppColors.primary))),
        ),
        InkWell(
          onTap: () {
            //BaseNavigation.pop(context);
          },
          child: Container(
            padding: const EdgeInsets.only(top: Dimens.SCREEN_PADDING),
            child: Align(
                alignment: Alignment.centerRight,
                child: Image.asset(
                  Images.iconClose,
                  height: 20,
                )),
          ),
        )
      ],
    );
  }
}
