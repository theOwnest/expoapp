import 'package:expo_kg/features/home/data/datasources/shops.dart';
import 'package:expo_kg/features/home/data/models/product.dart';
import 'package:expo_kg/shared/configs/random.dart';

final productsList = List.generate(
  10,
  (index) => ProductModel(
    id: uuid.v1(),
    image: 'assets/debug/headphone.png',
    price: random.nextInt(1000),
    name: 'Наушники беспроводные Wireless',
    rating: random.nextDouble() * 5,
    description:
        'НLorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. ',
    shop: shopsList[random.nextInt(
      shopsList.length,
    )],
  ),
);
