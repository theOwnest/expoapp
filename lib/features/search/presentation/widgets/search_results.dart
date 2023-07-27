import 'package:expo_kg/features/home/presentation/cubit/product_cubit.dart';
import 'package:expo_kg/features/product/data/enums/list_grid_type.dart';
import 'package:expo_kg/features/product/presentation/cubit/list_grid_type.dart';
import 'package:expo_kg/features/search/data/utils/search.dart';
import 'package:expo_kg/features/search/presentation/cubit/search_cubit.dart';
import 'package:expo_kg/features/search/presentation/widgets/search_results_grid.dart';
import 'package:expo_kg/shared/configs/texts.dart';
import 'package:expo_kg/shared/constants/margin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResults extends StatelessWidget {
  const SearchResults({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ListGridType(),
      child: Builder(builder: (context) {
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
              BlocBuilder<ProductCubit, ProductState>(
                builder: (context, state) {
                  final products = searchProduct(
                    context.read<SearchCubit>().state,
                    state.products,
                  );
                  return SearchResultsGrid(
                    products: products,
                  );
                },
              ),
            ],
          ),
        );
      }),
    );
  }
}