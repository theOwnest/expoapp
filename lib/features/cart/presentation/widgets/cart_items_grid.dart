// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:expo_kg/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:expo_kg/features/cart/presentation/widgets/cart_item_grid_container.dart';
import 'package:expo_kg/features/cart/presentation/widgets/cart_item_list_container.dart';
import 'package:expo_kg/features/home/data/models/product.dart';
import 'package:expo_kg/features/product/data/enums/list_grid_type.dart';
import 'package:expo_kg/features/product/presentation/cubit/list_grid_type.dart';
import 'package:expo_kg/shared/constants/margin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartItemsGridContainer extends StatelessWidget {
  const CartItemsGridContainer({
    Key? key,
    required this.products,
  }) : super(key: key);
  final List<ProductModel> products;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListGridType, ListGridEnum>(
      builder: (context, state) {
        final isGrid = state == ListGridEnum.grid;
        return Expanded(
          child: GridView.builder(
            padding: marginH,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isGrid ? 2 : 1,
              childAspectRatio: isGrid ? 168 / 254 : 345 / 135,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) => isGrid
                ? CartItemGridContainer(
                    product: products[index],
                    amount: context.read<CartCubit>().getAmount(
                          products[index].id,
                        ),
                  )
                : CartItemListContainer(
                    product: products[index],
                    amount: context.read<CartCubit>().getAmount(
                          products[index].id,
                        ),
                  ),
            itemCount: products.length,
          ),
        );
      },
    );
  }
}
