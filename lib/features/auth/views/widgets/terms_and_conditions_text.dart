
import 'package:flutter/material.dart';
import 'package:lavescape/core/utils/colors/app_colors.dart';
import 'package:lavescape/core/utils/styles/font_manager.dart';
import 'package:lavescape/core/utils/styles/text_style_manger.dart';

class TermsAndConditionsText extends StatelessWidget {
  const TermsAndConditionsText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.start,
      text: TextSpan(
        
        children: [
          TextSpan(
            text: 'By taping Agree and Continue, I accept Lavescape’s',
            style: getMediumStyle(fontSize: FontSize.s12, color: AppColors.kOutlinedGrayColor, fontFamily: FontConstants.interFontfamily),
          ),
          TextSpan(
            text: ' Terms, Payment Terms, and Notifications Policy',
            style:  getMediumStyle(fontSize: FontSize.s12, color: AppColors.kBlackTextColor, fontFamily: FontConstants.interFontfamily),
          ),
          TextSpan(
            text: ' and acknowledge the',
            style: getMediumStyle(fontSize: FontSize.s12, color: AppColors.kOutlinedGrayColor, fontFamily: FontConstants.interFontfamily),
           
          ),
          TextSpan(
            text: ' Privacy Policy.',
            style: getMediumStyle(fontSize: FontSize.s12, color: AppColors.kBlackTextColor, fontFamily: FontConstants.interFontfamily),
          ),
        ],
      ),
    );
  }
}
