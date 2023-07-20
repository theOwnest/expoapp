import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:expo_kg/features/home/data/datasources/categories.dart';
import 'package:expo_kg/shared/configs/texts.dart';
import 'package:expo_kg/shared/constants/border_radius.dart';
import 'package:expo_kg/shared/constants/colors.dart';
import 'package:expo_kg/shared/constants/margin.dart';

class HomePopularCategories extends StatelessWidget {
  const HomePopularCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: marginHV10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Пупулярные категории',
                style: h18,
              ),
              Text(
                'Смотреть все (36)',
                style: st12.copyWith(
                  color: AppColor.orange,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 75.h,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => HomePopularCategoryContainer(
              category: categoryList[index],
            ),
            separatorBuilder: (context, index) => const SizedBox(
              width: 10,
            ),
            itemCount: categoryList.length,
          ),
        )
      ],
    );
  }
}

class HomePopularCategoryContainer extends StatelessWidget {
  const HomePopularCategoryContainer({
    Key? key,
    required this.category,
  }) : super(key: key);
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      decoration: BoxDecoration(
        color: AppColor.green.withOpacity(
          0.2,
        ),
        borderRadius: borderR10,
        border: Border.all(
          color: AppColor.green,
          width: 1,
        ),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 5,
      ),
      child: Column(
        children: [
          Expanded(
            child: Image.asset(
              'assets/debug/category/${category.image}.png',
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            category.name,
            style: st12,
          ),
        ],
      ),
    );
  }
}
