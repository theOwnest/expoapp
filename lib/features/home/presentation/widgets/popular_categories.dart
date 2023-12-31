import 'package:auto_size_text/auto_size_text.dart';
import 'package:expo_kg/features/category/data/datasources/container_colors.dart';
import 'package:expo_kg/features/home/presentation/cubit/product_cubit.dart';
import 'package:expo_kg/shared/configs/random.dart';
import 'package:expo_kg/shared/configs/routes.dart';
import 'package:expo_kg/shared/constants/border.dart';
import 'package:expo_kg/shared/constants/sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:expo_kg/features/home/data/datasources/categories.dart';
import 'package:expo_kg/shared/configs/texts.dart';
import 'package:expo_kg/shared/constants/border_radius.dart';
import 'package:expo_kg/shared/constants/colors.dart';
import 'package:expo_kg/shared/constants/margin.dart';
import 'package:go_router/go_router.dart';

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
              const Expanded(
                child: AutoSizeText(
                  'Популярные категории',
                  style: h18,
                  maxLines: 1,
                  minFontSize: 12,
                ),
              ),
              sizedboxH10,
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  context.pushNamed(
                    RoutesNames.category,
                  );
                },
                child: Text(
                  'Смотреть все (36)',
                  style: st12.copyWith(
                    color: AppColor.orange,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 75.w,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => HomePopularCategoryContainer(
              category: categoryList[index],
            ),
            separatorBuilder: (context, index) => sizedboxH10,
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
    final color = containerColors[random.nextInt(
      containerColors.length,
    )];
    return GestureDetector(
      onTap: () {
        context.pushNamed(
          RoutesNames.subcategory,
          queryParameters: {
            'category': category.id,
          },
          extra: BlocProvider.of<ProductCubit>(context),
        );
      },
      child: Container(
        width: 100.w,
        decoration: BoxDecoration(
          color: color.withOpacity(
            0.2,
          ),
          borderRadius: borderR10,
          border: commonThinBorder,
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
            sizedbox5,
            Text(
              category.name,
              style: st12,
            ),
          ],
        ),
      ),
    );
  }
}
