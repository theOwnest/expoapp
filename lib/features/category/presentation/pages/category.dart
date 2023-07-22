import 'package:expo_kg/features/category/presentation/widgets/category_ads.dart';
import 'package:expo_kg/features/category/presentation/widgets/popular_categories.dart';
import 'package:expo_kg/features/home/data/datasources/categories.dart';
import 'package:expo_kg/features/home/presentation/widgets/popular_categories.dart';
import 'package:expo_kg/shared/configs/texts.dart';
import 'package:expo_kg/shared/constants/margin.dart';
import 'package:expo_kg/shared/widgets/appbar_title.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AppbarTitle(
          title: 'Каталог товаров',
        ),
        Expanded(
          child: CustomScrollView(
            slivers: [
              const SliverPadding(
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                ),
                sliver: SliverToBoxAdapter(
                  child: CategoryAds(),
                ),
              ),
              const SliverToBoxAdapter(
                child: PopularCategories(),
              ),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: marginHV10,
                  child: Text(
                    'Все категории',
                    style: h18,
                  ),
                ),
              ),
              SliverPadding(
                padding: marginH,
                sliver: SliverGrid.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) => HomePopularCategoryContainer(
                    category: categoryList[index],
                  ),
                  itemCount: categoryList.length,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
