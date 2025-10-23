import 'package:flutter/material.dart';
import 'package:lavescape/core/shared/models/lavescape_model.dart';
import 'package:lavescape/core/shared/ui_widgets/lavescape_card_view.dart/lavescape_card_view.dart';
import 'package:lavescape/core/utils/helper/spacing.dart';

class SearchResultListViewWidget extends StatelessWidget {
  const SearchResultListViewWidget({super.key});
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
        'https://images.unsplash.com/photo-1464822759023-fed622ff2c3b?w=800',
      ],
      title: 'Mountain Hiking Experience',
      location: 'Swiss Alps, Switzerland',
      price: 152,
      rating: 4.95,
      isWishlisted: true,
      isGuestFavorite: false,
      latitude: 24.783265,
      longitude: 46.748586,
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
    LavescapeModel(
      imageUrls: [
        'https://images.unsplash.com/photo-1580674684081-7617fbf3d745?w=800',
      ],
      title: 'Bedouin Camp Experience',
      location: 'Riyadh, Saudi Arabia',
      price: 152,
      rating: 4.91,
      isWishlisted: false,
      isGuestFavorite: false,
      latitude: 24.769265,
      longitude: 46.737586,
    ),
    LavescapeModel(
      imageUrls: [
        'https://images.unsplash.com/photo-1549144511-f099e773c147?w=800',
      ],
      title: 'Falcon Training Experience',
      location: 'Riyadh, Saudi Arabia',
      price: 152,
      rating: 4.86,
      isWishlisted: false,
      isGuestFavorite: true,
      latitude: 24.777265,
      longitude: 46.742586,
    ),
    LavescapeModel(
      imageUrls: [
        'https://media.istockphoto.com/id/1145064928/photo/tourist-riding-camel-in-desert.jpg?s=612x612&w=0&k=20&c=zZpS5SxgBNFhI5kb-oBnf2CL4RyBcRKgCGrImtKs7dw=',
      ],
      title: 'Historic Diriyah Visit',
      location: 'Riyadh, Saudi Arabia',
      price: 152,
      rating: 4.97,
      isWishlisted: true,
      isGuestFavorite: true,
      latitude: 24.775265,
      longitude: 46.749586,
    ),
    LavescapeModel(
      imageUrls: [
        'https://images.unsplash.com/photo-1570939274717-7eda259b50ed?w=800',
      ],
      title: 'Luxury Shopping Experience',
      location: 'Riyadh, Saudi Arabia',
      price: 152,
      rating: 4.84,
      isWishlisted: false,
      isGuestFavorite: false,
      latitude: 24.772265,
      longitude: 46.727586,
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return ListView.separated( itemBuilder: (context, index) {
          return LavescapeCardView(lavescapeData: laveScapeDummyData[index],);
          
        },
        itemCount: laveScapeDummyData.length,
        separatorBuilder: (context, index) => verticalSpace(10),
        
        );
  }
}