import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:mobile_coding_challenge/app/presentation/theme/colors.dart'
    as colors;
import 'package:mobile_coding_challenge/app/presentation/theme/dimens.dart';

class TypographyStyle {
  static final TextStyle questrialMedium8 = GoogleFonts.questrial(
    fontSize: size8,
    letterSpacing: -0.40,
    fontWeight: FontWeight.w400,
    height: 1.3.h,
  );

  static final TextStyle questrialMedium10 = GoogleFonts.questrial(
    fontSize: size10,
    letterSpacing: -0.40,
    fontWeight: FontWeight.w500,
    height: 1.3.h,
  );

  static final TextStyle questrialRegular12 = GoogleFonts.questrial(
    fontSize: size12,
    letterSpacing: -0.38,
    fontWeight: FontWeight.w400,
    height: 1.33.h,
  );

  static final TextStyle questrialRegular13 = GoogleFonts.questrial(
    fontSize: size13,
    letterSpacing: -0.32,
    fontWeight: FontWeight.w400,
    height: 1.4.h,
  );

  static final TextStyle questrialMedium13 = GoogleFonts.questrial(
    fontSize: size13,
    letterSpacing: -0.32,
    fontWeight: FontWeight.w500,
    height: 1.4.h,
  );

  static final TextStyle questrialRegular14 = GoogleFonts.questrial(
    fontSize: size14,
    letterSpacing: -0.32,
    fontWeight: FontWeight.w400,
    height: 1.3.h,
  );

  static final TextStyle questrialMedium14 = GoogleFonts.questrial(
    fontSize: size14,
    letterSpacing: -0.32,
    fontWeight: FontWeight.w500,
    height: 1.3.h,
  );

  static final TextStyle questrialRegular16 = GoogleFonts.questrial(
    fontSize: size16,
    letterSpacing: -0.32.sp,
    fontWeight: FontWeight.w400,
    height: 1.3.h,
  );

  static final TextStyle questrialRegular18 = GoogleFonts.questrial(
    fontSize: size18,
    letterSpacing: -0.32.sp,
    fontWeight: FontWeight.w400,
    height: 1.3.h,
  );

  static final TextStyle questrialSemiBold14 = GoogleFonts.questrial(
    fontSize: size14,
    letterSpacing: -0.32.sp,
    fontWeight: FontWeight.w600,
    height: 1.3.h,
  );

  static final TextStyle questrialSemiBold16 = GoogleFonts.questrial(
    fontSize: size16,
    letterSpacing: -0.32.sp,
    fontWeight: FontWeight.w600,
    height: 1.3.h,
  );

  static final TextStyle questrialSemiBold18 = GoogleFonts.questrial(
    fontSize: size18,
    letterSpacing: -0.32.sp,
    fontWeight: FontWeight.w600,
    height: 1.3.h,
  );
}

extension BetterString on String {
  String get text => this;

  TextStyle get questrialMedium10 => TypographyStyle.questrialMedium10.copyWith(
    fontFamilyFallback: <String>[text],
  );

  TextStyle get questrialRegular12 => TypographyStyle.questrialRegular12
      .copyWith(fontFamilyFallback: <String>[text]);

  TextStyle get questrialRegular13 => TypographyStyle.questrialRegular13
      .copyWith(fontFamilyFallback: <String>[text]);

  TextStyle get questrialMedium13 => TypographyStyle.questrialMedium13.copyWith(
    fontFamilyFallback: <String>[text],
  );

  TextStyle get questrialRegular14 => TypographyStyle.questrialRegular14
      .copyWith(fontFamilyFallback: <String>[text]);

  TextStyle get questrialMedium14 => TypographyStyle.questrialMedium14.copyWith(
    fontFamilyFallback: <String>[text],
  );

  TextStyle get questrialRegular16 => TypographyStyle.questrialRegular16
      .copyWith(fontFamilyFallback: <String>[text]);

  TextStyle get questrialSemiBold16 => TypographyStyle.questrialSemiBold16
      .copyWith(fontFamilyFallback: <String>[text]);

  TextStyle get questrialSemiBold18 => TypographyStyle.questrialSemiBold18
      .copyWith(fontFamilyFallback: <String>[text]);
}

extension BetterStyle on TextStyle {
  TextStyle get black => copyWith(color: colors.black);

  TextStyle get white => copyWith(color: colors.white);

  TextStyle get gray1 => copyWith(color: colors.gray1);

  TextStyle get grey5 => copyWith(color: colors.gray5);

  TextStyle get gray6 => copyWith(color: colors.gray6);

  TextStyle get yellow => copyWith(color: colors.yellow);
}
