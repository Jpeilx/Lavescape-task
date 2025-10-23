import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lavescape/core/shared/core_widgets/svg_asset_handle.dart';
import 'package:lavescape/core/utils/colors/app_colors.dart';

class AuthCardTypeWidget extends StatelessWidget {
  final String svgPath;
  final  Function()? onTap;
  const AuthCardTypeWidget({super.key, required this.svgPath , this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 81.w,
        height: 46.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.kBlackColor.withValues(alpha: 0.08),
              spreadRadius: 0.2,
              blurRadius: 1,
              offset: const Offset(0, 0.5),
            ),
          ],
        ),
        child: Center(
          child: SVGAssetHandler(
            svgPath: svgPath,
            svgWidth: 18.w,
            boxFit: BoxFit.scaleDown,
            svgheight: 18.h,
          ),
        ),
      ),
    );
  }
}
