import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kyan/theme/colors.dart';
import 'package:kyan/theme/dimens.dart';

class AppTextStyle {
  AppTextStyle._();

  static TextStyle defaultStyle = GoogleFonts.notoSans(
      fontWeight: FontWeight.w500,
      color: AppColors.primary,
      fontSize: Dimens.TEXT_SIZE_DEFAULT);
  static TextStyle textNV = GoogleFonts.notoSans(
      fontWeight: FontWeight.w500, fontSize: Dimens.TEXT_SIZE_12);
  static TextStyle welcome = GoogleFonts.notoSans(
      fontWeight: FontWeight.bold,
      fontSize: Dimens.TEXT_SIZE_20,
      color: AppColors.primary);
  static TextStyle descriptionWelcome = GoogleFonts.notoSans(
      fontWeight: FontWeight.w300,
      fontSize: Dimens.TEXT_SIZE_DEFAULT,
      color: AppColors.black);
  static TextStyle buttonLogin = GoogleFonts.notoSans(
      fontWeight: FontWeight.bold,
      fontSize: Dimens.TEXT_SIZE_18,
      color: AppColors.white);
  static TextStyle titleItemTask = GoogleFonts.notoSans(
      fontWeight: FontWeight.w500,
      fontSize: Dimens.TEXT_SIZE_DEFAULT,
      color: AppColors.black);
  static TextStyle timeItemTask = GoogleFonts.notoSans(
      fontWeight: FontWeight.w300,
      fontSize: Dimens.TEXT_SIZE_11,
      color: AppColors.gray);
  static TextStyle hi = GoogleFonts.notoSans(
      fontWeight: FontWeight.w300,
      fontSize: Dimens.TEXT_SIZE_14,
      color: AppColors.gray);
  static TextStyle displayName = GoogleFonts.notoSans(
      fontWeight: FontWeight.bold,
      fontSize: Dimens.TEXT_SIZE_DEFAULT,
      color: AppColors.primary);
  static TextStyle titleTask = GoogleFonts.notoSans(
      fontWeight: FontWeight.bold,
      fontSize: Dimens.TEXT_SIZE_DEFAULT,
      color: AppColors.gray);
  static TextStyle hint = GoogleFonts.notoSans(
      fontWeight: FontWeight.w300,
      fontSize: Dimens.TEXT_SIZE_12,
      color: AppColors.gray);
  static TextStyle titleScreen = GoogleFonts.notoSans(
      fontWeight: FontWeight.bold,
      fontSize: Dimens.TEXT_SIZE_22,
      color: AppColors.primary);
  static TextStyle titleItemChannel = GoogleFonts.notoSans(
      fontWeight: FontWeight.w300,
      fontSize: Dimens.TEXT_SIZE_14,
      color: AppColors.black);
  static TextStyle titleConversion = GoogleFonts.notoSans(
      fontWeight: FontWeight.w300,
      fontSize: Dimens.TEXT_SIZE_DEFAULT,
      color: AppColors.gray);
  static TextStyle contentMessage = GoogleFonts.notoSans(
      fontWeight: FontWeight.w500,
      fontSize: Dimens.TEXT_SIZE_DEFAULT,
      color: AppColors.white);
  static TextStyle timeMessage = GoogleFonts.notoSans(
      fontWeight: FontWeight.w300,
      fontSize: Dimens.TEXT_SIZE_12,
      color: AppColors.white);
  static TextStyle titleConfirmDialog = GoogleFonts.notoSans(
      fontWeight: FontWeight.w300,
      fontSize: Dimens.TEXT_SIZE_DEFAULT,
      color: AppColors.black);
  static TextStyle textButtonConfirmDialog = GoogleFonts.notoSans(
      fontWeight: FontWeight.w300,
      fontSize: Dimens.TEXT_SIZE_18,
      color: AppColors.black);

  static TextStyle titleItemBot = GoogleFonts.notoSans(
      fontWeight: FontWeight.w600,
      fontSize: Dimens.TEXT_SIZE_DEFAULT,
      color: AppColors.black);
  static TextStyle subTitleItemBot = GoogleFonts.notoSans(
      fontWeight: FontWeight.w300,
      fontSize: Dimens.TEXT_SIZE_14,
      color: AppColors.gray);
  static TextStyle buttonDisable = GoogleFonts.notoSans(
      fontWeight: FontWeight.bold,
      fontSize: Dimens.TEXT_SIZE_12,
      color: AppColors.white);
  static TextStyle countMembers = GoogleFonts.notoSans(
      fontWeight: FontWeight.w300,
      fontSize: Dimens.TEXT_SIZE_14,
      color: AppColors.black);
  static TextStyle textToast = GoogleFonts.notoSans(
      fontWeight: FontWeight.w300,
      fontSize: Dimens.TEXT_SIZE_14,
      color: AppColors.white);
  static TextStyle joinCode = GoogleFonts.notoSans(
      fontWeight: FontWeight.w300,
      fontSize: Dimens.TEXT_SIZE_14,
      color: AppColors.black);
  static TextStyle joinCodeBold = GoogleFonts.notoSans(
      fontWeight: FontWeight.bold,
      fontSize: Dimens.TEXT_SIZE_14,
      color: AppColors.primary);
}
