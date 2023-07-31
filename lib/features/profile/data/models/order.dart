import 'package:expo_kg/features/home/data/models/product.dart';
import 'package:expo_kg/features/profile/data/enums/order_status.dart';

class OrderModel {
  final String id;
  final String address;
  final OrderStatus status;
  final DateTime createdAt;
  final List<ProductModel> products;
  OrderModel({
    required this.id,
    required this.address,
    required this.status,
    required this.createdAt,
    required this.products,
  });
}
