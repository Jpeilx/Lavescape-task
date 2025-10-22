import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lavescape/core/constant/app_assets.dart';
import 'package:lavescape/core/shared/core_widgets/svg_asset_handle.dart';
import 'package:lavescape/core/utils/colors/app_colors.dart';
import 'package:lavescape/core/utils/helper/spacing.dart';
import 'package:lavescape/core/utils/styles/font_manager.dart';
import 'package:lavescape/core/utils/styles/text_style_manger.dart';

class GuestCounterWidget extends StatelessWidget {
  final int guestCount;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final VoidCallback onExpand;
  final bool isExpanded;

  const GuestCounterWidget({
    super.key,
    required this.guestCount,
    required this.onIncrement,
    required this.onDecrement,
    required this.onExpand,
    required this.isExpanded,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: InkWell(
            onTap: onExpand,
            borderRadius: BorderRadius.circular(8.r),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.kWhiteColor,
                border: Border.all(color: AppColors.kBorderColor, width: 1),
                borderRadius: BorderRadius.circular(8.r),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.kBlackColor.withValues(
                        alpha: 0.08,
                      ), // shadow color
                      spreadRadius: 0.2,
                      blurRadius: 1,
                      offset: const Offset(0, 0.5),
                    ),
                  ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Guest',
                      style: getMediumStyle(
                        fontSize: FontSize.s15,
                        color: AppColors.kBlackTextColor,
                        fontFamily: FontConstants.interFontfamily,
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          width: 24.w,
                          height: 24.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.r),
                            ),
                            border: Border.all(
                              color: AppColors.kBorderColor,

                              width: 1,
                            ),
                          ),
                          child: SVGAssetHandler(
                            boxFit: BoxFit.scaleDown,
                            svgPath: AssetsData.minusIcon,
                            svgWidth: 16.w,
                            svgheight: 16.h,
                          ),
                        ),

                        horizontalSpace(6),
                        Container(
                          width: 24.w,
                          height: 24.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.r),
                            ),
                            border: Border.all(
                              color: AppColors.kBorderColor,

                              width: 1,
                            ),
                          ),
                          child: SVGAssetHandler(
                            boxFit: BoxFit.scaleDown,
                            svgPath: AssetsData.plusIcon,
                            svgWidth: 16.w,
                            svgheight: 16.h,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
