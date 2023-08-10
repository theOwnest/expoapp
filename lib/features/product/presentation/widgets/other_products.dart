import 'package:auto_size_text/auto_size_text.dart';
import 'package:expo_kg/shared/constants/sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:expo_kg/features/home/data/models/product.dart';
import 'package:expo_kg/features/home/presentation/widgets/product_grid_container.dart';
import 'package:expo_kg/shared/configs/texts.dart';
import 'package:expo_kg/shared/constants/colors.dart';

class ProductOtherProducts extends StatelessWidget {
  const ProductOtherProducts({
    Key? key,
    required this.title,
    required this.products,
  }) : super(key: key);
  final String title;
  final List<ProductModel> products;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        sizedbox20,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: AutoSizeText(
                title,
                style: h18,
                maxLines: 1,
                minFontSize: 12,
              ),
            ),
            sizedboxH10,
            Text(
              'Смотреть все (36)',
              style: st12.copyWith(
                color: AppColor.orange,
              ),
            ),
          ],
        ),
        sizedbox10,
        LimitedBox(
          maxHeight: 250,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => ProductGridContainer(
              product: products[index],
            ),
            separatorBuilder: (context, index) => const SizedBox(
              width: 6,
            ),
            itemCount: products.length,
          ),
        ),
        sizedbox10,
      ],
    );
  }
}
