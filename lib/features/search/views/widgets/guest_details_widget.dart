import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lavescape/core/constant/app_assets.dart';
import 'package:lavescape/core/shared/core_widgets/svg_asset_handle.dart';
import 'package:lavescape/core/utils/colors/app_colors.dart';
import 'package:lavescape/core/utils/helper/spacing.dart';
import 'package:lavescape/core/utils/styles/font_manager.dart';
import 'package:lavescape/core/utils/styles/text_style_manger.dart';

class GuestDetailsWidget extends StatelessWidget {
  final int adults;
  final int children;
  final VoidCallback onAdultsIncrement;
  final VoidCallback onAdultsDecrement;
  final VoidCallback onChildrenIncrement;
  final VoidCallback onChildrenDecrement;

  const GuestDetailsWidget({
    super.key,
    required this.adults,
    required this.children,
    required this.onAdultsIncrement,
    required this.onAdultsDecrement,
    required this.onChildrenIncrement,
    required this.onChildrenDecrement,
  });

  Widget _buildCounterRow({
    required String title,
    required String subtitle,
    required int count,
    required VoidCallback onIncrement,
    required VoidCallback onDecrement,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: getRegularStyle(
                  fontSize: FontSize.s16,
                  color: AppColors.kBlackTextColor,
                  fontFamily: FontConstants.interFontfamily,
                ),
              ),
              
              Text(
                subtitle,
                style: getRegularStyle(
                  fontSize: FontSize.s12,
                  color: AppColors.kOutlinedGrayColor,
                  fontFamily: FontConstants.interFontfamily,
                ),
              ),
            ],
          ),
          Row(
            children: [
              InkWell(
                onTap: count > 0 ? onDecrement : null,
                child: Container(
                  width: 32.w,
                  height: 32.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: count > 0
                          ? AppColors.kBorderColor
                          : AppColors.kLightGrayColor,
                      width: 1,
                    ),
                  ),
                  child:  SVGAssetHandler(
                            boxFit: BoxFit.scaleDown,
                            svgPath: AssetsData.minusIcon,
                            svgWidth: 20.w,
                            svgheight: 20.h,
                          svgColor:   count > 0
                        ? AppColors.kBlackTextColor
                        : AppColors.kLightGrayColor,
                          ),
                 
                ),
              ),
             
              SizedBox(
                width: 40.w,
                child: Center(
                  child: Text(
                    count.toString(),
                    style: getMediumStyle(
                      fontSize: FontSize.s16,
                      color: AppColors.kBlackTextColor,
                      fontFamily: FontConstants.interFontfamily,
                    ),
                  ),
                ),
              ),
              
              InkWell(
                onTap: onIncrement,
                child: Container(
                  width: 32.w,
                  height: 32.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.kBorderColor,
                      width: 1,
                    ),
                  ),
                  child: SVGAssetHandler(
                            boxFit: BoxFit.scaleDown,
                            svgPath: AssetsData.plusIcon,
                            svgWidth: 20.w,
                            svgheight: 20.h,
                          ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Add Guest',
            style: getMediumStyle(
              fontSize: FontSize.s18,
              color: AppColors.kBlackTextColor,
              fontFamily: FontConstants.interFontfamily,
            ),
          ),
          verticalSpace(8),
          _buildCounterRow(
            title: 'Adults',
            subtitle: 'Ages 13 or above',
            count: adults,
            onIncrement: onAdultsIncrement,
            onDecrement: onAdultsDecrement,
          ),
          verticalSpace(16),
          Divider(
            color: AppColors.kBorderColor,
            height: 1,
          ),
          verticalSpace(8),
          _buildCounterRow(
            title: 'Children',
            subtitle: 'Ages 3 or below',
            count: children,
            onIncrement: onChildrenIncrement,
            onDecrement: onChildrenDecrement,
          ),
        ],
      ),
    );
  }
}
