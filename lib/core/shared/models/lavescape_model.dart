class LavescapeModel {
  final List<String> imageUrls;
  final String title;
  final String location;
  final double price;
  final double rating;
  final bool isGuestFavorite;
  final bool isWishlisted;
  final double latitude;
  final double longitude;

 const LavescapeModel({
    required this.imageUrls,
    required this.title,
    required this.location,
    required this.price,
    required this.rating,
    required this.isGuestFavorite,
    required this.isWishlisted,
    required this.latitude,
    required this.longitude,
  });
}