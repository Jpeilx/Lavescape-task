import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lavescape/core/constant/app_assets.dart';
import 'package:lavescape/core/shared/core_widgets/app_elevated_button.dart';
import 'package:lavescape/core/shared/models/lavescape_model.dart';
import 'package:lavescape/core/utils/colors/app_colors.dart';
import 'package:lavescape/core/utils/styles/font_manager.dart';
import 'package:lavescape/features/search_result/logic/search_result_cubit/search_result_cubit.dart';
import 'package:lavescape/features/search_result/views/widgets/search_result_custom_app_bar.dart';
import 'package:lavescape/features/search_result/views/widgets/search_result_listview_widget.dart';
import 'package:lavescape/features/search_result/views/widgets/search_result_map_widget.dart';

class SearchResultScreen extends StatelessWidget {
 final  String categoryName ;
 final  String  city ; 
 final  String  data ; 
 final  String  numberOfAdults; 
  const SearchResultScreen({super.key , required this.categoryName, required this.city, required this.data, required this.numberOfAdults });

  // Shared dummy data for both list and map views
  static const List<LavescapeModel> _dummyData = [
    LavescapeModel(
      imageUrls: [
        'https://media.istockphoto.com/id/1145064928/photo/tourist-riding-camel-in-desert.jpg?s=612x612&w=0&k=20&c=zZpS5SxgBNFhI5kb-oBnf2CL4RyBcRKgCGrImtKs7dw=',
        'https://images.unsplash.com/photo-1512632578888-169bbbc64f33?w=800',
        'https://images.unsplash.com/photo-1570939274717-7eda259b50ed?w=800',
      ],
      title: 'Desert Camel Adventure',
      location: 'Riyadh, Saudi Arabia',
      price: 152,
      rating: 4.81,
      isGuestFavorite: true,
      isWishlisted: false,
      latitude: 24.774265,
      longitude: 46.738586,
    ),
    LavescapeModel(
      imageUrls: [
        'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=800',
      ],
      title: 'Traditional Saudi Experience',
      location: 'Riyadh, Saudi Arabia',
      price: 152,
      rating: 4.92,
      isWishlisted: false,
      isGuestFavorite: true,
      latitude: 24.770265,
      longitude: 46.730586,
    ),
    LavescapeModel(
      imageUrls: [
        'https://images.unsplash.com/photo-1512632578888-169bbbc64f33?w=800',
      ],
      title: 'Historic Riyadh Tour',
      location: 'Riyadh, Saudi Arabia',
      price: 152,
      rating: 4.88,
      isWishlisted: false,
      isGuestFavorite: false,
      latitude: 24.768265,
      longitude: 46.743586,
    ),
    LavescapeModel(
      imageUrls: [
        'https://images.unsplash.com/photo-1580674684081-7617fbf3d745?w=800',
      ],
      title: 'Luxury Desert Resort',
      location: 'Riyadh, Saudi Arabia',
      price: 152,
      rating: 4.96,
      isWishlisted: true,
      isGuestFavorite: true,
      latitude: 24.779265,
      longitude: 46.735586,
    ),
    LavescapeModel(
      imageUrls: [
        'https://images.unsplash.com/photo-1549144511-f099e773c147?w=800',
      ],
      title: 'Cultural Heritage Visit',
      location: 'Riyadh, Saudi Arabia',
      price: 152,
      rating: 4.85,
      isWishlisted: false,
      isGuestFavorite: false,
      latitude: 24.771265,
      longitude: 46.752586,
    ),
    LavescapeModel(
      imageUrls: [
        'https://media.istockphoto.com/id/1145064928/photo/tourist-riding-camel-in-desert.jpg?s=612x612&w=0&k=20&c=zZpS5SxgBNFhI5kb-oBnf2CL4RyBcRKgCGrImtKs7dw=',
      ],
      title: 'Arabian Nights Experience',
      location: 'Riyadh, Saudi Arabia',
      price: 152,
      rating: 4.90,
      isWishlisted: false,
      isGuestFavorite: true,
      latitude: 24.782265,
      longitude: 46.725586,
    ),
    LavescapeModel(
      imageUrls: [
        'https://images.unsplash.com/photo-1570939274717-7eda259b50ed?w=800',
      ],
      title: 'Modern Riyadh Adventure',
      location: 'Riyadh, Saudi Arabia',
      price: 152,
      rating: 4.87,
      isWishlisted: true,
      isGuestFavorite: false,
      latitude: 24.776265,
      longitude: 46.740586,
    ),
    LavescapeModel(
      imageUrls: [
        'https://images.unsplash.com/photo-1464822759023-fed622ff2c3b?w=800',
      ],
      title: 'Sunset Desert Safari',
      location: 'Riyadh, Saudi Arabia',
      price: 152,
      rating: 4.93,
      isWishlisted: false,
      isGuestFavorite: true,
      latitude: 24.767265,
      longitude: 46.728586,
    ),
    LavescapeModel(
      imageUrls: [
        'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=800',
      ],
      title: 'Authentic Saudi Cuisine Tour',
      location: 'Riyadh, Saudi Arabia',
      price: 152,
      rating: 4.89,
      isWishlisted: false,
      isGuestFavorite: false,
      latitude: 24.773265,
      longitude: 46.746586,
    ),
    LavescapeModel(
      imageUrls: [
        'https://images.unsplash.com/photo-1512632578888-169bbbc64f33?w=800',
      ],
      title: 'Royal Palace Tour',
      location: 'Riyadh, Saudi Arabia',
      price: 152,
      rating: 4.94,
      isWishlisted: true,
      isGuestFavorite: true,
      latitude: 24.780265,
      longitude: 46.733586,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchResultCubit(),
      child: Scaffold(
        appBar: SearchResultCustomAppBar(categoryName: categoryName, city: city, data: data, numberOfAdults: numberOfAdults),
        body: BlocBuilder<SearchResultCubit, SearchResultStates>(
          buildWhen: (previous, current) => current is ShowOrHideMapViewState,
          builder: (context, state) {
            return SearchResultCubit.get(context).showMapView == true
                ? SearchResultMapWidget(lavescapeData: _dummyData)
                : SearchResultListViewWidget(lavescapeData: _dummyData);
          },
        ),

        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: SizedBox(
          width: 100.w,
          child: BlocBuilder<SearchResultCubit, SearchResultStates>(
            buildWhen: (previous, current) => current is ShowOrHideMapViewState,
            builder: (context, state) {
              return AppElevatedButton(
                title: SearchResultCubit.get(context).showMapView == true
                    ? "List View"
                    : 'Map View',
                onPressed: () {
                  SearchResultCubit.get(context).showOrHideMapView();
                },
                background: AppColors.kPrimaryColor,
                titleColor: AppColors.kWhiteColor,
                marginStart: 8,
                width: 100.w,
                height: 32.h,
                fontSize: FontSize.s14,
                iconStart: true,
                iconPath: SearchResultCubit.get(context).showMapView == true
                    ? AssetsData.listIcon
                    : AssetsData.mapIcon,
              );
            },
          ),
        ),
      ),
    );
  }
}
