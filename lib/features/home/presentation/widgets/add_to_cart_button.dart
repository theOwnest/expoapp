import 'package:expo_kg/shared/constants/border_radius.dart';
import 'package:expo_kg/shared/constants/colors.dart';
import 'package:flutter/material.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 33,
      width: 33,
      decoration: BoxDecoration(
        color: AppColor.orange,
        borderRadius: borderR10,
      ),
      child: const Icon(
        Icons.add,
        color: AppColor.white,
        size: 15,
      ),
    );
  }
}
