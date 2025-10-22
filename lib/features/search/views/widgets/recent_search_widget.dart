import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lavescape/core/shared/core_widgets/cached_nework_image.dart';
import 'package:lavescape/core/utils/colors/app_colors.dart';
import 'package:lavescape/core/utils/helper/spacing.dart';
import 'package:lavescape/core/utils/styles/font_manager.dart';
import 'package:lavescape/core/utils/styles/text_style_manger.dart';
import 'package:lavescape/features/search/models/recent_search_item.dart';

class RecentSearchWidget extends StatelessWidget {
  const RecentSearchWidget({super.key});

  // Sample recent search data
  static final List<RecentSearchItem> _recentSearches = [
    RecentSearchItem(
      imageUrl:
      'https://www.experiencejordan.com/wp-content/uploads/2024/02/camels_pride_wealth.jpg',
      title: 'Camel Ride',
      dateRange: 'Jan 4-5',
    ),
    RecentSearchItem(
      imageUrl:'https://www.experiencejordan.com/wp-content/uploads/2024/02/camels_pride_wealth.jpg',
      title: 'Henna Art',
      dateRange: 'Jan 4-5',
    ),
    RecentSearchItem(
      imageUrl:
      'https://www.experiencejordan.com/wp-content/uploads/2024/02/camels_pride_wealth.jpg',
      title: 'Coffee Brewing',
      dateRange: 'Jan 4-5',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Text(
            'Recent Search',
            style: getMediumStyle(
              fontSize: FontSize.s16,
              color: AppColors.kBlackTextColor,
              fontFamily: FontConstants.interFontfamily,
            ),
          ),
        ),
        verticalSpace(12),
        Container(
          decoration: BoxDecoration(
            color: AppColors.kWhiteColor,
            border: Border(
              top: BorderSide(color: AppColors.kBorderColor, width: 1),
            ),
          ),
           
        ),
        verticalSpace(16),
        ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
            itemCount: _recentSearches.length,
            separatorBuilder: (context, index) => verticalSpace(16),
            itemBuilder: (context, index) {
              final item = _recentSearches[index];
              return _RecentSearchItemWidget(item: item);
            },
          ),
      ],
    );
  }
}

class _RecentSearchItemWidget extends StatelessWidget {
  final RecentSearchItem item;

  const _RecentSearchItemWidget({required this.item});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        debugPrint('Tapped on: ${item.title}');
      },
      borderRadius: BorderRadius.circular(8.r),
      child: Row(
        children: [
         ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(4.r),
            
          ),
            child: AppCachedImage(
              url: item.imageUrl,
              width: 40.w,
              height: 40.h,
              boxShap: BoxShape.rectangle,
              boxfit: BoxFit.cover,
            ),
          ),
          horizontalSpace(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: getMediumStyle(
                    fontSize: FontSize.s14,
                    color: AppColors.kBlackTextColor,
                    fontFamily: FontConstants.interFontfamily,
                  ),
                ),
                Text(
                  item.dateRange,
                  style: getRegularStyle(
                    fontSize: FontSize.s12,
                    color: AppColors.kOutlinedGrayColor,
                    fontFamily: FontConstants.interFontfamily,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
