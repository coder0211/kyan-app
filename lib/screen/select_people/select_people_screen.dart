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
        appBar: customAppBar(context, title: S.of(context).people),
        bottomSheet: Padding(
            padding: const EdgeInsets.only(
                left: Dimens.SCREEN_PADDING,
                right: Dimens.SCREEN_PADDING,
                bottom: Dimens.SCREEN_PADDING),
            child: BaseButton(
              onPressed: () async {
                store.onClickAddMemberDone(context,
                    email: store.emailSearchController.text.toString(),
                    isSelected: true);
              },
              bgColor: AppColors.primary,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [S.of(context).doneUpper.b1(color: AppColors.white)],
              ),
            )),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
              child: CustomTextFormField(
                onChanged: (_) {
                  store.getMembersWorkspace(context);
                  store.getPeople(context,
                      email: store.emailSearchController.text.toString());
                },
                hintText: S.of(context).searchHere,
                hintStyle: GoogleFonts.notoSans(
                    fontWeight: FontWeight.w300,
                    fontSize: 12,
                    color: AppColors.gray),
                isModeBorder: true,
                textEditingController: store.emailSearchController,
              ),
            ),
            Observer(builder: (_) {
              return GestureDetector(
                onTap: () {
                  store.onTapSelectedAll.call();
                },
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
              );
            }),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Observer(builder: (_) {
                return Wrap(
                  children: [
                    ...store.selectedPeoples.map((element) => _smallItemPeople(
                        account: element,
                        onPressed: () {
                          store.onTapItem(account: element);
                        }))
                  ],
                );
              }),
            ),
            Expanded(
              child: Observer(builder: (_) {
                return ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          store.onTapItem(account: store.peoples[index]);
                        },
                        child: Observer(
                            builder: (_) =>
                                _itemPeople(store.peoples.elementAt(index)))),
                    itemCount: store.peoples.length);
              }),
            )
          ],
        ));
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
            const Icon(Icons.check_circle, color: AppColors.primary),
          if (store.checkExistedMember(account) == 0)
            const Icon(Icons.check_circle, color: AppColors.gray),
        ],
      ),
    );
  }

  Widget _smallItemPeople(
      {required Account account, required VoidCallback onPressed}) {
    return GestureDetector(
      onTap: () {
        onPressed.call();
      },
      child: Container(
        padding: const EdgeInsets.only(right: 10, top: 10),
        height: 40,
        width: 40,
        child: Stack(
          // alignment: Alignment.bottomRight,
          children: [
            CustomCircleAvatar(
              width: 35,
              imageUrl: account.accountUrlPhoto,
            ),
            Transform.translate(
                offset: const Offset(20, 20),
                child: GestureDetector(
                  onTap: () {
                    onPressed.call();
                  },
                  child: const Icon(Icons.remove_circle,
                      color: AppColors.redPink, size: 20),
                )),
          ],
        ),
      ),
    );
  }
}
