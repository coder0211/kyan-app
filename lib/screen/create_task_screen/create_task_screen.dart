import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kyan/const/consts.dart';
import 'package:kyan/generated/l10n.dart';
import 'package:kyan/models/account.dart';
import 'package:kyan/models/task.dart';
import 'package:kyan/screen/create_task_screen/store/create_task_screen_store.dart';
import 'package:kyan/screen/create_task_screen/widgets/modal_bottom_sheet_due_time.dart';
import 'package:kyan/theme/colors.dart';
import 'package:kyan/theme/dimens.dart';
import 'package:kyan/utils/utils.dart';
import 'package:kyan/widgets/custom_appbar_back.dart';
import 'package:kyan/widgets/custom_circle_avatar.dart';
import 'package:kyan/widgets/custom_dialog_confirm.dart';
import 'package:kyan/widgets/custom_text_form_field.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateTaskScreen extends BaseScreen {
  const CreateTaskScreen({Key? key}) : super(key: key);

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState
    extends BaseScreenState<CreateTaskScreen, CreateTaskScreenStore> {
  late Task? agrs;
  @override
  Widget buildSmallScreen(BuildContext context) {
    return _build(context);
  }

  Widget _build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        body: GestureDetector(
          onTap: () {
            BaseUtils.hideKeyboard(context);
          },
          child: SafeArea(
            top: false,
            child: Column(
              children: [
                _buildHeader(),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: Dimens.SCREEN_PADDING),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              S.of(context).summary.b1R(),
                              Row(
                                children: [
                                  S
                                      .of(context)
                                      .done
                                      .b1(color: AppColors.primary),
                                  Observer(builder: (_) {
                                    return Checkbox(
                                      activeColor: AppColors.primary,
                                      value: store.isDone == 1,
                                      onChanged: (_value) {
                                        store.isDone =
                                            (_value ?? false) ? 1 : 0;
                                      },
                                      shape: const RoundedRectangleBorder(
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
                            hintText: S.of(context).hintSummary,
                            hintStyle: GoogleFonts.notoSans(
                                fontWeight: FontWeight.w300,
                                fontSize: 12,
                                color: AppColors.gray),
                            textEditingController: store.summaryEditController,
                            onChanged: (value) {
                              store.isActiveButton = value.text.isNotEmpty;
                            },
                            borderColor: AppColors.gray.withOpacity(0.3),
                          ),
                          const SizedBox(height: 10),
                          S.of(context).description.b1R(),
                          const SizedBox(height: 10),
                          CustomTextFormField(
                            height: 108,
                            maxLines: MAX_LINE_TEXT_FIELD,
                            hintText: S.of(context).descriptionTask,
                            hintStyle: GoogleFonts.notoSans(
                                fontWeight: FontWeight.w300,
                                fontSize: 12,
                                color: AppColors.gray),
                            textEditingController:
                                store.descriptionEditController,
                            borderColor: AppColors.gray.withOpacity(0.3),
                          ),
                          const SizedBox(height: 10),
                          S.of(context).dueTime.b1R(),
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
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Observer(
                                    builder: (_) => Row(
                                          children: [
                                            '${store.dueTime ?? store.convertYMDTime(store.startDate)}'
                                                .b1R(color: AppColors.primary),
                                          ],
                                        ))),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Visibility(
                            visible: BaseNavigation.getArgs<String>(context,
                                    key: 'title') ==
                                S.of(context).editTask,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  right: Dimens.SCREEN_PADDING),
                              child: GestureDetector(
                                onTap: () {
                                  showDialogConfirm(context,
                                      onConfirm: () async {
                                    BaseNavigation.pop(context);
                                    store.isShowLoading = true;
                                    // store.deleteTask(
                                    //     id: agrs!.taskId ?? 0);
                                    await store.getListTaskInCreateUpdateTask();
                                    store.isShowLoading = false;
                                    BaseNavigation.pop(context);
                                  }, title: S.of(context).confirmDeleteTask);
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    const Icon(
                                      Icons.close,
                                      color: AppColors.redPink,
                                    ),
                                    S
                                        .of(context)
                                        .deleteTask
                                        .b1R(color: AppColors.redPink),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Observer(builder: (_) {
                            return (store.indexYourAccount != -1)
                                ? Row(
                                    children: [
                                      S.of(context).withWorkspace.b1(),
                                      Checkbox(
                                        activeColor: AppColors.primary,
                                        value: store.isWithWorkspace,
                                        onChanged: (_value) {
                                          store.isWithWorkspace =
                                              _value ?? false;
                                        },
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)),
                                        ),
                                      )
                                    ],
                                  )
                                : Container();
                          }),
                          _buildAssignTo(),
                          _buildAchievement()
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomSheet: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: Dimens.SCREEN_PADDING,
              vertical: Dimens.SCREEN_PADDING),
          child: Observer(builder: (_) {
            return BaseButton(
              onPressed: () async {
                if (store.isActiveButton) {
                  store.isShowLoading = true;
                  await store.onPressCreateUpdateTask(context,
                      id: store.task.taskId);

                  store.isShowLoading = false;
                  BaseNavigation.pop(context);
                  await store.getListTaskInCreateUpdateTask();
                  Utils.showToast(
                      ((BaseNavigation.getArgs(context, key: 'task') as Task)
                                  .taskId) ==
                              null
                          ? 'Created susscessfully'
                          : 'Updated susscessfully');
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ((BaseNavigation.getArgs(context, key: 'task') as Task)
                              .taskId) ==
                          null
                      ? S.of(context).create.b1(color: AppColors.white)
                      : S.of(context).updateUpper.b1(color: AppColors.white),
                ],
              ),
              bgColor:
                  !store.isActiveButton ? AppColors.gray : AppColors.primary,
            );
          }),
        ));
  }

  Widget _buildHeader() {
    return customAppBar(context,
        title: BaseNavigation.getArgs<String>(context, key: 'title'));
  }

  Observer _buildAssignTo() {
    return Observer(builder: (_) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          S.of(context).assignTo.b1R(),
          const SizedBox(height: 10),
          PopupMenuButton<Account>(
            padding: EdgeInsets.zero,
            icon: CustomCircleAvatar(
              imageUrl: store.selectedAccount?.accountUrlPhoto,
              width: 40,
            ),
            itemBuilder: (context) => [
              ...store.workspace.members!.map((e) => PopupMenuItem(
                    value: e,
                    child: GestureDetector(
                      onTap: () {
                        store.selectedAccount = e;
                        BaseNavigation.pop(context);
                      },
                      child: Row(
                        children: [
                          CustomCircleAvatar(
                            imageUrl: e.accountUrlPhoto,
                            width: 32,
                            isShowBordered: true,
                          ),
                          const SizedBox(width: 5),
                          Expanded(
                            child: (e.accountDisplayName ?? '').b1R(),
                          )
                        ],
                      ),
                    ),
                  ))
            ],
            offset: const Offset(0, 45),
            color: AppColors.white,
            elevation: 2,
          ),
        ],
      );
    });
  }

  Column _buildAchievement() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        S.of(context).attachment.b1R(),
        const SizedBox(
          height: 10,
        ),
        GestureDetector(
          onTap: () async {
            await BaseImagePicker.getImageFromGallery().then((v) {
              store.file = File(v?.path ?? '');
            });
            await store.uploadFile(store.file);
          },
          child: Column(
            children: [
              Row(
                children: [
                  const Icon(Icons.attach_file_rounded,
                      color: AppColors.orange),
                  S.of(context).add.b1R(color: AppColors.orange),
                ],
              ),
              Observer(builder: (_) {
                return store.task.attachments != null
                    ? Flexible(
                        child: Wrap(
                          children: [
                            ...store.task.attachments!.map((e) {
                              return CachedNetworkImage(
                                  imageUrl: e.attachmentUrl);
                            })
                          ],
                        ),
                      )
                    : const SizedBox.shrink();
              })
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
