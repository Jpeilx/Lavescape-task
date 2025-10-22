import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lavescape/core/constant/app_assets.dart';
import 'package:lavescape/core/shared/core_widgets/app_text_form_field.dart';
import 'package:lavescape/core/shared/core_widgets/svg_asset_handle.dart';
import 'package:lavescape/core/utils/colors/app_colors.dart';
import 'package:lavescape/core/utils/helper/spacing.dart';

class SearchCustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final TextEditingController? controller;
  const SearchCustomAppBar({super.key , this.controller});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        preferredSize: Size.fromHeight(59.h),
        child: Container(
          decoration: BoxDecoration(color: AppColors.kPrimaryColor),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.only( top: 7.h, bottom: 14.h, left: 8.w, right: 16.w),
              child: Row(
                children: [
                  IconButton(
                        icon: SVGAssetHandler(
                          boxFit: BoxFit.fill,
                          svgPath: AssetsData.arrowLeftIcon,
                          svgWidth:24.w,
                          svgheight: 24.h,
                        ),
                        onPressed: () {
                         GoRouter.of(context).pop();
                        },
                      ),
                      horizontalSpace(3),
                  Expanded(
                    child: AppTextFormField(
                     controller: controller ,
                    
                      keyboardtype: TextInputType.text,
                      label: 'Search',
                      backgroundColor: Colors.white,
                    
                      prefix: SVGAssetHandler(
                        boxFit: BoxFit.scaleDown,
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
                        right: 4.w,
                        top: 0.h,
                        bottom: 0.h,
                      ),
                      suffixPadding: EdgeInsets.all(0),
                    enabledBorder: OutlineInputBorder(
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
                    child: 
                      
                        SVGAssetHandler(
                        boxFit: BoxFit.scaleDown,
                        svgPath: AssetsData.filterIcon,
                        svgWidth: 14.w,
                        svgheight: 14.h,
                      ),
                      
                    
                                        ),
                    ),
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