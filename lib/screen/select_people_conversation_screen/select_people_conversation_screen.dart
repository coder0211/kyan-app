import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kyan/generated/l10n.dart';
import 'package:kyan/models/account.dart';
import 'package:kyan/screen/select_people_conversation_screen/store/select_people_conversation_screen_store.dart';
import 'package:kyan/theme/colors.dart';
import 'package:kyan/theme/dimens.dart';
import 'package:kyan/theme/shadows.dart';
import 'package:kyan/theme/text_styles.dart';
import 'package:kyan/widgets/custom_appbar_back.dart';
import 'package:kyan/widgets/custom_circle_avatar.dart';

class SelectPeopleConversationScreen extends BaseScreen {
  const SelectPeopleConversationScreen({Key? key}) : super(key: key);

  @override
  State<SelectPeopleConversationScreen> createState() =>
      _SelectPeopleConversationScreenState();
}

class _SelectPeopleConversationScreenState extends BaseScreenState<
    SelectPeopleConversationScreen, SelectPeopleConversationScreenStore> {
  @override
  bool get wantKeepAlive => false;

  @override
  Widget buildSmallScreen(BuildContext context) {
    return _build(context);
  }

  Widget _build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: customAppBarBack(context, title: S.current.people),
      body: Observer(builder: (_) {
        return Observer(builder: (_) {
          return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (_, index) => GestureDetector(
                  key: UniqueKey(), onTap: () async {}, child: Container()),
              itemCount: 2);
        });
      }),
    );
  }

  Container _itemPeople(Account account) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(
          vertical: 5, horizontal: Dimens.SCREEN_PADDING),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: Shadows.defaultShadow),
      child: Row(
        children: [
          CustomCircleAvatar(
            width: 35,
            imageUrl: account.accountUrlPhoto,
          ),
          const SizedBox(width: Dimens.SCREEN_PADDING),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BaseText(account.accountDisplayName,
                    style: AppTextStyle.defaultStyle
                        .copyWith(color: AppColors.black)),
                BaseText(account.accountMail,
                    style: AppTextStyle.defaultStyle
                        .copyWith(color: AppColors.gray)),
              ],
            ),
          ),
          if (account.isSelected)
            const Icon(Icons.check_circle, color: AppColors.primary)
        ],
      ),
    );
  }
}
