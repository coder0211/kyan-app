import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kyan/theme/colors.dart';
import 'package:kyan/theme/dimens.dart';
import 'package:kyan/theme/text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hintText;
  final bool isModeBorder;
  final double? height;
  final bool isModePassword, enable, autofocus;
  final String? initialValue;
  final Function(TextEditingController)? onChanged;
  final Function(TextEditingController)? onSubmitted;
  final TextEditingController? textEditingController;
  final String obscuringCharacter;
  final TextStyle? hintStyle, style;
  final Color bgColor;
  final Widget? prefixIcon;
  final int maxLines;
  final int? maxLength;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final List<TextInputFormatter> formatterList;
  const CustomTextFormField({
    Key? key,
    this.hintText,
    this.isModeBorder = false,
    this.height,
    this.isModePassword = false,
    this.onChanged,
    this.onSubmitted,
    this.textEditingController,
    this.obscuringCharacter = '•',
    this.hintStyle,
    this.bgColor = Colors.white,
    this.prefixIcon,
    this.maxLines = 1,
    this.keyboardType,
    this.initialValue,
    this.style,
    this.enable = true,
    this.focusNode,
    this.autofocus = false,
    this.formatterList = const [],
    this.maxLength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 51,
      decoration: BoxDecoration(
          color: bgColor,
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: TextFormField(
        cursorColor: AppColors.black,
        keyboardType: keyboardType,
        maxLines: maxLines,
        controller: textEditingController,
        obscuringCharacter: obscuringCharacter,
        obscureText: isModePassword,
        initialValue: initialValue,
        style: style,
        enabled: enable,
        autofocus: autofocus,
        focusNode: focusNode,
        inputFormatters: formatterList,
        maxLength: maxLength,
        onChanged: (_) {
          onChanged?.call(textEditingController!);
        },
        onFieldSubmitted: (_) {
          onSubmitted?.call(textEditingController!);
        },
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          border: InputBorder.none,
          counterText: '',
          contentPadding: const EdgeInsets.all(Dimens.SCREEN_PADDING),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: isModeBorder ? AppColors.primary : Colors.transparent,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: isModeBorder ? AppColors.primary : Colors.transparent,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          hintText: hintText,
          hintStyle: hintStyle ?? AppTextStyle.textNV,
        ),
      ),
    );
  }
}
