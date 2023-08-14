// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:expo_kg/features/category/presentation/widgets/popular_categories.dart';
import 'package:expo_kg/features/home/data/datasources/categories.dart';
import 'package:expo_kg/features/home/presentation/widgets/search_products.dart';
import 'package:expo_kg/features/search/data/datasources/filter_constants.dart';
import 'package:expo_kg/features/search/data/utils/filter_bottomsheet.dart';
import 'package:expo_kg/features/search/presentation/cubit/filter_cubit.dart';
import 'package:expo_kg/features/search/presentation/cubit/search_history_cubit.dart';
import 'package:expo_kg/features/search/presentation/widgets/popular.dart';
import 'package:expo_kg/features/search/presentation/widgets/search_history.dart';
import 'package:expo_kg/features/search/presentation/widgets/search_results.dart';
import 'package:expo_kg/shared/constants/size.dart';
import 'package:expo_kg/shared/constants/sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({
    Key? key,
    required this.filterState,
  }) : super(key: key);
  final Map<String, String> filterState;
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SearchHistoryCubit()..loadHistory(),
        ),
        BlocProvider(
          create: (context) => FilterCubit(
            widget.filterState,
          ),
        ),
      ],
      child: Builder(builder: (context) {
        return KeyboardDismisser(
          behavior: HitTestBehavior.opaque,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: AppSize.scaffoldTopMargin,
              ),
              Row(
                children: [
                  Expanded(
                    child: HomeProductSearchbar(
                      isSearchPage: true,
                      controller: controller,
                      function: (String query) {
                        log(query);
                        context.read<FilterCubit>().addFilter(search: query);
                      },
                    ),
                  ),
                  BlocBuilder<FilterCubit, Map<String, String>>(
                    builder: (context, state) {
                      return state[FilterConstants.search] != null
                          ? Row(
                              children: [
                                GestureDetector(
                                  behavior: HitTestBehavior.opaque,
                                  onTap: () {
                                    showFilterBottomSheet(context);
                                  },
                                  child: Image.asset(
                                    'assets/icons/home/filter.png',
                                    width: 24,
                                  ),
                                ),
                                sizedboxH15,
                              ],
                            )
                          : const SizedBox.shrink();
                    },
                  ),
                ],
              ),
              BlocBuilder<FilterCubit, Map<String, String>>(
                builder: (context, state) {
                  if (state.isEmpty) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SearchHistoryContainer(
                          controller: controller,
                        ),
                        const SearchPopularContainer(),
                      ],
                    );
                  }
                  return Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        sizedbox15,
                        Builder(builder: (context) {
                          final title = context
                                  .read<FilterCubit>()
                                  .state[FilterConstants.search] ??
                              categoryList
                                  .firstWhere(
                                    (element) =>
                                        element.id ==
                                        context
                                            .read<FilterCubit>()
                                            .state[FilterConstants.category],
                                  )
                                  .name;
                          return PopularCategories(
                            title: 'Найдено 67 товаров в категории $title',
                          );
                        }),
                        const SearchResults(),
                      ],
                    ),
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
