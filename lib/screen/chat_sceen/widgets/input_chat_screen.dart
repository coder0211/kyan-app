import 'package:flutter/material.dart';
import 'package:kyan/screen/chat_sceen/store/chat_screen_store.dart';
import 'package:kyan/theme/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kyan/widgets/custom_text_form_field.dart';

class InputChatScreen extends StatelessWidget {
  final ChatScreenStore chatScreenStore;
  final TextEditingController _textEditingController = TextEditingController();
  InputChatScreen({
    Key? key,
    required this.chatScreenStore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: AppColors.gray)),
      ),
      padding: const EdgeInsets.only(left: 5, top: 5, bottom: 5),
      child: Row(
        children: [
          Expanded(
              child: CustomTextFormField(
            hintText: 'Enter message ...',
            hintStyle: GoogleFonts.notoSans(
                fontWeight: FontWeight.w300,
                fontSize: 12,
                color: AppColors.gray),
            textEditingController: _textEditingController,
          )),
          IconButton(
            icon: const Icon(
              Icons.send,
              color: AppColors.primary,
            ),
            onPressed: () async {},
          )
        ],
      ),
    );
  }
}
