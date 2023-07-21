import 'package:equatable/equatable.dart';
import 'package:expo_kg/features/home/data/datasources/products.dart';
import 'package:expo_kg/features/home/data/models/product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit()
      : super(
          const ProductState(
            [],
          ),
        );
  load() async {
    emit(
      ProductState(
        [
          ...productsList,
        ],
      ),
    );
  }

  ProductModel getById(String id) {
    return state.products.firstWhere(
      (element) => element.id == id,
    );
  }
}
