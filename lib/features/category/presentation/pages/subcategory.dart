import 'package:expo_kg/features/category/data/datasources/subcategories.dart';
import 'package:expo_kg/features/home/presentation/widgets/search_products.dart';
import 'package:expo_kg/shared/configs/routes.dart';
import 'package:expo_kg/shared/configs/texts.dart';
import 'package:expo_kg/shared/constants/colors.dart';
import 'package:expo_kg/shared/constants/divider.dart';
import 'package:expo_kg/shared/constants/margin.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SubcategoryPage extends StatelessWidget {
  const SubcategoryPage({
    Key? key,
    required this.category,
  }) : super(key: key);
  final String category;
  @override
  Widget build(BuildContext context) {
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
              const SizedBox(
                width: 15,
              ),
            ],
          ),
        ),
        Padding(
          padding: marginH,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                category,
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
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) => Padding(
              padding: marginH,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        subcategoryList[index],
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
            itemCount: subcategoryList.length,
          ),
        ),
      ],
    );
  }
}
