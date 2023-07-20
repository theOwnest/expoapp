import 'package:expo_kg/features/home/presentation/cubit/product_cubit.dart';
import 'package:expo_kg/features/home/presentation/widgets/product_container.dart';
import 'package:flutter/material.dart';
import 'package:expo_kg/shared/configs/texts.dart';
import 'package:expo_kg/shared/constants/colors.dart';
import 'package:expo_kg/shared/constants/margin.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeProductsGrid extends StatelessWidget {
  const HomeProductsGrid({super.key});

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
                'Товары месяца',
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
        LimitedBox(
          maxHeight: 250,
          child: BlocBuilder<ProductCubit, ProductState>(
            builder: (context, state) {
              return ListView.separated(
                padding: marginH,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => ProductContainer(
                  product: state.products[index],
                ),
                separatorBuilder: (context, index) => const SizedBox(
                  width: 6,
                ),
                itemCount: state.products.length,
              );
            },
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
