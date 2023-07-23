import 'package:expo_kg/features/home/data/models/product.dart';

List<ProductModel> searchProduct(
    String? query, List<ProductModel> allProducts) {
  if (query == null) return [];
  List<ProductModel> products = [];
  products.addAll(
    allProducts.where(
      (element) =>
          element.name.toLowerCase().contains(
                query.toLowerCase(),
              ) &&
          !products.contains(element),
    ),
  );
  products.addAll(
    allProducts.where(
      (element) =>
          element.description.toLowerCase().contains(
                query.toLowerCase(),
              ) &&
          !products.contains(element),
    ),
  );
  products.addAll(
    allProducts.where(
      (element) =>
          element.shop.name.toLowerCase().contains(
                query.toLowerCase(),
              ) &&
          !products.contains(element),
    ),
  );
  return products;
}
