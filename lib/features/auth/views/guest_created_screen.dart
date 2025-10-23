import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lavescape/core/constant/app_assets.dart';
import 'package:lavescape/core/shared/core_widgets/svg_asset_handle.dart';
import 'package:lavescape/core/utils/colors/app_colors.dart';
import 'package:lavescape/core/utils/helper/spacing.dart';
import 'package:lavescape/core/utils/styles/font_manager.dart';
import 'package:lavescape/core/utils/styles/text_style_manger.dart';

class GuestCreatedScreen extends StatelessWidget {
  const GuestCreatedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      appBar: AppBar(backgroundColor: AppColors.kPrimaryColor),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            verticalSpace(100),
            SVGAssetHandler(
              svgPath: AssetsData.checkmarkIcon,
              svgWidth: 60.w,
              boxFit: BoxFit.fill,
              svgheight: 60.w,
            ),
            verticalSpace(30),
            Text(
              'Guest Profile Created.',
              style: getSemiBoldStyle(
                fontSize: FontSize.s20,
                color: AppColors.kWhiteColor,
                fontFamily: FontConstants.interFontfamily,
              ),
            ),
            verticalSpace(10),
            Text(
              'You have successfully created a guest profile, enabling access to explore and book experiences on the platform.',
              textAlign: TextAlign.center,
              style: getRegularStyle(
                fontSize: FontSize.s16,
                color: AppColors.kLightGrayColor,
                fontFamily: FontConstants.interFontfamily,
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
