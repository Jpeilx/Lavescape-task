import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lavescape/core/utils/colors/app_colors.dart';
import 'package:lavescape/core/utils/styles/font_manager.dart';
import 'package:lavescape/core/utils/styles/text_style_manger.dart';

// ignore: must_be_immutable
class AppTextFormField extends StatelessWidget {
  late TextEditingController? controller;
  final TextInputType? keyboardtype;
  void Function(String)? onsubbmited;
  Function(String)? onchanged;
  String? Function(String?)? validator;
  Widget? prefix;
  String? label;
  void Function()? ontap;
  bool password = false;
  final Widget? suffixIcon;
  final EdgeInsetsGeometry? contentPadding;
  final EdgeInsetsGeometry? perfixPadding;
  final EdgeInsetsGeometry? suffixPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final InputBorder? disabledBorder;
  final InputBorder? errorBorder;
  final Color? backgroundColor;
  final TextStyle? hintStyle;
  final TextStyle? errorStyle;
  final bool? enabled;
  final int? maxLines;
  final int? maxLength;

  AppTextFormField({
    super.key,
    required this.controller,
    required this.keyboardtype,
    this.onsubbmited,
    this.onchanged,
    this.validator,
    this.prefix,
    this.label,
    this.ontap,
    this.password = false,
    this.suffixIcon,
    this.suffixPadding,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.backgroundColor,
    this.hintStyle,
    this.enabled,
    this.disabledBorder,
    this.perfixPadding,
    this.maxLines,
    this.maxLength,
    this.errorStyle,
    this.errorBorder,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      maxLength: maxLength,
      buildCounter: maxLength != null
          ? (_, {required currentLength, maxLength, required isFocused}) =>
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Container(
                    transform: Matrix4.translationValues(
                      0,
                      -kToolbarHeight + 17.w,
                      0,
                    ),
                    child: Text(
                      "$currentLength/$maxLength",
                      style: getRegularStyle(
                        fontSize: FontSize.s12,
                        color: AppColors.kGrey1Color,
                        fontFamily: FontConstants.interFontfamily,
                      ),
                    ),
                  ),
                )
          : null,
      enabled: enabled ?? true,
      controller: controller,
      cursorColor: AppColors.kOutlinedGrayColor,
      cursorErrorColor: AppColors.kOutlinedGrayColor,

      style: getMediumStyle(
        fontSize: FontSize.s15,
        color: AppColors.kOutlinedGrayColor,
        fontFamily: FontConstants.interFontfamily,
      ).copyWith(decorationThickness: 0),
      obscureText: password,
      keyboardType: keyboardtype,
      onFieldSubmitted: onsubbmited,
      onChanged: onchanged,
      onTap: ontap,
      validator: validator,
      decoration: InputDecoration(
        errorStyle:
            errorStyle ??
            getRegularStyle(
              fontSize: FontSize.s12,
              color: AppColors.kRedColor,
              fontFamily: FontConstants.interFontfamily,
            ),
        isDense: true,
        contentPadding:
            contentPadding ??
            EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),

        errorBorder:
            errorBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.kRedColor, width: 1),
              borderRadius: BorderRadius.circular(8.r),
            ),
        focusedBorder:
            focusedBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.kBorderColor, width: 1),
              borderRadius: BorderRadius.circular(8.r),
            ),
        disabledBorder:
            disabledBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColors.klightGreyColor,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(8.0.r),
            ),
        enabledBorder:
            enabledBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.kBorderColor, width: 1),
              borderRadius: BorderRadius.circular(8.r),
            ),
        hintText: label,
        hintStyle:
            hintStyle ??
            getMediumStyle(
              fontSize: FontSize.s15,
              color: AppColors.kOutlinedGrayColor,
              fontFamily: FontConstants.interFontfamily,
            ),
        prefixIcon: Padding(
          padding:
              perfixPadding ??
              EdgeInsets.symmetric(horizontal: 14.w, vertical: 16.h),
          child: prefix,
        ),
        suffixIcon: Padding(
          padding:
              suffixPadding ??
              EdgeInsets.symmetric(horizontal: 14.w, vertical: 16.h),
          child: suffixIcon,
        ),
        border: const OutlineInputBorder(),
        fillColor: backgroundColor ?? AppColors.kWhiteColor,
        filled: true,
        prefixIconConstraints: BoxConstraints(minWidth: 16.w, minHeight: 16.h),
        prefixIconColor: WidgetStateColor.resolveWith(
          (states) => states.contains(WidgetState.focused)
              ? AppColors.kPrimaryColor
              : AppColors.klightGreyColor,
        ),
      ),
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
    );
  }
}
