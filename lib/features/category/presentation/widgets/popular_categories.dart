import 'package:expo_kg/features/category/data/datasources/container_colors.dart';
import 'package:expo_kg/features/home/data/datasources/categories.dart';
import 'package:expo_kg/shared/configs/random.dart';
import 'package:expo_kg/shared/configs/texts.dart';
import 'package:expo_kg/shared/constants/border_radius.dart';
import 'package:expo_kg/shared/constants/margin.dart';
import 'package:flutter/material.dart';

class PopularCategories extends StatelessWidget {
  const PopularCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: marginH,
          child: Text(
            'Популярные категории',
            style: h18,
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
              final color = containerColors[random.nextInt(
                containerColors.length,
              )];
              return Container(
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
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
              width: 10,
            ),
            itemCount: categoryList.length,
          ),
        ),
      ],
    );
  }
}
