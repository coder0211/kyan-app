import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kyan/theme/colors.dart';

class AppTextStyle {
  AppTextStyle._();

  static TextStyle textNV =
      GoogleFonts.notoSans(fontWeight: FontWeight.w500, fontSize: 12);
  static TextStyle defaultStyle = GoogleFonts.notoSans(
      fontWeight: FontWeight.w500, color: AppColors.primary, fontSize: 16);
}
