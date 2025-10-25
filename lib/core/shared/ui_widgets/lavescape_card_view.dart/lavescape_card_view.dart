import 'package:flutter/material.dart';
import 'package:lavescape/core/shared/models/lavescape_model.dart';
import 'package:lavescape/core/shared/ui_widgets/lavescape_card_view.dart/widgets/card_detail_widget.dart';
import 'package:lavescape/core/shared/ui_widgets/lavescape_card_view.dart/widgets/card_image_carousel_widget.dart';

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Carousel Section
          CardImageCarouselWidget(lavescapeData: lavescapeData),
      
          // Card Details Section
          CardDetailsWidget(lavescapeData: lavescapeData),
        ],
      ),
    );
  }
}
