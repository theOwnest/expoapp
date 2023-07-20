import 'package:expo_kg/features/home/presentation/widgets/ad_slider.dart';
import 'package:expo_kg/features/home/presentation/widgets/address_dropdown.dart';
import 'package:expo_kg/features/home/presentation/widgets/popular_categories.dart';
import 'package:expo_kg/features/home/presentation/widgets/products_grid.dart';
import 'package:expo_kg/features/home/presentation/widgets/search_products.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          HomeAddressDropDown(),
          HomeProductSearchbar(),
          HomeAdSlider(),
          HomePopularCategories(),
          HomeAdSlider(),
          HomeProductsGrid(),
        ],
      ),
    );
  }
}
