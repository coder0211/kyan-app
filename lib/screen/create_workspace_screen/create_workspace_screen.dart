import 'package:google_fonts/google_fonts.dart';
import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:kyan/generated/l10n.dart';
import 'package:kyan/screen/create_workspace_screen/store/create_workspace_screen_store.dart';
import 'package:kyan/theme/colors.dart';
import 'package:kyan/widgets/custom_text_form_field.dart';

Future<void> mdbtsCreateWorkspaceScreen(BuildContext context) async {
  showModalBottomSheet(
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15), topRight: Radius.circular(15)),
      ),
      context: context,
      isScrollControlled: true,
      builder: (context) => const CreateWorkspaceScreen());
}

class CreateWorkspaceScreen extends BaseScreen {
  const CreateWorkspaceScreen({Key? key}) : super(key: key);

  @override
  State<CreateWorkspaceScreen> createState() => _CreateWorkspaceScreenState();
}

class _CreateWorkspaceScreenState
    extends BaseScreenState<CreateWorkspaceScreen, CreateWorkspaceScreenStore> {
  late TextEditingController _nameController;

  @override
  Widget buildSmallScreen(BuildContext context) {
    return _build(context);
  }

  Widget _build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          BaseText(S.current.createWorkspace,
              style: GoogleFonts.notoSans(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: AppColors.primary)),
          const SizedBox(
            height: 10,
          ),
          const BaseText('Tên'),
          const SizedBox(height: 10),
          CustomTextFormField(
            hintText: S.current.createWorkspace,
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
              onPressed: () async {
                //await _workspacesScreenStore.joinWorkSpace(
                // codeJoin: int.parse(_codeController.text),
                // mailAccount: _loginScreenStore.currentAccount.mail ?? ''
                //);
                //BaseNavigation.pop(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BaseText(S.current.createWorkspace,
                      style: GoogleFonts.notoSans(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: AppColors.white))
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
