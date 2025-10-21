import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lavescape/core/constant/app_assets.dart';
import 'package:lavescape/core/shared/core_widgets/app_text_form_field.dart';
import 'package:lavescape/core/shared/core_widgets/svg_asset_handle.dart';
import 'package:lavescape/core/utils/colors/app_colors.dart';
import 'package:lavescape/core/utils/router/app_router.dart';
import 'package:lavescape/core/utils/styles/font_manager.dart';
import 'package:lavescape/core/utils/styles/text_style_manger.dart';

class ExploreCustomAppBar extends StatelessWidget implements PreferredSizeWidget  {
  const  ExploreCustomAppBar({super.key})  ;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        preferredSize: Size.fromHeight(59.h),
        child: Container(
          decoration: BoxDecoration(color: AppColors.kPrimaryColor),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.only( top: 7.h, bottom: 14.h, left: 16.w, right: 16.w),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        print('Navigating to Search Screen');
                        GoRouter.of(context).push(AppRouter.kSearchView);
                      },
                      child: AppTextFormField(
                       controller: null ,
                       enabled: false,
                        keyboardtype: TextInputType.text,
                        label: 'Search',
                        backgroundColor: Colors.white,

                        prefix: SVGAssetHandler(
                          boxFit: BoxFit.fill,
                          svgPath: AssetsData.searchIcon,
                          svgWidth: 14.w,
                          svgheight: 14.h,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 0.w,
                          vertical: 0.h,
                        ),

                        perfixPadding: EdgeInsets.only(
                          left: 12.w,
                          right: 8.w,
                          top: 0.h,
                          bottom: 0.h,
                        ),
                        suffixPadding: EdgeInsets.all(0),
                        disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        onchanged: (value) {
                          // Handle search
                          debugPrint('Search: $value');
                        },
                        suffixIcon: Container(
                      decoration: BoxDecoration(
                        color: AppColors.kLightGrayColor,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(8.r),
                          bottomRight: Radius.circular(8.r),
                        ),
                      ),
                      child: IconButton(
                        icon:  SVGAssetHandler(
                          boxFit: BoxFit.fill,
                          svgPath: AssetsData.filterIcon,
                          svgWidth: 14.w,
                          svgheight: 14.h,
                        ),
                        onPressed: () {
                          // Handle filter button press
                          debugPrint('Filter pressed');
                        },
                      ),
                    ),
                      ),
                    ),
                  ),
                
                  // Notification badge
                  Stack(
                    children: [
                      IconButton(
                        icon: SVGAssetHandler(
                          boxFit: BoxFit.fill,
                          svgPath: AssetsData.bellIcon,
                          svgWidth: 18.w,
                          svgheight: 18.h,
                        ),
                        onPressed: () {
                          // Handle notification press
                          debugPrint('Notification pressed');
                        },
                      ),
                      Positioned(
                        right: 8.w,
                        top: 0,
                        child: Container(
                          padding: EdgeInsets.all(4.w),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            '3',
                            style: getBoldStyle(
                              fontSize: FontSize.s11,
                              color: AppColors.kPrimaryColor,
                              fontFamily: FontConstants.interFontfamily,
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