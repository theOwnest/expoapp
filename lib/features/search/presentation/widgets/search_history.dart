// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:expo_kg/features/search/presentation/cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:expo_kg/features/search/presentation/cubit/search_history_cubit.dart';
import 'package:expo_kg/shared/configs/routes.dart';
import 'package:expo_kg/shared/configs/texts.dart';
import 'package:expo_kg/shared/constants/colors.dart';
import 'package:expo_kg/shared/constants/margin.dart';

class SearchHistoryContainer extends StatelessWidget {
  const SearchHistoryContainer({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: marginHV15,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'История поиска',
                style: h14,
              ),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  context.pushNamed(
                    RoutesNames.category,
                  );
                },
                child: Text(
                  'Отчистить',
                  style: st12.copyWith(
                    color: AppColor.orange,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: marginH,
          child: BlocBuilder<SearchHistoryCubit, List<String>>(
            builder: (context, state) {
              return ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    controller.text = state[state.length - index - 1];
                    context.read<SearchCubit>().addQuery(
                          state[state.length - index - 1],
                        );
                  },
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/icons/home/search-history.png',
                        width: 22,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        state[state.length - index - 1],
                        style: st14,
                      ),
                    ],
                  ),
                ),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 15,
                ),
                itemCount: state.length > 5 ? 5 : state.length,
              );
            },
          ),
        )
      ],
    );
  }
}
