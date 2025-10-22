import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lavescape/core/constant/app_assets.dart';
import 'package:lavescape/core/shared/core_widgets/svg_asset_handle.dart';
import 'package:lavescape/core/utils/colors/app_colors.dart';
import 'package:lavescape/core/utils/helper/spacing.dart';
import 'package:lavescape/core/utils/styles/font_manager.dart';
import 'package:lavescape/core/utils/styles/text_style_manger.dart';
import 'package:lavescape/features/search/views/widgets/calender_widget.dart';

class DateRangePickerWidget extends StatefulWidget {
  final DateTimeRange? dateRange;
  final ValueChanged<DateTimeRange?> onDateRangeChanged;

  const DateRangePickerWidget({
    super.key,
    required this.dateRange,
    required this.onDateRangeChanged,
  });

  @override
  State<DateRangePickerWidget> createState() => _DateRangePickerWidgetState();
}

class _DateRangePickerWidgetState extends State<DateRangePickerWidget> {
  bool _isExpanded = false;
  DateTime? _startDate;
  DateTime? _endDate;

  @override
  void initState() {
    super.initState();
    if (widget.dateRange != null) {
      _startDate = widget.dateRange!.start;
      _endDate = widget.dateRange!.end;
    }
  }

  String _formatDateRange(DateTimeRange? range) {
    if (range == null) return 'Select Date';

    // Format dates manually without intl package
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    final startMonth = months[range.start.month - 1];
    final startDay = range.start.day;
    final endMonth = months[range.end.month - 1];
    final endDay = range.end.day;

    if (range.start.month == range.end.month) {
      return '$startMonth $startDay-$endDay';
    }
    return '$startMonth $startDay - $endMonth $endDay';
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Container(
        decoration: BoxDecoration(color: AppColors.kScaffoldFillColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
              borderRadius: BorderRadius.circular(8.r),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.kWhiteColor,
                  border: Border.all(color: AppColors.kBorderColor, width: 1),
                  borderRadius: BorderRadius.circular(8.r),

                  boxShadow: [
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Text(
                        _formatDateRange(widget.dateRange),
                        style: getMediumStyle(
                          fontSize: FontSize.s15,
                          color: AppColors.kBlackTextColor,
                          fontFamily: FontConstants.interFontfamily,
                        ),
                      ),
                    ),
                    Container(
                      height: 44.h,
                      width: 48.w,
                      decoration: BoxDecoration(
                        color: AppColors.kLightGrayColor,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(8.r),
                          bottomRight: Radius.circular(8.r),
                        ),
                      ),
                      child: SVGAssetHandler(
                        boxFit: BoxFit.scaleDown,
                        svgPath: AssetsData.calenderDaysIcon,
                        svgWidth: 16.w,
                        svgheight: 16.h,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Inline Calendar
            if (_isExpanded) ...[
              verticalSpace(4),
              CalenderWidget(startDate: _startDate, endDate: _endDate, onDateRangeChanged:widget.onDateRangeChanged,)
              
            ],
          ],
        ),
      ),
    );
  }

}
