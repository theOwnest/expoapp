import 'package:hive/hive.dart';

part 'cart_item_model.g.dart';

@HiveType(typeId: 0)
class CartItemModel extends HiveObject {
  @HiveField(0)
  final String productId;
  @HiveField(1)
  final int amount;
  CartItemModel({
    required this.productId,
    required this.amount,
  });
}
