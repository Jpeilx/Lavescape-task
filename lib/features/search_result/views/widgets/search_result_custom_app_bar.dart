import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lavescape/core/constant/app_assets.dart';
import 'package:lavescape/core/shared/core_widgets/svg_asset_handle.dart';
import 'package:lavescape/core/utils/colors/app_colors.dart';
import 'package:lavescape/core/utils/helper/spacing.dart';
import 'package:lavescape/core/utils/styles/font_manager.dart';
import 'package:lavescape/core/utils/styles/text_style_manger.dart';

class SearchResultCustomAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const SearchResultCustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(59.h),
      child: Container(
        decoration: BoxDecoration(color: AppColors.kPrimaryColor),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              top: 7.h,
              bottom: 14.h,
              left: 8.w,
              right: 16.w,
            ),
            child: Row(
              children: [
                IconButton(
                  icon: SVGAssetHandler(
                    boxFit: BoxFit.fill,
                    svgPath: AssetsData.arrowLeftIcon,
                    svgWidth: 24.w,
                    svgheight: 24.h,
                  ),
                  onPressed: () {
                    GoRouter.of(context).pop();
                  },
                ),
                horizontalSpace(3),
                Row(
                  children: [
                    Container(
                      width: 270.w,
                      height: 38.h,
                      decoration: BoxDecoration(
                        color: AppColors.kWhiteColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.r),
                          bottomLeft: Radius.circular(8.r),
                        ),
                      ),
                      child: Center(
                        child: Column(
                          children: [
                            Text(
                              'Camel Riding',
                              style: getSemiBoldStyle(
                                fontSize: FontSize.s12,
                                color: AppColors.kBlackTextColor,
                                fontFamily: FontConstants.interFontfamily,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Madina',
                                  style: getMediumStyle(
                                    fontSize: FontSize.s12,
                                    color: AppColors.kOutlinedGrayColor,
                                    fontFamily: FontConstants.interFontfamily,
                                  ),
                                ),
                                 horizontalSpace(10),
                                CircleAvatar(
                                  backgroundColor: AppColors.kLightGrayColor3,
                                  radius: 3,
                                ),
                                 horizontalSpace(10),
                                Text(
                                  'Madina',
                                  style: getMediumStyle(
                                    fontSize: FontSize.s12,
                                    color: AppColors.kOutlinedGrayColor,
                                    fontFamily: FontConstants.interFontfamily,
                                  ),
                                ),
                                horizontalSpace(10),
                                CircleAvatar(
                                  backgroundColor: AppColors.kLightGrayColor3,
                                  radius: 3,
                                ),
                                horizontalSpace(10),
                                Text(
                                  'Madina',
                                  style: getMediumStyle(
                                    fontSize: FontSize.s12,
                                    color: AppColors.kOutlinedGrayColor,
                                    fontFamily: FontConstants.interFontfamily,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        GoRouter.of(context).pop();
                      },
                      child: Container(
                        width: 38.w,
                        height: 38.h,
                        decoration: BoxDecoration(
                          color: AppColors.kLightGrayColor2,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(8.r),
                            bottomRight: Radius.circular(8.r),
                          ),
                        ),
                        child: Center(
                          child: SVGAssetHandler(
                            boxFit: BoxFit.fill,
                            svgPath: AssetsData.xIcon,
                            svgWidth: 14.w,
                            svgheight: 14.h,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(59.h);
}
