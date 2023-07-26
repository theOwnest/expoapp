import 'dart:developer';
import 'package:expo_kg/features/category/presentation/widgets/popular_categories.dart';
import 'package:expo_kg/features/home/presentation/widgets/search_products.dart';
import 'package:expo_kg/features/search/data/utils/filter_bottomsheet.dart';
import 'package:expo_kg/features/search/presentation/cubit/search_cubit.dart';
import 'package:expo_kg/features/search/presentation/cubit/search_history_cubit.dart';
import 'package:expo_kg/features/search/presentation/widgets/popular.dart';
import 'package:expo_kg/features/search/presentation/widgets/search_history.dart';
import 'package:expo_kg/features/search/presentation/widgets/search_results.dart';
import 'package:expo_kg/shared/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({
    Key? key,
  }) : super(key: key);

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
          create: (context) => SearchCubit(),
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
                        context.read<SearchCubit>().addQuery(query);
                      },
                    ),
                  ),
                  BlocBuilder<SearchCubit, String?>(
                    builder: (context, state) {
                      return state != null
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
                                const SizedBox(
                                  width: 15,
                                ),
                              ],
                            )
                          : const SizedBox.shrink();
                    },
                  ),
                ],
              ),
              BlocBuilder<SearchCubit, String?>(
                builder: (context, state) {
                  if (state == null) {
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
                  return const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        PopularCategories(),
                        SizedBox(
                          height: 10,
                        ),
                        SearchResults(),
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
