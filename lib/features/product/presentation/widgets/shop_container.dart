import 'package:expo_kg/features/home/presentation/cubit/product_cubit.dart';
import 'package:expo_kg/features/product/presentation/cubit/product_cont.dart';
import 'package:expo_kg/shared/configs/routes.dart';
import 'package:expo_kg/shared/configs/texts.dart';
import 'package:expo_kg/shared/constants/border_radius.dart';
import 'package:expo_kg/shared/constants/colors.dart';
import 'package:expo_kg/shared/widgets/custom_rating.dart';
import 'package:expo_kg/shared/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProductShopContainer extends StatelessWidget {
  const ProductShopContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final shop = context.read<ProductController>().state.shop;
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        borderRadius: borderR10,
        border: Border.all(
          color: AppColor.lightGrey,
          width: 1,
        ),
      ),
      margin: const EdgeInsets.symmetric(
        vertical: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Продавец',
            style: st14,
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                shop.name,
                style: h18,
              ),
              CustomRatingContainer(
                rating: shop.rating,
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          RoundedButton(
            title: 'На страницу продавца',
            height: 40,
            margin: EdgeInsets.zero,
            function: () {
              context.goNamed(
                RoutesNames.shopInfo,
                extra: BlocProvider.of<ProductCubit>(context),
                queryParameters: {
                  'productId': context.read<ProductController>().state.id,
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
