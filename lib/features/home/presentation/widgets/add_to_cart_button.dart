// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:expo_kg/features/cart/data/models/cart_item_model.dart';
import 'package:expo_kg/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:expo_kg/shared/constants/border_radius.dart';
import 'package:expo_kg/shared/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    Key? key,
    required this.id,
  }) : super(key: key);
  final String id;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<CartCubit>().addToCart(
              CartItemModel(
                productId: id,
                amount: 1,
              ),
            );
      },
      child: Container(
        constraints: const BoxConstraints(maxHeight: 40,maxWidth: 40,),
        height: 35.h,
        width: 35.h,
        decoration: BoxDecoration(
          color: AppColor.orange,
          borderRadius: borderR10,
        ),
        child: const Icon(
          Icons.add,
          color: AppColor.white,
          size: 15,
        ),
      ),
    );
  }
}
