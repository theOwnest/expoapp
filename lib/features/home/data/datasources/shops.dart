import 'package:expo_kg/features/home/data/models/shop.dart';
import 'package:expo_kg/shared/configs/random.dart';

final shopsList = List.generate(
  10,
  (index) => ShopModel(
    id: uuid.v1(),
    name: 'ИП “Солнышко”',
    phoneNumber: '+7 (123) 456 78 90',
    rating: random.nextDouble() * 5,
  ),
);
