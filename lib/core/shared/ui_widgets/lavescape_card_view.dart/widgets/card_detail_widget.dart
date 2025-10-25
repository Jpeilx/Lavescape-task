
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lavescape/core/constant/app_assets.dart';
import 'package:lavescape/core/shared/models/lavescape_model.dart';
import 'package:lavescape/core/shared/core_widgets/svg_asset_handle.dart';
import 'package:lavescape/core/utils/colors/app_colors.dart';
import 'package:lavescape/core/utils/helper/spacing.dart';
import 'package:lavescape/core/utils/styles/font_manager.dart';
import 'package:lavescape/core/utils/styles/text_style_manger.dart';


class CardDetailsWidget extends StatelessWidget {
  final LavescapeModel? lavescapeData;
  const CardDetailsWidget({super.key, this.lavescapeData});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.kWhiteColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(12.r),
             bottomRight: Radius.circular(12.r),
          ),
          border: Border.all(color: AppColors.kBorderColor),
          
        ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              lavescapeData?.title ?? '------',
              style: getMediumStyle(
                fontSize: FontSize.s16,
                color: AppColors.kBlackColor,
                fontFamily: FontConstants.interFontfamily,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
      
            verticalSpace(4),
      
            // Location
            Row(
              children: [
                SVGAssetHandler(
                  boxFit: BoxFit.fill,
                  svgPath: AssetsData.mapPinIcon,
                  svgWidth: 14.w,
                  svgheight: 14.h,
                ),
                SizedBox(width: 4.w),
                Expanded(
                  child: Text(
                    lavescapeData?.location ?? '------',
                    style: getRegularStyle(
                      fontSize: FontSize.s14,
                      color: AppColors.kDarkGrayColor,
                      fontFamily: FontConstants.interFontfamily,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
      
            verticalSpace(12),
      
            // Price and Rating Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Price
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '\$${lavescapeData?.price.toStringAsFixed(2) ?? 0.00}',
                      style: getBoldStyle(
                        fontSize: FontSize.s18,
                        color: AppColors.kBlackColor,
                        fontFamily: FontConstants.interFontfamily,
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Padding(
                      padding: EdgeInsets.only(bottom: 4.h),
                      child: Text(
                        '/ per person',
                        style: getRegularStyle(
                          fontSize: FontSize.s12,
                          color: AppColors.kBlackColor,
                          fontFamily: FontConstants.interFontfamily,
                        ),
                      ),
                    ),
                  ],
                ),
      
                // Rating
                Row(
                  children: [
                    SVGAssetHandler(
                      boxFit: BoxFit.fill,
                      svgPath: AssetsData.starIcon,
                      svgWidth: 20.w,
                      svgheight: 20.h,
                    ),
                    horizontalSpace(4),
                    Text(
                      lavescapeData?.rating.toStringAsFixed(2) ?? '0.00',
                      style: getRegularStyle(fontSize: FontSize.s14, color: AppColors.kBlackColor, fontFamily: FontConstants.interFontfamily)
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
