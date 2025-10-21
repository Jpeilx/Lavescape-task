
// Reusable Categories TabBar Widget
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lavescape/core/constant/app_assets.dart';
import 'package:lavescape/core/shared/core_widgets/svg_asset_handle.dart';
import 'package:lavescape/core/utils/colors/app_colors.dart';
import 'package:lavescape/core/utils/styles/font_manager.dart';
import 'package:lavescape/core/utils/styles/text_style_manger.dart';

class CategoriesTabBar extends StatelessWidget {
  final TabController controller;
  final ValueChanged<int> onTabChanged;
  final int currentIndex;

  const CategoriesTabBar({
    super.key,
    required this.controller,
    required this.onTabChanged,
    required this.currentIndex,
  });

  // Category data structure
  static const List<Map<String, String>> _categories = [
    {'icon': AssetsData.flexibleIcon, 'label': 'I\'m Flexible'},
    {'icon': AssetsData.camelRidingIcon, 'label': 'Camel Riding'},
    {'icon': AssetsData.cookingClassIcon, 'label': 'Cooking Class'},
    {'icon': AssetsData.coffeeBrewingIcon, 'label': 'Coffee Brewing'},
    {'icon': AssetsData.foodToursIcon, 'label': 'Food Tours'},
    {'icon': AssetsData.hennaArtIcon, 'label': 'henna Art'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.kWhiteColor,
      child: TabBar(
        labelPadding: EdgeInsets.symmetric(horizontal: 7.5.w),
        tabAlignment: TabAlignment.center,
        isScrollable: true,
        padding: EdgeInsets.zero,
        dividerColor: AppColors.kBorderColor,
        dividerHeight: 1,
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(
            color: AppColors.kPrimaryColor,
            width: 2,
          ),
          borderRadius: BorderRadius.zero,
        ),
        indicatorPadding: const EdgeInsets.all(0),
        controller: controller,
        onTap: onTabChanged,
        labelStyle: getMediumStyle(
          fontSize: FontSize.s10,
          color: AppColors.kPrimaryColor,
          fontFamily: FontConstants.interFontfamily,
        ),
        unselectedLabelStyle: getMediumStyle(
          fontSize: FontSize.s10,
          color: AppColors.kOutlinedGrayColor,
          fontFamily: FontConstants.interFontfamily,
        ),
        tabs: List.generate(
          _categories.length,
          (index) => Tab(
            icon: SVGAssetHandler(
              boxFit: BoxFit.fill,
              svgPath: _categories[index]['icon']!,
              svgWidth: 32.w,
              svgheight: 32.h,
              svgColor: currentIndex == index
                  ? AppColors.kPrimaryColor
                  : AppColors.kOutlinedGrayColor,
            ),
            text: _categories[index]['label'],
          ),
        ),
      ),
    );
  }
}
