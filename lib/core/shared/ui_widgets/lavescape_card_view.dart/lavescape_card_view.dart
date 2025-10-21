import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lavescape/core/shared/models/lavescape_model.dart';
import 'package:lavescape/core/shared/ui_widgets/lavescape_card_view.dart/widgets/card_detail_widget.dart';
import 'package:lavescape/core/shared/ui_widgets/lavescape_card_view.dart/widgets/card_image_carousel_widget.dart';
import 'package:lavescape/core/utils/colors/app_colors.dart';

class LavescapeCardView extends StatelessWidget {
  final LavescapeModel? lavescapeData;
  final VoidCallback? onFavoritePressed;
  final VoidCallback? onCardPressed;

  const LavescapeCardView({
    super.key,
    this.lavescapeData,
    this.onFavoritePressed,
    this.onCardPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onCardPressed,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.kWhiteColor,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: AppColors.kBorderColor),
          
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Carousel Section
            CardImageCarouselWidget(lavescapeData: lavescapeData),

            // Card Details Section
            CardDetailsWidget(lavescapeData: lavescapeData),
          ],
        ),
      ),
    );
  }
}
