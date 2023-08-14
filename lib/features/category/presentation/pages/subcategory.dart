import 'package:expo_kg/features/home/data/datasources/categories.dart';
import 'package:expo_kg/features/home/presentation/widgets/search_products.dart';
import 'package:expo_kg/shared/configs/routes.dart';
import 'package:expo_kg/shared/configs/texts.dart';
import 'package:expo_kg/shared/constants/colors.dart';
import 'package:expo_kg/shared/constants/divider.dart';
import 'package:expo_kg/shared/constants/margin.dart';
import 'package:expo_kg/shared/constants/sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SubcategoryPage extends StatelessWidget {
  const SubcategoryPage({
    Key? key,
    required this.categoryId,
  }) : super(key: key);
  final String categoryId;
  @override
  Widget build(BuildContext context) {
    final category = categoryList.firstWhere(
      (element) => element.id == categoryId,
    );
    return Column(
      children: [
        Padding(
          padding: marginV,
          child: Row(
            children: [
              const Expanded(
                child: HomeProductSearchbar(),
              ),
              Image.asset(
                'assets/icons/home/filter.png',
                height: 22,
              ),
              sizedboxH15,
            ],
          ),
        ),
        Padding(
          padding: marginH,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                category.name,
                style: h24,
              ),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  context.pushNamed(
                    RoutesNames.category,
                  );
                },
                child: Text(
                  'Все категории (36)',
                  style: st12.copyWith(
                    color: AppColor.orange,
                  ),
                ),
              ),
            ],
          ),
        ),
        sizedbox25,
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                context.pushNamed(
                  RoutesNames.search,
                  extra: {
                    'category': categoryList[index].id,
                  },
                );
              },
              child: Padding(
                padding: marginH,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          categoryList[index].name,
                          style: h14,
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                        ),
                      ],
                    ),
                    divider30,
                  ],
                ),
              ),
            ),
            itemCount: categoryList.length,
          ),
        ),
      ],
    );
  }
}
