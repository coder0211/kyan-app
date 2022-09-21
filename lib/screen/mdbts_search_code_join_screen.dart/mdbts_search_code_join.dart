import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:kyan/generated/l10n.dart';
import 'package:kyan/screen/mdbts_search_code_join_screen.dart/store/mdbts_search_code_join_store.dart';
import 'package:kyan/theme/colors.dart';
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
          S.current.joinWorkspace.b1(color: AppColors.primary),
          const SizedBox(
            height: 10,
          ),
          S.current.code.b1R(),
          const SizedBox(height: 10),
          CustomTextFormField(
            hintText: S.current.code,
            hintStyle: GoogleFonts.notoSans(
                fontWeight: FontWeight.w300,
                fontSize: 12,
                color: AppColors.gray),
            //textEditingController: _codeController,
          ),
          Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: BaseButton(
              onPressed: () async {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  S.current.joinUpper.b1(color: AppColors.white),
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
