// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:expo_kg/features/category/data/datasources/container_colors.dart';
import 'package:expo_kg/features/home/data/datasources/categories.dart';
import 'package:expo_kg/features/search/presentation/cubit/filter_cubit.dart';
import 'package:expo_kg/shared/configs/texts.dart';
import 'package:expo_kg/shared/constants/border_radius.dart';
import 'package:expo_kg/shared/constants/margin.dart';
import 'package:expo_kg/shared/constants/sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PopularCategories extends StatelessWidget {
  const PopularCategories({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 30,
          padding: marginH,
          child: AutoSizeText(
            title,
            style: h16,
            minFontSize: 14,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(
            vertical: 10,
          ),
          height: 40,
          child: ListView.separated(
            padding: marginH,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final color = containerColors[index % containerColors.length];
              return GestureDetector(
                onTap: () {
                  context.read<FilterCubit>().addFilter(
                        category: categoryList[index].id,
                      );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: color.withOpacity(
                      0.25,
                    ),
                    borderRadius: borderRC,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    categoryList[index].name,
                    style: st14.copyWith(
                      color: color,
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => sizedboxH10,
            itemCount: categoryList.length,
          ),
        ),
      ],
    );
  }
}
