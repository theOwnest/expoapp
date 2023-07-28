// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'cart_cubit.dart';

class CartState extends Equatable {
  const CartState(
    this.cartItems,
  );
  final List<CartItemModel> cartItems;
  @override
  List<Object> get props => [
        cartItems,
      ];
}
