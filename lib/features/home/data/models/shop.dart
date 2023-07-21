class ShopModel {
  final String id;
  final String name;
  final String phoneNumber;
  final double rating;
  final String? image;
  ShopModel({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.rating,
    this.image,
  });
}
