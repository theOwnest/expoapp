part of 'product_cubit.dart';

class ProductState extends Equatable {
  const ProductState(
    this.products,
  );
  final List<ProductModel> products;
  @override
  List<Object> get props => [products];
}
