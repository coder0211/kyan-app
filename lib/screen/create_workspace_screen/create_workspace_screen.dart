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
  late TextEditingController _codeController = TextEditingController();

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
          S.current.createWorkspace.b1(color: AppColors.primary),
          const SizedBox(
            height: 10,
          ),
          S.current.name.b2R(),
          const SizedBox(height: 10),
          CustomTextFormField(
            hintText: S.current.createWorkspace,
            hintStyle: GoogleFonts.notoSans(
                fontWeight: FontWeight.w300,
                fontSize: 12,
                color: AppColors.gray),
            textEditingController: _codeController,
            onChanged: (value) {
              setState(() {});
            },
          ),
          Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: BaseButton(
              onPressed: () async {
                await store.onPressCreateWorkspace(context,
                    workspaceName: _codeController.toString());
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  S.current.createWorkspace.b1(color: AppColors.white),
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
