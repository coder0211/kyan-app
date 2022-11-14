import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kyan/generated/l10n.dart';
import 'package:kyan/manager/manager_path_routes.dart';
import 'package:kyan/models/channel.dart';
import 'package:kyan/screen/conversation_screen/store/conversation_screen_store.dart';
import 'package:kyan/theme/colors.dart';
import 'package:kyan/theme/dimens.dart';
import 'package:kyan/widgets/custom_text_form_field.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> showModalBottomSheetAddChannel(BuildContext context) async {
  showModalBottomSheet(
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15), topRight: Radius.circular(5)),
      ),
      context: context,
      isScrollControlled: true,
      builder: (context) => const contentMBTS());
}

class contentMBTS extends BaseScreen {
  const contentMBTS({Key? key}) : super(key: key);

  @override
  State<contentMBTS> createState() => __contentMBTSState();
}

class __contentMBTSState
    extends BaseScreenState<contentMBTS, ConversationScreenStore> {
  @override
  Widget buildSmallScreen(BuildContext context) {
    return _build(context);
  }

  Widget _build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimens.SCREEN_PADDING),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          S.of(context).addChannel.b1(color: AppColors.primary),
          const SizedBox(
            height: 10,
          ),
          BaseText(S.of(context).channelName),
          const SizedBox(height: 10),
          CustomTextFormField(
            hintText: S.of(context).channelName,
            hintStyle: GoogleFonts.notoSans(
                fontWeight: FontWeight.w300,
                fontSize: 12,
                color: AppColors.gray),
            textEditingController: store.createChanelNameController,
            onChanged: (_) {
              setState(() {});
            },
          ),
          Row(
            children: [
              BaseText(S.of(context).isPrivate),
              const SizedBox(
                width: 10,
              ),
              Observer(builder: (_) {
                return Checkbox(
                  activeColor: AppColors.primary,
                  value: store.isPrivateCreate,
                  onChanged: (_value) {
                    store.isPrivateCreate = _value ?? false;
                    setState(() {});
                  },
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                );
              }),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Observer(builder: (_) {
              return BaseButton(
                onPressed: () async {
                  store.createChannel?.channelIsPrivate =
                      store.isPrivateCreate == true ? 1 : 0;
                  store.createChannel?.channelName =
                      store.createChanelNameController.text;
                  store.createChannel?.accountMailOwner =
                      store.loginScreenStore.currentAccount.accountMail;
                  store.createChannel?.channelWorkspaceId =
                      store.currentWorkspaceId;
                  print('currentWorkspaceId:' +
                      store.currentWorkspaceId.toString());
                  print(store.createChannel?.accountMailOwner);
                  print('workspace');
                  print(store.createChannel?.channelWorkspaceId);
                  if (store.createChanelNameController.text != '' &&
                      store.isPrivateCreate) {
                    await store.onClickAddChannelChat(context,
                        channel: store.createChannel ?? Channel());
                    //BaseNavigation.pop(context);
                    BaseNavigation.push(context,
                        routeName: ManagerRoutes.selectPeopleChannelScreen,
                        arguments: {'idWorkSpace': store.currentWorkspaceId});
                  } else if (store.createChanelNameController.text != '' &&
                      store.isPrivateCreate == false) {
                    store.onClickAddChannelChat(context,
                        channel: store.createChannel ?? Channel());

                    BaseNavigation.pop(context);
                  } else {
                    // store.onClickAddChannelChat(context,
                    //     channel: store.createChannel ?? Channel());
                    // BaseNavigation.pop(context);
                    BaseUtils.showToast('Failed', bgColor: AppColors.primary);
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    S.of(context).ADD.b1(),
                  ],
                ),
                bgColor: store.createChanelNameController.text == ''
                    ? AppColors.gray
                    : AppColors.primary,
              );
            }),
          ),
        ],
      ),
    );
  }
}
