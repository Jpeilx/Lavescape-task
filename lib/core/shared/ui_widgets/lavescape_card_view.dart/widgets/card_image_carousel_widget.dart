import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lavescape/core/constant/app_assets.dart';
import 'package:lavescape/core/shared/models/lavescape_model.dart';
import 'package:lavescape/core/shared/core_widgets/cached_nework_image.dart';
import 'package:lavescape/core/shared/ui_widgets/lavescape_card_view.dart/widgets/guest_favorite_buttom_widget.dart';
import 'package:lavescape/core/shared/core_widgets/svg_asset_handle.dart';
import 'package:lavescape/core/utils/colors/app_colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CardImageCarouselWidget extends StatefulWidget {
  final LavescapeModel? lavescapeData;
  const CardImageCarouselWidget({super.key, this.lavescapeData});

  @override
  State<CardImageCarouselWidget> createState() =>
      _CardImageCarouselWidgetState();
}

class _CardImageCarouselWidgetState extends State<CardImageCarouselWidget> {
  late PageController _pageController;
  int _currentPage = 0;
  late bool _isFavorite ;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _isFavorite =  widget.lavescapeData?.isWishlisted ?? false;
    _pageController.addListener(() {
      int next = _pageController.page!.round();
      if (_currentPage != next) {
        setState(() {
          _currentPage = next;
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Image PageView
        ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.r),
            topRight: Radius.circular(12.r),
          ),
          child: SizedBox(
            height: 334.h,
            child: PageView.builder(
              controller: _pageController,
              itemCount: widget.lavescapeData?.imageUrls.length ?? 0,
              itemBuilder: (context, index) {
                return AppCachedImage(
                  url: widget.lavescapeData?.imageUrls[index] ?? '',
                  width: 353.w,
                  height: 334.h,
                  boxfit: BoxFit.cover,
                  boxShap: BoxShape.rectangle,
                );
              },
            ),
          ),
        ),

        // Guest Favorite Badge
        if (widget.lavescapeData?.isGuestFavorite ?? false)
          Positioned(top: 16.h, left: 16.w, child: GuestFavoriteCardWidget()),

        // Favorite Heart Icon
        Positioned(
          top: 16.h,
          right: 16.w,
          child: GestureDetector(
            onTap: () {
              setState(() {
                _isFavorite = !_isFavorite;
              });
            },
            child: !_isFavorite
                ? SVGAssetHandler(
                    boxFit: BoxFit.fill,
                    svgPath: AssetsData.heartIcon,
                    svgWidth: 24.w,
                    svgheight: 24.h,
                  )
                : SVGAssetHandler(
                    boxFit: BoxFit.fill,
                    svgPath: AssetsData.heartIcon,
                    svgWidth: 24.w,
                    svgheight: 24.h,
                    svgColor: AppColors.kRedColor,
                  ),
          ),
        ),

        // Page Indicators
        if ((widget.lavescapeData?.imageUrls.length ?? 0) > 1)
          Positioned(
            bottom: 16.h,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [SmoothPageIndicator(
                    controller: _pageController,
                    count: widget.lavescapeData?.imageUrls.length ?? 0,
                    effect: SwapEffect(
                      activeDotColor: AppColors.kWhiteColor,
                      dotColor: AppColors.kNeutralGrayColor,
                      dotHeight: 6.h,
                      
                      dotWidth: 6.w,
                      spacing: 3.w,
                    ),
                  ),]
            ),
          ),
      ],
    );
  }

  
}
