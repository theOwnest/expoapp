import 'package:expo_kg/features/cart/data/models/cart_item_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../constants/hive.dart';

initHive() async {
  await Hive.initFlutter();

  Hive.registerAdapter(
    CartItemModelAdapter(),
  );

  await Hive.openBox(HiveConstants.appBox);
  await Hive.openBox(HiveConstants.cartBox);
  await Hive.openBox(HiveConstants.favoriteBox);
  await Hive.openBox(HiveConstants.searchHistoryBox);
}
