import 'package:expo_kg/features/home/data/models/product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductController extends Cubit<ProductModel> {
  ProductController(ProductModel product)
      : super(
          product,
        );
}
