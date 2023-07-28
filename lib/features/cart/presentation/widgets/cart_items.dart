import 'package:expo_kg/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:expo_kg/features/cart/presentation/widgets/cart_items_grid.dart';
import 'package:expo_kg/features/home/presentation/cubit/product_cubit.dart';
import 'package:expo_kg/features/product/data/enums/list_grid_type.dart';
import 'package:expo_kg/features/product/presentation/cubit/list_grid_type.dart';
import 'package:expo_kg/shared/configs/texts.dart';
import 'package:expo_kg/shared/constants/margin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartItemsGrid extends StatelessWidget {
  const CartItemsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ListGridType(),
      child: Builder(builder: (context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: marginH,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Доставка с 5 ноября',
                    style: st14,
                  ),
                  BlocBuilder<ListGridType, ListGridEnum>(
                    builder: (context, state) {
                      return GestureDetector(
                        onTap: () {
                          context.read<ListGridType>().change();
                        },
                        child: Image.asset(
                          'assets/icons/product/${state.name}.png',
                          height: state == ListGridEnum.grid ? 20 : 15,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            BlocBuilder<CartCubit, CartState>(
              builder: (context, state) {
                final products = context
                    .watch<ProductCubit>()
                    .state
                    .products
                    .where(
                      (product) => state.cartItems.any(
                        (element) => product.id == element.productId,
                      ),
                    )
                    .toList();
                return CartItemsGridContainer(
                  products: products,
                );
              },
            ),
          ],
        );
      }),
    );
  }
}
