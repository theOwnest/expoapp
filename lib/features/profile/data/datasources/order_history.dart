import 'dart:math';

import 'package:collection/collection.dart';
import 'package:expo_kg/features/home/data/datasources/products.dart';
import 'package:expo_kg/features/profile/data/enums/order_status.dart';
import 'package:expo_kg/features/profile/data/models/order.dart';
import 'package:expo_kg/shared/configs/random.dart';

final orderHistoryList = List.generate(
  random.nextInt(10),
  (index) => OrderModel(
    id: uuid.v1(),
    address: 'Доставка в пункт выдачи',
    status: OrderStatus.values.elementAt(
      Random().nextInt(OrderStatus.values.length),
    ),
    createdAt: DateTime.now().subtract(
      Duration(
        days: random.nextInt(20),
      ),
    ),
    products: productsList.sample(
      random.nextInt(
        productsList.length,
      ),
    ),
  ),
);
