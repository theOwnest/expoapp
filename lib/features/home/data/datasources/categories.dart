import 'package:expo_kg/shared/configs/random.dart';

class CategoryModel {
  final String id;
  final String name;
  final String image;
  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
  });
}

final categoryList = [
  CategoryModel(
    id: uuid.v1(),
    name: 'Продукты',
    image: '1',
  ),
  CategoryModel(
    id: uuid.v1(),
    name: 'Техника',
    image: '2',
  ),
  CategoryModel(
    id: uuid.v1(),
    name: 'Спорт',
    image: '3',
  ),
  CategoryModel(
    name: 'Красотка',
    image: '4',
    id: uuid.v1(),
  ),
  CategoryModel(
    id: uuid.v1(),
    name: 'Мебель',
    image: '5',
  ),
  CategoryModel(
    id: uuid.v1(),
    name: 'Строительство и ремонт',
    image: '6',
  ),
  CategoryModel(
    id: uuid.v1(),
    name: 'Электроника',
    image: '7',
  ),
  CategoryModel(
    id: uuid.v1(),
    name: 'Аптечка',
    image: '8',
  ),
  CategoryModel(
    id: uuid.v1(),
    name: 'Книги',
    image: '9',
  ),
];
