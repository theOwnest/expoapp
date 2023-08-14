import 'package:expo_kg/features/home/data/models/product.dart';
import 'package:expo_kg/features/search/data/datasources/filter_constants.dart';

List<ProductModel> filterProduct(
    Map<String, String> filter, List<ProductModel> allProducts) {
  if (filter.isEmpty) return allProducts;
  List<ProductModel> products = [];
  //filter category
  final category = filter[FilterConstants.category];
  products.addAll(
    allProducts.where(
      (element) => element.category.id == category,
    ),
  );
  return products;
}
