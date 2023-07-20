// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:expo_kg/features/home/presentation/widgets/add_to_cart_button.dart';
import 'package:expo_kg/features/home/presentation/widgets/favorite_button.dart';
import 'package:expo_kg/shared/configs/texts.dart';
import 'package:expo_kg/shared/constants/border_radius.dart';
import 'package:expo_kg/shared/constants/colors.dart';
import 'package:flutter/material.dart';

import 'package:expo_kg/features/home/data/models/product.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductContainer extends StatelessWidget {
  const ProductContainer({
    Key? key,
    required this.product,
  }) : super(key: key);
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 168.w,
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        borderRadius: borderR10,
        border: Border.all(
          color: AppColor.lightGrey,
          width: 1,
        ),
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
                    product.image,
                  ),
                ),
                const Positioned(
                  right: 8,
                  top: 8,
                  child: FavoriteButton(),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 6,
          ),
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
              Text(
                product.rating.toStringAsFixed(1),
                style: st12,
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
                  const AddToCartButton(),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
