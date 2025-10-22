import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lavescape/core/constant/app_assets.dart';
import 'package:lavescape/core/shared/core_widgets/svg_asset_handle.dart';
import 'package:lavescape/core/utils/colors/app_colors.dart';
import 'package:lavescape/core/utils/helper/spacing.dart';
import 'package:lavescape/core/utils/styles/font_manager.dart';
import 'package:lavescape/core/utils/styles/text_style_manger.dart';

class CalenderWidget extends StatefulWidget {

  final DateTime? startDate;
  final DateTime? endDate;
   final ValueChanged<DateTimeRange?> onDateRangeChanged;

  const CalenderWidget({super.key ,required this.startDate, required this.endDate ,required this.onDateRangeChanged});

  @override
  State<CalenderWidget> createState() => _CalenderWidgetState();
}

class _CalenderWidgetState extends State<CalenderWidget> {
    DateTime _currentMonth = DateTime.now();

   DateTime? _startDate;

  DateTime? _endDate;
  @override
  void initState() {
    _startDate
        = widget.startDate;
    _endDate = widget.endDate;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
                // margin: EdgeInsets.only(left: 20.w, right: 20.w),
                padding: EdgeInsets.all(16.w),
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
                child: Column(
                  children: [
                    // Month navigation
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: _previousMonth,
                          icon: SVGAssetHandler(
                            boxFit: BoxFit.fill,
                            svgPath: AssetsData.previousMonthButtonIcon,
                            svgWidth: 16.w,
                            svgheight: 24.h,
                          ),
                        ),
                        Text(
                          _getMonthYearString(_currentMonth),
                          style: getMediumStyle(
                            fontSize: FontSize.s18,
                            color: AppColors.kBlackTextColor,
                            fontFamily: FontConstants.interFontfamily,
                          ),
                        ),
                        IconButton(
                          onPressed: _nextMonth,
                          icon: SVGAssetHandler(
                            boxFit: BoxFit.fill,
                            svgPath: AssetsData.nextMonthButtonIcon,
                            svgWidth: 16.w,
                            svgheight: 24.h,
                          ),
                        ),
                      ],
                    ),

                    verticalSpace(27),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa']
                          .map(
                            (day) => SizedBox(
                              width: 40.w,
                              child: Center(
                                child: Text(
                                  day,
                                  style: getMediumStyle(
                                    fontSize: FontSize.s14,
                                    color: AppColors.kOutlinedGrayColor,
                                    fontFamily: FontConstants.interFontfamily,
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),

                    SizedBox(height: 8.h),

                    // Calendar grid
                    _buildCalendarGrid(),
                  ],
                ),
              );
  }

  Widget _buildCalendarGrid() {
    final firstDayOfMonth = DateTime(
      _currentMonth.year,
      _currentMonth.month,
      1,
    );
    final lastDayOfMonth = DateTime(
      _currentMonth.year,
      _currentMonth.month + 1,
      0,
    );
    final firstWeekday = firstDayOfMonth.weekday % 7; // 0 = Sunday
    final daysInMonth = lastDayOfMonth.day;

    List<Widget> dayWidgets = [];

    // Add empty spaces for days before the first day of month
    for (int i = 0; i < firstWeekday; i++) {
      dayWidgets.add(SizedBox(width: 40.w, height: 40.h));
    }

    // Add day buttons
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    for (int day = 1; day <= daysInMonth; day++) {
      final date = DateTime(_currentMonth.year, _currentMonth.month, day);
      final isBeforeToday = date.isBefore(today);
      final isStartDate = _isSameDay(date, _startDate);
      final isEndDate = _isSameDay(date, _endDate);
      final isInRange = _isInRange(date);

      dayWidgets.add(
        GestureDetector(
          onTap: isBeforeToday ? null : () => _onDateSelected(date),
          child: Center(
            child: Container(
              width: (isStartDate || isEndDate) ? 56.w : 40.w,
              height: (isStartDate || isEndDate) ? 56.h : 40.h,
              decoration: BoxDecoration(
                color: (isStartDate || isEndDate)
                    ? AppColors.kPrimaryColor
                    : isInRange
                    ? AppColors.kLightGrayColor
                    : Colors.transparent,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  '$day',
                  style: getMediumStyle(
                    fontSize: FontSize.s14,
                    color: isBeforeToday
                        ? AppColors.kLightGrayColor2
                        : (isStartDate || isEndDate)
                        ? AppColors.kWhiteColor
                        : AppColors.kBlackTextColor,
                    fontFamily: FontConstants.interFontfamily,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }

    return GridView.count(
      crossAxisCount: 7,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 1,
      children: dayWidgets,
    );
  }

  String _getMonthYearString(DateTime date) {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return '${months[date.month - 1]} ${date.year}';
  }

  void _previousMonth() {
    setState(() {
      _currentMonth = DateTime(_currentMonth.year, _currentMonth.month - 1);
    });
  }

  void _nextMonth() {
    setState(() {
      _currentMonth = DateTime(_currentMonth.year, _currentMonth.month + 1);
    });
  }

  void _onDateSelected(DateTime date) {
    setState(() {
      if (_startDate == null || (_startDate != null && _endDate != null)) {
        // Start new selection
        _startDate = date;
        _endDate = null;
      } else if (_startDate != null && _endDate == null) {
        // Complete the range
        if (date.isBefore(_startDate!)) {
          _endDate = _startDate;
          _startDate = date;
        } else {
          _endDate = date;
        }

        // Notify parent and close picker
        if (_startDate != null && _endDate != null) {
          widget.onDateRangeChanged(
            DateTimeRange(start: _startDate!, end: _endDate!),
          );
          
        }
      }
    });
  }

  bool _isSameDay(DateTime? date1, DateTime? date2) {
    if (date1 == null || date2 == null) return false;
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  bool _isInRange(DateTime date) {
    if (_startDate == null || _endDate == null) return false;
    return date.isAfter(_startDate!) && date.isBefore(_endDate!);
  }
}