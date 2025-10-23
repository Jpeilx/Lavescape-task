import 'package:country_code_picker/country_code_picker.dart';
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
import 'package:lavescape/features/auth/views/widgets/terms_and_conditions_text.dart';

class CompleteSignupScreen extends StatefulWidget {
  final Map<String, String> phoneOrEmailAndType;
  const CompleteSignupScreen({super.key, required this.phoneOrEmailAndType});

  @override
  State<CompleteSignupScreen> createState() => _CompleteSignupScreenState();
}

class _CompleteSignupScreenState extends State<CompleteSignupScreen> {
  final formKey = GlobalKey<FormState>();
  bool isObscureText = true;
  bool passwordHasError = false;
  bool nameHasError = false;
  bool dateHasError = false;
  bool emailHasError = false;
  bool phoneHasError = false;
  String countryCode = '+966';
  late TextEditingController nameController = TextEditingController();
  late TextEditingController emailController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();
  late TextEditingController calenderController = TextEditingController();
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
              'Finish Signing Up',
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
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Legal Name',
                        style: getSemiBoldStyle(
                          fontSize: FontSize.s14,
                          color: AppColors.kBlackTextColor,
                          fontFamily: FontConstants.interFontfamily,
                        ),
                      ),
                      verticalSpace(10),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          boxShadow: nameHasError
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
                          controller: nameController,
                          label: 'Full Name',
                          keyboardtype: TextInputType.name,
                          suffixPadding: EdgeInsets.all(0),
                          perfixPadding: EdgeInsets.all(0),
                          prefix: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: SVGAssetHandler(
                              svgPath: AssetsData.profileIcon,
                              svgWidth: 14.w,
                              boxFit: BoxFit.fill,
                              svgheight: 14.h,
                            ),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 0.w,
                            vertical: 0.h,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              setState(() {
                                nameHasError = true;
                              });

                              return 'You should enter your name';
                            }
                            nameHasError = false;
                            return null;
                          },
                        ),
                      ),
                      verticalSpace(20),
                      Text(
                        'Date of birth',
                        style: getSemiBoldStyle(
                          fontSize: FontSize.s14,
                          color: AppColors.kBlackTextColor,
                          fontFamily: FontConstants.interFontfamily,
                        ),
                      ),
                      verticalSpace(10),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          boxShadow: dateHasError
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
                          controller: calenderController,
                          label: 'MM/DD/YYYY',
                          keyboardtype: TextInputType.name,
                          suffixPadding: EdgeInsets.all(0),
                          perfixPadding: EdgeInsets.all(0),
                          suffixIcon: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: SVGAssetHandler(
                              svgPath: AssetsData.authCalendarIcon,
                              svgWidth: 14.w,
                              boxFit: BoxFit.scaleDown,
                              svgheight: 14.h,
                            ),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 0.w,
                            vertical: 0.h,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              setState(() {
                                dateHasError = true;
                              });

                              return 'You should enter your date of birth';
                            }
                            dateHasError = false;
                            return null;
                          },
                        ),
                      ),
                      verticalSpace(20),
                      Text(
                        widget.phoneOrEmailAndType['type'] == "Phone"
                            ? 'Email Address'
                            : "Phone Number",
                        style: getSemiBoldStyle(
                          fontSize: FontSize.s14,
                          color: AppColors.kBlackTextColor,
                          fontFamily: FontConstants.interFontfamily,
                        ),
                      ),
                      verticalSpace(10),
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
                          controller: emailController,
                          label: widget.phoneOrEmailAndType['type'] == "Phone"
                              ? 'you@email.com'
                              : '$countryCode (000) 000-0000',
                          keyboardtype: TextInputType.name,
                          suffixPadding: EdgeInsets.all(0),
                          perfixPadding: EdgeInsets.all(0),
                          prefix: widget.phoneOrEmailAndType['type'] == "Phone"
                              ? Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 12),
                                  child: SVGAssetHandler(
                                    svgPath: AssetsData.emailIcon,
                                    svgWidth: 14.w,
                                    boxFit: BoxFit.fill,
                                    svgheight: 14.h,
                                  ),
                                )
                              : Container(
                                  margin: EdgeInsets.only(right: 14.w),
                                  child: CountryCodePicker(
                                    onChanged: (code) {
                                      setState(() {
                                        countryCode = code.dialCode ?? '+966';
                                      });
                                    },
                                    initialSelection: 'SA',
                                    favorite: ['+39', 'FR'],
                                    showCountryOnly: false,
                                    showOnlyCountryWhenClosed: false,
                                    showDropDownButton: false,
                                    alignLeft: false,

                                    builder: (countryCode) {
                                      return Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          horizontalSpace(12),
                                          Container(
                                            width: 18.w,
                                            height: 18.h,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image:
                                                  countryCode?.flagUri != null
                                                  ? DecorationImage(
                                                      image: AssetImage(
                                                        countryCode!.flagUri!,
                                                        package:
                                                            'country_code_picker',
                                                      ),
                                                      fit: BoxFit.cover,
                                                    )
                                                  : null,
                                            ),
                                          ),
                                          horizontalSpace(8),
                                          Text(
                                            '${countryCode?.code ?? ''}',
                                            style: getMediumStyle(
                                              fontSize: FontSize.s14,
                                              color:
                                                  AppColors.kOutlinedGrayColor,
                                              fontFamily:
                                                  FontConstants.interFontfamily,
                                            ),
                                          ),
                                          horizontalSpace(8),
                                          SVGAssetHandler(
                                            svgPath: AssetsData.arrowDownIcon,
                                            svgWidth: 14.w,
                                            boxFit: BoxFit.scaleDown,
                                            svgheight: 14.h,
                                          ),
                                          horizontalSpace(12),
                                          Container(
                                            height: 38.h,
                                            width: 2,
                                            color: AppColors.kBorderColor,
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 0.w,
                            vertical: 0.h,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              setState(() {
                                emailHasError = true;
                              });

                              return widget.phoneOrEmailAndType['type'] ==
                                      "Phone"
                                  ? 'You should enter your email'
                                  : 'You should enter your phone';
                            }
                            nameHasError = false;
                            return null;
                          },
                        ),
                      ),
                      verticalSpace(20),
                      Text(
                        'Create Password',
                        style: getSemiBoldStyle(
                          fontSize: FontSize.s14,
                          color: AppColors.kBlackTextColor,
                          fontFamily: FontConstants.interFontfamily,
                        ),
                      ),
                      verticalSpace(10),
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
                          prefix: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: SVGAssetHandler(
                              svgPath: AssetsData.keyIcon,
                              svgWidth: 14.w,
                              boxFit: BoxFit.fill,
                              svgheight: 14.h,
                            ),
                          ),
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

                      verticalSpace(30),
                      AppTextButton(
                        buttonText: "Agree and Continue",
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
                            GoRouter.of(context).push(AppRouter.kGuestCreatedView);
                          }
                        },
                      ),
                      verticalSpace(16),
                      const TermsAndConditionsText(),
                     
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
