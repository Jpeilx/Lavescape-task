
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lavescape/core/constant/app_assets.dart';
import 'package:lavescape/core/shared/core_widgets/svg_asset_handle.dart';
import 'package:lavescape/core/utils/colors/app_colors.dart';
import 'package:lavescape/core/utils/styles/font_manager.dart';
import 'package:lavescape/core/utils/styles/text_style_manger.dart';
import 'package:lavescape/features/layout/logic/cubit/app_layout_cubit.dart';
import 'package:lavescape/features/layout/logic/cubit/app_layout_states.dart';

class AppLayout extends StatelessWidget {
  const AppLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppLayoutCubit(),
      child: BlocBuilder<AppLayoutCubit, AppLayoutStates>(
        builder: (context, state) {
          var layoutCubit = AppLayoutCubit.get(context);
          return Scaffold(
            body: layoutCubit
                .supermarketScreens[layoutCubit.currentButtomNavIndex],
            bottomNavigationBar: Container(
              height: 100.h,
             
              decoration:  BoxDecoration(
                border: Border.all(color: AppColors.kBorderColor),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: AppColors.kBorderColor,
                    blurRadius: 0,
                  ),
                ],
              ),
              child: BottomNavigationBar(
                elevation: 0,
                backgroundColor: AppColors.kWhiteColor,
                selectedItemColor: AppColors.kPrimaryColor,
                showUnselectedLabels: true,
                showSelectedLabels: true,
                unselectedItemColor: AppColors.kOutlinedGrayColor,
                selectedLabelStyle: getMediumStyle(fontSize: FontSize.s12, color: AppColors.kPrimaryColor, fontFamily: FontConstants.interFontfamily),
                unselectedLabelStyle: getRegularStyle(fontSize: FontSize.s12, color: AppColors.kOutlinedGrayColor, fontFamily: FontConstants.interFontfamily),
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                      icon: SVGAssetHandler(
                          boxFit: BoxFit.fill,
                          svgPath: AssetsData.exploreIcon,
                          svgWidth: 24.w,
                          svgheight: 24.h,
                          svgColor: layoutCubit.currentButtomNavIndex == 0
                              ? AppColors.kPrimaryColor
                              : AppColors.kOutlinedGrayColor),
                      label: 'Explore'),
                  BottomNavigationBarItem(
                      icon: SVGAssetHandler(
                          boxFit: BoxFit.fill,
                          svgPath: AssetsData.reservationIcon,
                          svgWidth: 24.w,
                          svgheight: 24.h,
                          svgColor: layoutCubit.currentButtomNavIndex == 1
                              ? AppColors.kPrimaryColor
                              : AppColors.kOutlinedGrayColor),
                      label: 'Reservation'),
                  BottomNavigationBarItem(
                      icon:SVGAssetHandler(
                          boxFit: BoxFit.fill,
                          svgPath: AssetsData.wishlistIcon,
                          svgWidth: 24.w,
                          svgheight: 24.h,
                          svgColor: layoutCubit.currentButtomNavIndex == 2
                              ? AppColors.kPrimaryColor
                              : AppColors.kOutlinedGrayColor),
                      label: 'Wishlist'),
                       BottomNavigationBarItem(
                      icon: SVGAssetHandler(
                          boxFit: BoxFit.fill,
                          svgPath: AssetsData.inboxIcon,
                          svgWidth: 24.w,
                          svgheight: 24.h,
                          svgColor: layoutCubit.currentButtomNavIndex == 3
                              ? AppColors.kPrimaryColor
                              : AppColors.kOutlinedGrayColor),
                      label: 'Inbox'),
                       BottomNavigationBarItem(
                      icon: SVGAssetHandler(
                          boxFit: BoxFit.fill,
                          svgPath: AssetsData.profileIcon,
                          svgWidth: 24.w,
                          svgheight: 24.h,
                          svgColor: layoutCubit.currentButtomNavIndex == 4
                              ? AppColors.kPrimaryColor
                              : AppColors.kOutlinedGrayColor),
                      label: 'Profile'),
                ],
                currentIndex: layoutCubit.currentButtomNavIndex,
                onTap: (index) {
                  layoutCubit.changeButtonNavItem(index);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
