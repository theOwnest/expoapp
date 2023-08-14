// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:expo_kg/features/home/presentation/cubit/product_cubit.dart';
import 'package:expo_kg/features/product/data/enums/list_grid_type.dart';
import 'package:expo_kg/features/product/presentation/cubit/list_grid_type.dart';
import 'package:expo_kg/features/search/data/datasources/filter_constants.dart';
import 'package:expo_kg/features/search/data/utils/filter.dart';
import 'package:expo_kg/features/search/data/utils/search.dart';
import 'package:expo_kg/features/search/presentation/cubit/filter_cubit.dart';
import 'package:expo_kg/features/search/presentation/widgets/search_results_grid.dart';
import 'package:expo_kg/features/search/presentation/widgets/sort_dropdown.dart';
import 'package:expo_kg/shared/constants/margin.dart';
import 'package:expo_kg/shared/constants/sizedbox.dart';
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
                    const SortDropdown(),
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
              sizedbox5,
              BlocBuilder<FilterCubit, Map<String, String>>(
                builder: (context, state) {
                  return SearchUpdater(
                    query: state,
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

class SearchUpdater extends StatelessWidget {
  const SearchUpdater({
    Key? key,
    required this.query,
  }) : super(key: key);
  final Map<String, String> query;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        final searchedProducts = searchProduct(
          query[[FilterConstants.search]],
          state.products,
        );
        final products = filterProduct(
          query,
          searchedProducts,
        );
        return SearchResultsGrid(
          products: products,
        );
      },
    );
  }
}
