import 'package:expo_kg/features/home/presentation/cubit/product_cubit.dart';
import 'package:expo_kg/features/home/presentation/widgets/product_container.dart';
import 'package:expo_kg/features/search/data/utils/search.dart';
import 'package:expo_kg/features/search/presentation/cubit/search_cubit.dart';
import 'package:expo_kg/shared/configs/texts.dart';
import 'package:expo_kg/shared/constants/margin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResults extends StatelessWidget {
  const SearchResults({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: marginH,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    Text(
                      'Сначала популярное',
                      style: h14,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.keyboard_arrow_down,
                    ),
                  ],
                ),
                Image.asset(
                  'assets/icons/product/grid.png',
                  height: 20,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          BlocBuilder<ProductCubit, ProductState>(
            builder: (context, state) {
              final products = searchProduct(
                context.read<SearchCubit>().state,
                state.products,
              );
              return Expanded(
                child: GridView.builder(
                  padding: marginH,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 168 / 254,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) => ProductContainer(
                    product: products[index],
                  ),
                  itemCount: products.length,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
