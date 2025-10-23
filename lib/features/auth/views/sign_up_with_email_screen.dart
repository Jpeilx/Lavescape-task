import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lavescape/core/constant/app_assets.dart';
import 'package:lavescape/core/shared/core_widgets/app_text_button.dart';
import 'package:lavescape/core/shared/core_widgets/app_text_form_field.dart';
import 'package:lavescape/core/shared/core_widgets/svg_asset_handle.dart';
import 'package:lavescape/core/utils/colors/app_colors.dart';
import 'package:lavescape/core/utils/helper/spacing.dart';
import 'package:lavescape/core/utils/router/app_router.dart';
import 'package:lavescape/core/utils/styles/font_manager.dart';
import 'package:lavescape/core/utils/styles/text_style_manger.dart';
import 'package:lavescape/features/auth/views/widgets/auth_card_type_widget.dart';

class SignUpWithEmailScreen extends StatefulWidget {
  const SignUpWithEmailScreen({super.key});

  @override
  State<SignUpWithEmailScreen> createState() => _SignUpWithEmailScreenState();
}

class _SignUpWithEmailScreenState extends State<SignUpWithEmailScreen> {
  final TextEditingController emailController = TextEditingController();

  bool hasEmailError = false;

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpace(30),
                  Align(
                    alignment: Alignment.center,
                    child: SVGAssetHandler(
                      svgPath: AssetsData.logoLavender,
                      svgWidth: 165.w,
                      svgheight: 60.h,
                      boxFit: BoxFit.cover,
                    ),
                  ),
                  verticalSpace(40),
                  Text(
                    'Welcome to Lavescape',
                    style: getSemiBoldStyle(
                      fontSize: FontSize.s18,
                      color: AppColors.kBlackTextColor,
                      fontFamily: FontConstants.interFontfamily,
                    ),
                  ),
                  verticalSpace(8),
                  Text(
                    'Discover Authentic Experiences or Share Your Own—Log In or Sign Up to Get Started!',
                    style: getRegularStyle(
                      fontSize: FontSize.s14,
                      color: AppColors.kOutlinedGrayColor,
                      fontFamily: FontConstants.interFontfamily,
                    ),
                  ),
                  verticalSpace(20),
                  Text(
                    'Email Address',
                    style: getSemiBoldStyle(
                      fontSize: FontSize.s14,
                      color: AppColors.kBlackTextColor,
                      fontFamily: FontConstants.interFontfamily,
                    ),
                  ),
                  verticalSpace(8),
                  Form(
                    key: formKey,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        boxShadow: hasEmailError
                            ? []
                            : [
                                BoxShadow(
                                  color: AppColors.kBlackColor.withValues(
                                    alpha: 0.08,
                                  ),
                                  spreadRadius: 0.2,
                                  blurRadius: 1,
                                  offset: const Offset(0, 0.5),
                                ),
                              ],
                      ),
                      child: AppTextFormField(
                        controller: emailController,

                        label: 'you@email.com',
                        keyboardtype: TextInputType.name,
                        suffixPadding: EdgeInsets.all(0),
                        perfixPadding: EdgeInsets.all(0),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 0.w,
                          vertical: 0.h,
                        ),
                        prefix: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 13),
                          child: SVGAssetHandler(
                            svgPath: AssetsData.emailIcon,
                            svgWidth: 14.w,
                            boxFit: BoxFit.scaleDown,
                            svgheight: 14.h,
                            svgColor: AppColors.kOutlinedGrayColor,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.kBorderColor,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.kRedColor,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.kBorderColor,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        onchanged: (value) {},
                        validator: (value) {
                          if (value!.isEmpty) {
                            setState(() {
                              hasEmailError = true;
                            });
                            return 'You should enter an email address';
                          }

                          return null;
                        },
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
                      if (formKey.currentState!.validate()) {
                        // ignore: unnecessary_cast
                        GoRouter.of(context).push(AppRouter.kVerifyView, extra: {
                          'type': 'Email',
                          'value': emailController.text.toString(),
                      //    'route': 'register',
                        } as Map<String, String>);
                      }
                    },
                  ),
                  verticalSpace(30),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: AppColors.kBorderColor,
                          thickness: 1,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Text(
                          'OR',
                          style: getMediumStyle(
                            fontSize: FontSize.s16,
                            color: AppColors.kOutlinedGrayColor,
                            fontFamily: FontConstants.interFontfamily,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: AppColors.kBorderColor,
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AuthCardTypeWidget(svgPath: AssetsData.googleIcon),
                      AuthCardTypeWidget(svgPath: AssetsData.facebookIcon),
                      AuthCardTypeWidget(svgPath: AssetsData.appleIcon),
                      AuthCardTypeWidget(
                        svgPath: AssetsData.phoneIcon,
                        onTap: () {
                          GoRouter.of(
                            context,
                          ).push(AppRouter.kRegisterWithPhoneView);
                        },
                      ),
                    ],
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
