import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lavescape/core/constant/app_assets.dart';
import 'package:lavescape/core/shared/core_widgets/shimmer_widget.dart';

class AppCachedImage extends StatelessWidget {
  final String url;
  final double width;
  final double height;
  final BoxShape boxShap;
  final String? errorImage;
  final BoxFit? boxfit;
  final bool showButtonRaduis;
  final double raduis ; 
  const AppCachedImage({
    super.key,
    this.boxShap = BoxShape.circle,
    this.width = 55,
    this.height = 55,
    this.errorImage,
    this.boxfit,
    this.showButtonRaduis = false,
    this.raduis = 4 ,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      imageBuilder: (context, imageProvider) => Container(
        width: width.w,
        height: height.h,
        decoration: BoxDecoration(
          shape: boxShap,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(raduis.r),
            topRight: Radius.circular(raduis.r),
            bottomLeft: Radius.circular(showButtonRaduis ? raduis.r : 0),
            bottomRight: Radius.circular(showButtonRaduis ? raduis.r : 0),
          ),
          image: DecorationImage(
            image: imageProvider,
            fit: boxfit ?? BoxFit.fill,
          ),
        ),
      ),
      placeholder: (context, url) => ShimmerWidget.circular(
        height: height.h,
        width: width.w,
        shapeBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(raduis.r),
            topRight: Radius.circular(raduis.r),
            bottomLeft: Radius.circular(showButtonRaduis ? raduis.r : 0),
            bottomRight: Radius.circular(showButtonRaduis ? raduis.r : 0),
          ),
        ),
      ),
      errorWidget: (context, url, error) => Image.asset(
        errorImage ?? AssetsData.noImage,
        height: height,
        width: width,
      ),
    );
  }
}
