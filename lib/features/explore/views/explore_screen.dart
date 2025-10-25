import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lavescape/core/constant/app_assets.dart';
import 'package:lavescape/core/shared/core_widgets/app_elevated_button.dart';
import 'package:lavescape/core/shared/models/lavescape_model.dart';
import 'package:lavescape/core/shared/ui_widgets/categories_tap_bar.dart';
import 'package:lavescape/core/shared/ui_widgets/lavescape_card_view.dart/lavescape_card_view.dart';
import 'package:lavescape/core/utils/colors/app_colors.dart';
import 'package:lavescape/core/utils/styles/font_manager.dart';
import 'package:lavescape/features/explore/views/widgets/explore_custom_App_bar.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  bool isLoading = false;
  int currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
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
    tabController.dispose();
    super.dispose();
  }

  final List<LavescapeModel> laveScapeDummyData = const [
    LavescapeModel(
      imageUrls: [
        'https://media.istockphoto.com/id/1145064928/photo/tourist-riding-camel-in-desert.jpg?s=612x612&w=0&k=20&c=zZpS5SxgBNFhI5kb-oBnf2CL4RyBcRKgCGrImtKs7dw=',
        'https://images.unsplash.com/photo-1512632578888-169bbbc64f33?w=800',
        'https://images.unsplash.com/photo-1570939274717-7eda259b50ed?w=800',
        'https://images.unsplash.com/photo-1580674684081-7617fbf3d745?w=800',
        'https://images.unsplash.com/photo-1549144511-f099e773c147?w=800',
      ],
      title: 'Desert Camel Adventure in Wadi Rum',
      location: 'Wadi Rum, Jordan',
      price: 69.99,
      rating: 4.81,
      isGuestFavorite: true,
      isWishlisted: false,
      latitude: 34,
      longitude: 34,
    ),
    LavescapeModel(
      imageUrls: [
        'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=800',
        'https://images.unsplash.com/photo-1464822759023-fed622ff2c3b?w=800',
      ],
      title: 'Mountain Hiking Experience',
      location: 'Swiss Alps, Switzerland',
      price: 89.99,
      rating: 4.95,
      isWishlisted: true,
      isGuestFavorite: false,
      latitude: 443,
      longitude: 34334,
    ),
    // Add more dummy data as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: ExploreCustomAppBar(),
      body: SafeArea(
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              delegate: _CategoriesTabBarDelegate(
                height: 70.h,
                child: CategoriesTabBar(
                  controller: tabController,
                  currentIndex: currentTabIndex,
                  onTabChanged: (index) {
                    setState(() {
                      currentTabIndex = index;
                      isLoading = true;
                    });
                    // Simulate loading data
                    Future.delayed(const Duration(milliseconds: 500), () {
                      if (mounted) {
                        setState(() {
                          isLoading = false;
                        });
                      }
                    });
                  },
                ),
              ),
            ),
            // Spacing after tab bar
            SliverPadding(padding: EdgeInsets.only(top: 10.h)),
            // Show loading indicator or cards based on loading state
            if (isLoading)
              SliverFillRemaining(
                hasScrollBody: false,
                child: Center(
                  child: CircularProgressIndicator(
                    color: AppColors.kPrimaryColor,
                  ),
                ),
              )
            else
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    // Example Experience Card
                    LavescapeCardView(
                      lavescapeData: laveScapeDummyData[0],
                      onFavoritePressed: () {
                        // Handle favorite action
                        debugPrint('Favorite pressed');
                      },
                      onCardPressed: () {
                        // Handle card tap
                        debugPrint('Card pressed');
                      },
                    ),
                    SizedBox(height: 16.h),
                    // You can add more cards here
                    LavescapeCardView(
                      lavescapeData: laveScapeDummyData[1],
                      onFavoritePressed: () {
                        debugPrint('Favorite pressed');
                      },
                      onCardPressed: () {
                        debugPrint('Card pressed');
                      },
                    ),
                    SizedBox(height: 16.h),
                  ]),
                ),
              ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: SizedBox(
          width: 100.w,
          child: AppElevatedButton(
            title: 'Map View',
            onPressed: () {},
            background: AppColors.kPrimaryColor,
            titleColor: AppColors.kWhiteColor,
            marginStart: 8,
            width: 100.w,
            height: 32.h,
            fontSize: FontSize.s14,
            iconStart: true,
            iconPath: AssetsData.mapIcon,
          ),
        ),
      ),
    );
  }
}

// Sliver Persistent Header Delegate for CategoriesTabBar
class _CategoriesTabBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double height;

  _CategoriesTabBarDelegate({required this.child, required this.height});

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return SizedBox(height: height, child: child);
  }

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(covariant _CategoriesTabBarDelegate oldDelegate) {
    return oldDelegate.height != height || oldDelegate.child != child;
  }
}
