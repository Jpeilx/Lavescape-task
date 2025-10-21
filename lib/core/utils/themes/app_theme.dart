
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lavescape/core/utils/colors/app_colors.dart';
import 'package:lavescape/core/utils/styles/font_manager.dart';
import 'package:lavescape/core/utils/styles/text_style_manger.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.kPrimaryColor),
      primaryColor: AppColors.kPrimaryColor,
      primaryColorLight: AppColors.kOutlinedGrayColor,
      disabledColor: AppColors.kOutlinedGrayColor,
      scaffoldBackgroundColor: AppColors.kScaffoldFillColor,
      canvasColor: AppColors.kWhiteColor,
      highlightColor: Colors.transparent,
      useMaterial3: true,
  


      // elevated button them
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              textStyle: getRegularStyle(
                  color: AppColors.kBlackColor,
                  fontSize: FontSize.s17,
                  fontFamily: FontConstants.interFontfamily),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r)))),
      textTheme: TextTheme(
          displayLarge: getSemiBoldStyle(
              color: AppColors.kDarkGreyColor,
              fontSize: FontSize.s16,
              fontFamily: FontConstants.interFontfamily),
          headlineLarge: getSemiBoldStyle(
              color: AppColors.kDarkGreyColor,
              fontSize: FontSize.s16,
              fontFamily: FontConstants.interFontfamily),
          headlineMedium: getRegularStyle(
              color: AppColors.kDarkGreyColor,
              fontSize: FontSize.s14,
              fontFamily: FontConstants.interFontfamily),
          titleMedium: getMediumStyle(
              color: AppColors.kPrimaryColor,
              fontSize: FontSize.s16,
              fontFamily: FontConstants.interFontfamily),
          titleSmall: getRegularStyle(
              color: AppColors.kWhiteColor,
              fontSize: FontSize.s16,
              fontFamily: FontConstants.interFontfamily),
          bodyLarge: getRegularStyle(
              color: AppColors.kOutlinedGrayColor,
              fontSize: FontSize.s16,
              fontFamily: FontConstants.interFontfamily),
          bodySmall: getRegularStyle(
              color: AppColors.kOutlinedGrayColor,
              fontSize: FontSize.s16,
              fontFamily: FontConstants.interFontfamily),
          bodyMedium: getRegularStyle(
              color: AppColors.kOutlinedGrayColor,
              fontSize: FontSize.s12,
              fontFamily: FontConstants.interFontfamily),
          labelSmall: getBoldStyle(
              color: AppColors.kPrimaryColor,
              fontSize: FontSize.s12,
              fontFamily: FontConstants.interFontfamily)),

      // input decoration theme (text form field)
      inputDecorationTheme: InputDecorationTheme(

          // content padding

          contentPadding: const EdgeInsets.all(8),

          // hint style
          hintStyle: getRegularStyle(
              color: AppColors.klightGreyColor,
              fontSize: FontSize.s14,
              fontFamily: FontConstants.interFontfamily),
          labelStyle: getMediumStyle(
              color: AppColors.klightGreyColor,
              fontSize: FontSize.s14,
              fontFamily: FontConstants.interFontfamily),
          errorStyle: getRegularStyle(
              color: AppColors.kRedColor,
              fontSize: FontSize.s14,
              fontFamily: FontConstants.interFontfamily),

          // enabled border style
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: AppColors.kGreyInputborderColor, width: 2.w),
              borderRadius: BorderRadius.all(Radius.circular(8.r))),

          // focused border style
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: AppColors.kGreyInputborderColor, width: 2.w),
              borderRadius: BorderRadius.all(Radius.circular(8.r))),

          // error border style
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.kRedColor, width: 2.w),
              borderRadius: BorderRadius.all(Radius.circular(5.r))),
          
          // focused border style
          focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: AppColors.kGreyInputborderColor, width: 2.w),
              borderRadius: BorderRadius.all(Radius.circular(5.r))))
          ,
      // label style
      bottomSheetTheme:
          BottomSheetThemeData(backgroundColor: AppColors.kWhiteColor));
}
