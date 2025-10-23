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
import 'package:lavescape/features/auth/views/widgets/need_an_account_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  bool isObscureText = true;
  bool emailHasError = false;
  bool passwordHasError = false;
  late TextEditingController userNameController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();

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
                    'Welcome Back',
                    style: getSemiBoldStyle(
                      fontSize: FontSize.s18,
                      color: AppColors.kBlackTextColor,
                      fontFamily: FontConstants.interFontfamily,
                    ),
                  ),
                  verticalSpace(8),
                  Text(
                    'Log in to Explore Unique Experiences or Manage Your Own!',
                    style: getRegularStyle(
                      fontSize: FontSize.s14,
                      color: AppColors.kOutlinedGrayColor,
                      fontFamily: FontConstants.interFontfamily,
                    ),
                  ),
                  verticalSpace(20),
                  Text(
                    'Email Address / Phone Number',
                    style: getSemiBoldStyle(
                      fontSize: FontSize.s14,
                      color: AppColors.kBlackTextColor,
                      fontFamily: FontConstants.interFontfamily,
                    ),
                  ),
                  verticalSpace(8),
                  Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            boxShadow: emailHasError
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
                            controller: userNameController,
                            label: 'Enter',
                            keyboardtype: TextInputType.name,
                            suffixPadding: EdgeInsets.all(0),
                            perfixPadding: EdgeInsets.all(0),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 0.w,
                              vertical: 0.h,
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                setState(() {
                                  emailHasError = true;
                                });

                                return 'You should enter a phone or email ';
                              }
                              emailHasError = false;
                              return null;
                            },
                          ),
                        ),
                        verticalSpace(12),
                        Text(
                          'Password',
                          style: getSemiBoldStyle(
                            fontSize: FontSize.s14,
                            color: AppColors.kBlackTextColor,
                            fontFamily: FontConstants.interFontfamily,
                          ),
                        ),
                        verticalSpace(8),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            boxShadow: passwordHasError
                                ? []
                                : [
                                    BoxShadow(
                                      color: AppColors.kBlackColor.withValues(
                                        alpha: 0.08,
                                      ), // shadow color
                                      spreadRadius: 0.2,
                                      blurRadius: 1,
                                      offset: const Offset(0, 0.5),
                                    ),
                                  ],
                          ),
                          child: AppTextFormField(
                            controller: passwordController,
                            keyboardtype: TextInputType.name,

                            label: '• • • • • • • •',
                            perfixPadding: EdgeInsets.all(0),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 0.w,
                              vertical: 0.h,
                            ),
                            maxLines: 1,
                            password: isObscureText,
                            validator: (value) {
                              if (value!.isEmpty) {
                                setState(() {
                                  passwordHasError = true;
                                });
                                return 'You should enter your password';
                              }
                              return null;
                            },
                            onsubbmited: (value) {
                              if (formKey.currentState!.validate()) {
                                GoRouter.of(
                                  context,
                                ).push(AppRouter.kAppLayoutView);
                              }
                            },
                            suffixPadding: EdgeInsets.all(0),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isObscureText = !isObscureText;
                                });
                              },
                              child: SVGAssetHandler(
                                svgPath: isObscureText
                                    ? AssetsData.eyeOffIcon
                                    : AssetsData.eyeIcon,
                                svgWidth: 14.w,
                                svgheight: 14.h,
                                boxFit: BoxFit.scaleDown,
                              ),
                            ),
                          ),
                        ),
                        verticalSpace(26),
                        Text(
                          'Forget Password ?',
                          style: getSemiBoldStyle(
                            fontSize: FontSize.s14,
                            color: AppColors.kPrimaryColor,
                            fontFamily: FontConstants.interFontfamily,
                          ),
                        ),
                        verticalSpace(30),
                        AppTextButton(
                          buttonText: "Login",
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
                              GoRouter.of(
                                context,
                              ).push(AppRouter.kAppLayoutView);
                            }
                          },
                        ),

                        verticalSpace(220),
                        Align(
                          alignment: AlignmentDirectional.bottomCenter,
                          child: const NeedAnAccountText(),
                        ),
                      ],
                    ),
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
