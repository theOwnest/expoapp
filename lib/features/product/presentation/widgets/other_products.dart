import 'package:animations/animations.dart';
import 'package:expo_kg/features/home/presentation/cubit/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:expo_kg/features/home/data/models/product.dart';
import 'package:expo_kg/features/home/presentation/widgets/product_container.dart';
import 'package:expo_kg/shared/configs/texts.dart';
import 'package:expo_kg/shared/constants/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../pages/product.dart';

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
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
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
        const SizedBox(
          height: 10,
        ),
        LimitedBox(
          maxHeight: 250,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => OpenContainer(
              openBuilder: (context, action) => BlocProvider.value(
                value: BlocProvider.of<ProductCubit>(context),
                child: ProductPage(
                  product: products[index],
                ),
              ),
              closedBuilder: (context, action) => ProductContainer(
                product: products[index],
              ),
            ),
            separatorBuilder: (context, index) => const SizedBox(
              width: 6,
            ),
            itemCount: products.length,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
