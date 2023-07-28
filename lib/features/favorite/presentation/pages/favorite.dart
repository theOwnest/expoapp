import 'package:expo_kg/features/favorite/presentation/cubit/favorite_cubit.dart';
import 'package:expo_kg/shared/constants/size.dart';
import 'package:expo_kg/shared/widgets/dense_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/constants/margin.dart';
import '../../../home/presentation/cubit/product_cubit.dart';
import '../../../home/presentation/widgets/product_grid_container.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: AppSize.customAppbarHeight,
          padding: marginH,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BlocBuilder<FavoriteCubit, FavoriteState>(
                builder: (context, state) {
                  return Text(
                    '${state.favorites.length} товаров',
                  );
                },
              ),
              DenseTextButton(
                title: 'Отчистить все',
                isBold: false,
                function: () {
                  context.read<FavoriteCubit>().clear();
                },
              ),
            ],
          ),
        ),
        Expanded(
          child: BlocBuilder<ProductCubit, ProductState>(
            builder: (context, state) {
              final products = state.products
                  .where(
                    (element) => context.watch<FavoriteCubit>().isFavorite(
                          element.id,
                        ),
                  )
                  .toList();
              return GridView.builder(
                padding: marginH,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 168 / 254,
                ),
                itemBuilder: (context, index) => ProductGridContainer(
                  product: products[index],
                ),
                itemCount: products.length,
              );
            },
          ),
        ),
      ],
    );
  }
}
