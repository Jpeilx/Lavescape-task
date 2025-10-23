import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lavescape/core/constant/app_assets.dart';
import 'package:lavescape/core/shared/core_widgets/app_text_button.dart';
import 'package:lavescape/core/shared/core_widgets/svg_asset_handle.dart';
import 'package:lavescape/core/utils/colors/app_colors.dart';
import 'package:lavescape/core/utils/helper/spacing.dart';
import 'package:lavescape/core/utils/router/app_router.dart';
import 'package:lavescape/core/utils/styles/font_manager.dart';
import 'package:lavescape/core/utils/styles/text_style_manger.dart';
import 'package:lavescape/features/auth/views/widgets/resend_timer_widget.dart';
import 'package:pinput/pinput.dart';

class VerificationScreen extends StatefulWidget {
  // you should recieve two keys
  // 'type'  contain user email or phone the recieve otp
  // 'route' contain two volue 'password' refer to forget password route  'register'refer to register route
  final Map<String, String> phoneOrEmailAndType;
  const VerificationScreen({super.key, required this.phoneOrEmailAndType});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: AppColors.kBlackColor.withValues(alpha: 0.08),
                spreadRadius: 0,
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
              BoxShadow(
                color: AppColors.kBlackColor.withValues(alpha: 0.08),
                spreadRadius: 0,
                blurRadius: 4,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: AppBar(
            backgroundColor: AppColors.kWhiteColor,

            leading: InkWell(
              child: SVGAssetHandler(
                svgPath: AssetsData.arrowLeftIcon,
                svgWidth: 24.w,
                boxFit: BoxFit.scaleDown,
                svgheight: 24.h,
                svgColor: AppColors.kBlackColor,
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            title: Text(
              'Verify ${widget.phoneOrEmailAndType['type']}',
              style: getSemiBoldStyle(
                fontSize: FontSize.s18,
                color: AppColors.kBlackColor,
                fontFamily: FontConstants.interFontfamily,
              ),
            ),
            shadowColor: AppColors.kBlackColor.withValues(alpha: 0.08),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpace(30),
                  Text(
                    'OTP confirmation',
                    style: getSemiBoldStyle(
                      fontSize: FontSize.s18,
                      color: AppColors.kBlackColor,
                      fontFamily: FontConstants.interFontfamily,
                    ),
                  ),
                  verticalSpace(8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Enter the code we sent over ${widget.phoneOrEmailAndType['type']!.toLowerCase()} to',
                            textAlign: TextAlign.center,
                            style: getRegularStyle(
                              fontSize: FontSize.s14,
                              color: AppColors.kLightGrayColor4,
                              fontFamily: FontConstants.interFontfamily,
                            ),
                          ),
                          Text(
                            '${widget.phoneOrEmailAndType['value']}',
                            textAlign: TextAlign.center,
                            style: getSemiBoldStyle(
                              fontSize: FontSize.s14,
                              color: AppColors.kBlackColor,
                              fontFamily: FontConstants.interFontfamily,
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          GoRouter.of(context).pop();
                        },
                        child: SVGAssetHandler(
                          svgPath: AssetsData.editPinIcon,
                          svgWidth: 30.w,
                          boxFit: BoxFit.scaleDown,
                          svgheight: 30.h,
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(30),
                  Pinput(
                    length: 6,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    defaultPinTheme: PinTheme(
                      width: 50.w,
                      height: 42.h,
                      textStyle: getMediumStyle(
                        fontSize: FontSize.s20,
                        color: AppColors.kBlackColor,
                        fontFamily: FontConstants.interFontfamily,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(
                          color: AppColors.kBorderColor,
                          width: 1,
                        ),
                      ),
                    ),
                  ),

                  verticalSpace(20),
                    AppTextButton(
                    buttonText: "Continue",
                    buttonHeight: 38.h,
                    verticalPadding: 0,
                    horizontalPadding: 0,
                    borderRadius: 8,
                    textStyle: getSemiBoldStyle(
                      fontSize: FontSize.s16,
                      color: AppColors.kWhiteColor,
                      fontFamily: FontConstants.interFontfamily,
                    ),
                    onPressed: () {
                     GoRouter.of(context).push(AppRouter.kCompleteRegisterView,
                     // ignore: unnecessary_cast
                            extra: widget.phoneOrEmailAndType ,
                     );
                    },
                  ),
                  verticalSpace(20),
                  ResendTimerWidget(
                    onResend: () {
                      // Your resend code logic here
                      print('Resending verification code...');
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
