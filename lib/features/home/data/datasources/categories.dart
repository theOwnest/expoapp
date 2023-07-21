class CategoryModel {
  final String name;
  final String image;
  CategoryModel({
    required this.name,
    required this.image,
  });
}

final categoryList = [
  CategoryModel(
    name: 'Продукты',
    image: '1',
  ),
  CategoryModel(
    name: 'Техника',
    image: '2',
  ),
  CategoryModel(
    name: 'Спорт',
    image: '3',
  ),
  CategoryModel(
    name: 'Красотка',
    image: '4',
  ),
  CategoryModel(
    name: 'Мебель',
    image: '5',
  ),
  CategoryModel(
    name: 'Строительство и ремонт',
    image: '6',
  ),
  CategoryModel(
    name: 'Электроника',
    image: '7',
  ),
  CategoryModel(
    name: 'Аптечка',
    image: '8',
  ),
  CategoryModel(
    name: 'Книги',
    image: '9',
  ),
];
