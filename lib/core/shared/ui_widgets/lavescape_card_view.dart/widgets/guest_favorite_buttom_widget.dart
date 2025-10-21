import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lavescape/core/utils/colors/app_colors.dart';
import 'package:lavescape/core/utils/styles/font_manager.dart';
import 'package:lavescape/core/utils/styles/text_style_manger.dart';

class GuestFavoriteCardWidget extends StatelessWidget {
  const GuestFavoriteCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24.h,
      width: 88.w,
      child: Stack(
        children: [
          // Bottom layer: Gradient button with border
          Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xFFf8f9fd), // Lighter gradient border color
                 Color(0xFFb8cde0),// Darker gradient border color
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(20.r),
              boxShadow: [
                BoxShadow(
                  color: AppColors.kBlackColor.withValues(alpha: 0.08),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Container(
              margin: const EdgeInsets.all(2), // Creates the border effect
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                     Color(0xFFd2e2ef), // Lighter gradient border color
                  Color(0xFF7da4cb), // Darker blue on the right
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(18.r),
              ),
            ),
          ),
          // Top layer: Centered text
          Center(
            child: Text(
              'Guest Favorite',
              style: getMediumStyle(
                fontSize: FontSize.s10,
                color: AppColors.kBlackColor,
                fontFamily: FontConstants.interFontfamily,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
