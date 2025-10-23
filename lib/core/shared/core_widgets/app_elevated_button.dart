
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lavescape/core/shared/core_widgets/svg_asset_handle.dart';
import 'package:lavescape/core/utils/colors/app_colors.dart';
import 'package:lavescape/core/utils/helper/spacing.dart';
import 'package:lavescape/core/utils/styles/font_manager.dart';
import 'package:lavescape/core/utils/styles/text_style_manger.dart';

// ignore: must_be_immutable
class AppElevatedButton extends StatelessWidget {
  String title;
  VoidCallback? onPressed;
  double fontSize;
  Color? titleColor;
  Color borderColor;
  Color? background;
  double borderWidth;
  double height;
  double width;
  double borderRaduis;
  bool enabledBorder;
  double? elevation;
  String? iconPath;
  bool iconStart;
  double marginStart;


  AppElevatedButton({
    Key? key,
    required this.title,
    this.onPressed,
    this.fontSize = 24,
    this.titleColor = AppColors.kWhiteColor,

    this.borderColor = AppColors.kTansparentColor,
    this.background,
    this.borderWidth = 1,
    this.height = 48,
    this.borderRaduis = 8,
    this.width = 176,
    this.enabledBorder = true,
    this.elevation,
    this.iconPath,
    this.iconStart = true,
    this.marginStart = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        padding:WidgetStateProperty.all(EdgeInsets.all(0),) ,
        minimumSize: WidgetStateProperty.all(Size(width.w, height.h)),
        shadowColor: WidgetStateProperty.resolveWith<Color?>(
            (states) => AppColors.kTansparentColor),
        backgroundColor: WidgetStateProperty.resolveWith<Color?>(
            (states) => background ?? AppColors.kPrimaryColor),
        elevation:
            WidgetStateProperty.resolveWith<double?>((states) => elevation),
        shape: WidgetStateProperty.resolveWith(
          (states) {
            if (states.contains(WidgetState.pressed)) {
              return RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRaduis.r),
                side: BorderSide(
                  color: AppColors.kPrimaryColor,
                  width: borderWidth,
                ),
              );
            }
            if (states.contains(WidgetState.hovered)) {
              return RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRaduis.r),
                side: BorderSide(
                  color: AppColors.kPrimaryColor,
                  width: borderWidth,
                ),
              );
            }
            return RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRaduis.r),
              side: BorderSide(
                color: borderColor,
                width: borderWidth,
              ),
            );
          },
        ),
      ),
      child: marginStart == 0
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (iconStart)
                  if (iconPath != null) ...[
                    SVGAssetHandler(
                      svgPath: iconPath!,
                      svgWidth: 24.w,
                      svgheight: 24.h,
                      boxFit: BoxFit.cover,
                    ),
                    SizedBox(width: 10.w),
                  ],
                Text(
                  title,
                  style: getSemiBoldStyle(
                      fontSize: fontSize,
                      color: titleColor ?? AppColors.kWhiteColor,
                      fontFamily: FontConstants.interFontfamily),
                ),
                if (!iconStart)
                  if (iconPath != null) ...[
                    SizedBox(width: 10.w),
                    SVGAssetHandler(
                      svgPath: iconPath!,
                      svgWidth: 24.w,
                      svgheight: 24.h,
                      boxFit: BoxFit.cover,
                    ),
                  ],
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: marginStart.w),
                if (iconStart)
                  if (iconPath != null) ...[
                    SVGAssetHandler(
                      svgPath: iconPath!,
                      svgWidth: 14.w,
                      svgheight: 14.h,
                      boxFit: BoxFit.cover,
                    ),
                horizontalSpace(3)
                  ],
                Text(
                  title,
                  style: getSemiBoldStyle(
                      fontSize: fontSize,
                      color: titleColor ?? AppColors.kWhiteColor,
                      fontFamily: FontConstants.interFontfamily),
                ),
                if (!iconStart)
                  if (iconPath != null) ...[
                    SizedBox(width: 10.w),
                    SVGAssetHandler(
                      svgPath: iconPath!,
                      svgWidth: 24.w,
                      svgheight: 24.h,
                      boxFit: BoxFit.cover,
                    ),
                  ],
              ],
            ),
    );
  }
}
