import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lavescape/core/shared/core_widgets/app_elevated_button.dart';
import 'package:lavescape/core/shared/ui_widgets/categories_tap_bar.dart';
import 'package:lavescape/core/utils/colors/app_colors.dart';
import 'package:lavescape/core/utils/functions/repeated_functions.dart';
import 'package:lavescape/core/utils/helper/spacing.dart';
import 'package:lavescape/core/utils/router/app_router.dart';
import 'package:lavescape/core/utils/styles/font_manager.dart';
import 'package:lavescape/features/search/views/widgets/date_range_picker_widget.dart';
import 'package:lavescape/features/search/views/widgets/guest_counter_widget.dart';
import 'package:lavescape/features/search/views/widgets/guest_details_widget.dart';
import 'package:lavescape/features/search/views/widgets/location_input_widget.dart';
import 'package:lavescape/features/search/views/widgets/recent_search_widget.dart';
import 'package:lavescape/features/search/views/widgets/search_custom_app_bar.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  late TextEditingController searchController;
  String? city ;

  int currentTabIndex = 0;
  bool isLoading = false;

  // Filter state
  DateTimeRange? selectedDateRange;
  int adultsCount = 2;
  int childrenCount = 0;
  bool showGuestDetails = false;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
    tabController = TabController(length: 6, vsync: this);
    tabController.addListener(() {
      if (tabController.indexIsChanging) {
        setState(() {
          isLoading = true;
          currentTabIndex = tabController.index;
        });
        // Simulate loading data
        Future.delayed(const Duration(milliseconds: 500), () {
          if (mounted) {
            setState(() {
              isLoading = false;
            });
          }
        });
      } else {
        setState(() {
          currentTabIndex = tabController.index;
        });
      }
    });
  }

  @override
  void dispose() {
    searchController.dispose();
  
    tabController.dispose();
    super.dispose();
  }

  void _handleClear() {
    setState(() {
   
      selectedDateRange = null;
      adultsCount = 2;
      childrenCount = 0;
      city = null ;
      showGuestDetails = false;
    });
  }

  void _handleSearch() {
    print(CategoriesTabBar.categories[currentTabIndex]['label']?? '');
    print(city);
    print(adultsCount);
    print(childrenCount);
    print('Selected data $selectedDateRange');
    GoRouter.of(context).push(AppRouter.kSearchResultView, extra: {
      'categoryName' : CategoriesTabBar.categories[currentTabIndex]['label']?? '',
      'city': city??'',
      'date': selectedDateRange == null ? '' : RepeatedFunctions.formatDateRange(selectedDateRange) ,
      'numberOfAdults':  adultsCount == 0 ? '' : '$adultsCount',
      'children': childrenCount  == 0 ? '' : '$childrenCount',
    } );
  }

  int get _totalGuests => adultsCount + childrenCount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchCustomAppBar(controller: searchController),
      body: Column(
        children: [
          // Categories Tab Bar (not pinned, scrolls with content)
          CategoriesTabBar(
            controller: tabController,
            currentIndex: currentTabIndex,
            onTabChanged: (index) {
              setState(() {
                currentTabIndex = index;
                isLoading = true;
              });
              // // Simulate loading data
              // Future.delayed(const Duration(milliseconds: 500), () {
              //   if (mounted) {
              //     setState(() {
              //       isLoading = false;
              //     });
              //   }
              // });
            },
          ),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  verticalSpace(20),
                  LocationInputWidget(onCityChanged: (String? value) { 
                   setState(() {
                     city= value ?? '';
                   });
                  }, selectedCity: city,),
                  verticalSpace(12),

                  // Date range picker
                  DateRangePickerWidget(
                    dateRange: selectedDateRange,
                    onDateRangeChanged: (range) {
                      setState(() {
                        selectedDateRange = range;
                       
                      });
                    },
                  ),
                  verticalSpace(12),
                  // Guest counter
                  GuestCounterWidget(
                    guestCount: _totalGuests,
                    onIncrement: () {
                      setState(() {
                        adultsCount++;
                      });
                    },
                    onDecrement: () {
                      if (_totalGuests > 0) {
                        setState(() {
                          if (childrenCount > 0) {
                            childrenCount--;
                          } else if (adultsCount > 0) {
                            adultsCount--;
                          }
                        });
                      }
                    },
                    onExpand: () {
                      setState(() {
                        showGuestDetails = !showGuestDetails;
                      });
                    },
                    isExpanded: showGuestDetails,
                  ),

                  if (showGuestDetails) ...[
                    verticalSpace(4),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: GuestDetailsWidget(
                        adults: adultsCount,
                        children: childrenCount,
                        onAdultsIncrement: () {
                          setState(() {
                            adultsCount++;
                          });
                        },
                        onAdultsDecrement: () {
                          if (adultsCount > 0) {
                            setState(() {
                              adultsCount--;
                            });
                          }
                        },
                        onChildrenIncrement: () {
                          setState(() {
                            childrenCount++;
                          });
                        },
                        onChildrenDecrement: () {
                          if (childrenCount > 0) {
                            setState(() {
                              childrenCount--;
                            });
                          }
                        },
                      ),
                    ),
                  ],
                  verticalSpace(30),
                  RecentSearchWidget(),
                ],
              ),
            ),
          ),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            decoration: BoxDecoration(
              color: AppColors.kWhiteColor,
              border: Border(
                top: BorderSide(color: AppColors.kBorderColor, width: 1),
              ),
            ),
            child: SafeArea(
              top: false,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: AppElevatedButton(
                      title: 'Clear',
                      onPressed: _handleClear,
                      background: AppColors.kWhiteColor,
                      titleColor: AppColors.kBlackTextColor,
                      width: double.infinity,
                      height: 38.h,
                      fontSize: FontSize.s15,
                      borderColor: AppColors.kBorderColor,
                    ),
                  ),
                  horizontalSpace(30),
                  Expanded(
                    flex: 3,
                    child: AppElevatedButton(
                      title: 'Search',
                      onPressed: _handleSearch,
                      background: AppColors.kPrimaryColor,
                      titleColor: AppColors.kWhiteColor,
                       
                      width: double.infinity,
                      height: 38.h,
                      fontSize: FontSize.s15,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
