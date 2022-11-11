import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:kyan/generated/l10n.dart';
import 'package:kyan/manager/manager_path_routes.dart';
import 'package:kyan/screen/mdbts_search_code_join_screen.dart/store/mdbts_search_code_join_store.dart';
import 'package:kyan/theme/colors.dart';
import 'package:kyan/utils/utils.dart';
import 'package:kyan/widgets/custom_text_form_field.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> mdbtsSearchCodeJoinScreen(BuildContext context) async {
  showModalBottomSheet(
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15), topRight: Radius.circular(15)),
      ),
      context: context,
      isScrollControlled: true,
      builder: (context) => const SearchCodeJoinScreen());
}

class SearchCodeJoinScreen extends BaseScreen {
  const SearchCodeJoinScreen({Key? key}) : super(key: key);

  @override
  State<SearchCodeJoinScreen> createState() => _SearchCodeJoinScreenState();
}

class _SearchCodeJoinScreenState
    extends BaseScreenState<SearchCodeJoinScreen, SearchCodeJoinScreenStore> {
  @override
  Widget buildSmallScreen(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          S.of(context).joinWorkspace.b1(color: AppColors.primary),
          const SizedBox(
            height: 10,
          ),
          S.of(context).code.b1R(),
          const SizedBox(height: 10),
          CustomTextFormField(
            hintText: S.of(context).code,
            hintStyle: GoogleFonts.notoSans(
                fontWeight: FontWeight.w300,
                fontSize: 12,
                color: AppColors.gray),
            textEditingController: store.codeController,
          ),
          Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: BaseButton(
              onPressed: () async {
                if (store.codeController.text != '') {
                  await store.searchWorkspace(context);
                  await store.getMemberWorkspace(context);
                  if (store.searchWorkspace(context) == false) {
                    Utils.showToast('This workspace doesn\'t exist!');
                    BaseNavigation.pop(context);
                  } else if (store.workspaceIsExistInMemberWorksapceh() == 0) {
                    Utils.showToast('You have already been this workspace!');
                    BaseNavigation.pop(context);
                  } else if (store.workspaceIsExistInMemberWorksapceh() == 1) {
                    await store.onClickJoinWorkspace(context);
                    BaseNavigation.pop(context);
                  }
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  S.of(context).joinUpper.b1(color: AppColors.white),
                ],
              ),
              bgColor: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}
