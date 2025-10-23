

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lavescape/core/utils/colors/app_colors.dart';
import 'package:lavescape/core/utils/router/app_router.dart';
import 'package:lavescape/core/utils/styles/font_manager.dart';
import 'package:lavescape/core/utils/styles/text_style_manger.dart';

class NeedAnAccountText extends StatelessWidget {
  const NeedAnAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'New Here?',
            style: getSemiBoldStyle(fontSize: FontSize.s14, color: AppColors.kDarkPrimaryColor, fontFamily: FontConstants.interFontfamily),
          ),
          TextSpan(
            text: ' Sign up!',
            style:getSemiBoldStyle(fontSize: FontSize.s14 , color: AppColors.kPrimaryColor, fontFamily: FontConstants.interFontfamily),
             recognizer: TapGestureRecognizer()
              ..onTap = () {
                GoRouter.of(context).push(AppRouter.kRegisterWithPhoneView) ;
              },
          ),
        ],
      ),
    );
  }
}
