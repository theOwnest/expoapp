// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:expo_kg/features/home/data/models/shop.dart';

class ProductModel {
  final String id;
  final String image;
  final int price;
  final String name;
  final double rating;
  final String description;
  final ShopModel shop;
  ProductModel({
    required this.id,
    required this.image,
    required this.price,
    required this.name,
    required this.rating,
    required this.description,
    required this.shop,
  });
}
