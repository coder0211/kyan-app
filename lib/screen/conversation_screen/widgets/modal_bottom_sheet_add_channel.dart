import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kyan/generated/l10n.dart';
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
      builder: (context) => const _contentMBTS());
}

class _contentMBTS extends StatefulWidget {
  const _contentMBTS({Key? key}) : super(key: key);

  @override
  State<_contentMBTS> createState() => __contentMBTSState();
}

class __contentMBTSState extends State<_contentMBTS> {
  @override
  Widget build(BuildContext context) {
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
                  value: false,
                  onChanged: (_value) {
                    true;
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
                onPressed: () async {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    S.of(context).ADD.b1(),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
