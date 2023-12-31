import 'package:expo_kg/features/home/data/models/product.dart';
import 'package:expo_kg/features/home/presentation/cubit/product_cubit.dart';
import 'package:expo_kg/features/home/presentation/widgets/add_to_cart_button.dart';
import 'package:expo_kg/features/home/presentation/widgets/favorite_button.dart';
import 'package:expo_kg/shared/configs/routes.dart';
import 'package:expo_kg/shared/configs/texts.dart';
import 'package:expo_kg/shared/constants/border.dart';
import 'package:expo_kg/shared/constants/border_radius.dart';
import 'package:expo_kg/shared/constants/colors.dart';
import 'package:expo_kg/shared/constants/cubit_strings.dart';
import 'package:expo_kg/shared/constants/sizedbox.dart';
import 'package:expo_kg/shared/models/multiple_cubits.dart';
import 'package:expo_kg/shared/widgets/custom_rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../favorite/presentation/cubit/favorite_cubit.dart';

class ProductGridContainer extends StatelessWidget {
  const ProductGridContainer({
    Key? key,
    required this.product,
  }) : super(key: key);
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(
          RoutesNames.productInfo,
          extra: MultipleCubits(
            cubits: {
              CubitStrings.productsCubit:
                  BlocProvider.of<ProductCubit>(context),
              CubitStrings.favoritesCubit:
                  BlocProvider.of<FavoriteCubit>(context),
            },
          ),
          queryParameters: {
            'productId': product.id,
          },
        );
      },
      child: Container(
        width: 168.w,
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          borderRadius: borderR10,
          border: commonThinBorder,
        ),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: AppColor.lightGrey,
                      borderRadius: borderR6,
                    ),
                    child: Image.asset(
                      product.images.first,
                    ),
                  ),
                  Positioned(
                    right: 8,
                    top: 8,
                    child: FavoriteButton(
                      id: product.id,
                    ),
                  ),
                ],
              ),
            ),
            sizedbox5,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: h14,
                ),
                Text(
                  product.shop.name,
                  style: st12,
                ),
                CustomRatingContainer(
                  rating: product.rating,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${product.price} KGS',
                      style: h16.copyWith(
                        color: AppColor.orange,
                      ),
                    ),
                    AddToCartButton(
                      id: product.id,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
