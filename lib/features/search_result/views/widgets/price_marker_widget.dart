import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lavescape/core/utils/colors/app_colors.dart';
import 'package:lavescape/core/utils/styles/font_manager.dart';
import 'package:lavescape/core/utils/styles/text_style_manger.dart' show getMediumStyle;

class PriceMarkerWidget extends StatelessWidget {
  final double price;
  final bool isSelected;

  const PriceMarkerWidget({
    super.key,
    required this.price,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color:  AppColors.kWhiteColor,
        borderRadius: BorderRadius.circular(6.r),
        border: Border.all(
          color:  AppColors.kBorderColor,
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Text(
        '\$${price.toStringAsFixed(0)}',
        style: getMediumStyle(
          fontSize: FontSize.s12,
          color: AppColors.kBlackTextColor,
          fontFamily: FontConstants.interFontfamily,
        ),
      ),
    );
  }
}
