import 'package:expo_kg/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:expo_kg/features/cart/presentation/widgets/cart_items.dart';
import 'package:expo_kg/features/home/presentation/widgets/address_dropdown.dart';
import 'package:expo_kg/shared/constants/margin.dart';
import 'package:expo_kg/shared/constants/size.dart';
import 'package:expo_kg/shared/widgets/dense_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HomeAddressDropDown(),
        Container(
          height: AppSize.customAppbarHeight,
          padding: marginH,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BlocBuilder<CartCubit, CartState>(
                builder: (context, state) {
                  return Text(
                    '${state.cartItems.length} товаров',
                  );
                },
              ),
              DenseTextButton(
                title: 'Отчистить все',
                isBold: false,
                function: () {
                  context.read<CartCubit>().clear();
                },
              ),
            ],
          ),
        ),
        const Expanded(
          child: CartItemsGrid(),
        ),
      ],
    );
  }
}
