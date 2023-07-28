import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:expo_kg/features/cart/data/models/cart_item_model.dart';
import 'package:expo_kg/shared/constants/hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(const CartState([]));
  load() {
    List<CartItemModel> cartsList = [];
    final cartBox = Hive.box(
      HiveConstants.cartBox,
    );
    for (var element in cartBox.values) {
      cartsList.add(element);
    }
    emit(
      CartState(
        cartsList,
      ),
    );
  }

  addToCart(CartItemModel cartItem) {
    final cartBox = Hive.box(
      HiveConstants.cartBox,
    );
    cartBox.add(cartItem);
    emit(
      CartState(
        [
          ...super.state.cartItems,
          cartItem,
        ],
      ),
    );
  }

  removeFromCart(String id) {
    List<CartItemModel> cartsList = [...super.state.cartItems];

    try {
      cartsList.firstWhere((element) => element.productId == id).delete();
    } catch (e) {
      log("Coudn't remove from cart: $e");
    }
    cartsList.removeWhere(
      (element) => element.productId == id,
    );
    cartsList.removeWhere(
      (element) => element.productId == id,
    );
    emit(
      CartState(
        cartsList,
      ),
    );
  }

  bool isOnCart(String id) {
    return super.state.cartItems.any(
          (element) => element.productId == id,
        );
  }

  int getAmount(String id) {
    return super
        .state
        .cartItems
        .firstWhere(
          (element) => element.productId == id,
        )
        .amount;
  }

  clear() {
    final cartBox = Hive.box(
      HiveConstants.cartBox,
    );
    cartBox.clear();
    emit(
      const CartState(
        [],
      ),
    );
  }
}
