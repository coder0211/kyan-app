import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kyan/const/consts.dart';
import 'package:kyan/generated/l10n.dart';
import 'package:kyan/models/account.dart';
import 'package:kyan/screen/select_people/store/select_people_screen_store.dart';
import 'package:kyan/theme/colors.dart';
import 'package:kyan/theme/dimens.dart';
import 'package:kyan/theme/shadows.dart';
import 'package:kyan/theme/text_styles.dart';
import 'package:kyan/widgets/custom_appbar_back.dart';
import 'package:kyan/widgets/custom_circle_avatar.dart';
import 'package:kyan/widgets/custom_text_form_field.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectPeopleScreen extends BaseScreen {
  const SelectPeopleScreen({Key? key}) : super(key: key);

  @override
  State<SelectPeopleScreen> createState() => _SelectPeopleScreenState();
}

class _SelectPeopleScreenState
    extends BaseScreenState<SelectPeopleScreen, SelectPeopleScreenStore> {
  @override
  Widget buildSmallScreen(BuildContext context) {
    return _build(context);
  }

  Widget _build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: customAppBar(context, title: S.current.people),
      bottomSheet: Padding(
        padding: const EdgeInsets.only(
            left: Dimens.SCREEN_PADDING,
            right: Dimens.SCREEN_PADDING,
            bottom: Dimens.SCREEN_PADDING),
        child: BaseButton(
          onPressed: () async {
            store.onClickAddDone(context,
                email: store.emailSearchController.text.toString());
          },
          bgColor: AppColors.primary,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [S.current.doneUpper.b1(color: AppColors.white)],
          ),
        ),
      ),
      body: Observer(builder: (_) {
        return Observer(builder: (_) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
                child: CustomTextFormField(
                  onChanged: (_) {
                    setState(() {});
                  },
                  hintText: S.current.searchHere,
                  hintStyle: GoogleFonts.notoSans(
                      fontWeight: FontWeight.w300,
                      fontSize: 12,
                      color: AppColors.gray),
                  isModeBorder: true,
                  textEditingController: store.emailSearchController,
                ),
              ),
              GestureDetector(
                onTap: store.onTapSelectedAll,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: TIME_ANIMATION),
                  margin: const EdgeInsets.only(
                      left: Dimens.SCREEN_PADDING, top: Dimens.SCREEN_PADDING),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: store.selectedAll
                      ? 'Unselected all'.labelR(color: AppColors.primary)
                      : 'Select all'.labelR(color: AppColors.white),
                  decoration: BoxDecoration(
                      color: store.selectedAll
                          ? AppColors.gray.withOpacity(0.3)
                          : AppColors.primary,
                      borderRadius: BorderRadius.circular(5)),
                ),
              ),
              Expanded(
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          store.onTapItem(index: index);
                          setState(() {});
                        },
                        child: store.people.elementAt(index).accountMail !=
                                    store.currentAccount.accountMail &&
                                ((store.emailSearchController.text
                                        .toString()
                                        .toLowerCase())
                                    .contains(store.people
                                        .elementAt(index)
                                        .accountMail
                                        .toString()
                                        .toLowerCase()))
                            ? _itemPeople(store.people.elementAt(index))
                            : Container()),
                    itemCount: store.people.length),
              ),
            ],
          );
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
