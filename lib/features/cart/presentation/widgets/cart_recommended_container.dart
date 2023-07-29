import 'package:expo_kg/shared/configs/texts.dart';
import 'package:expo_kg/shared/constants/border.dart';
import 'package:expo_kg/shared/constants/border_radius.dart';
import 'package:expo_kg/shared/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartRecommendedContainer extends StatelessWidget {
  const CartRecommendedContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240.w,
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        borderRadius: borderR10,
        border: commonThinBorder,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/debug/coffee.png',
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '899 KGS',
                  style: h16.copyWith(
                    color: AppColor.orange,
                  ),
                ),
                const Text(
                  'Кофе в капсулах Dolce Gusto Americano',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: h12,
                ),
                const Text(
                  'Продавец “Солнышко”',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: st12,
                ),
              ],
            ),
          ),
          const Icon(
            Icons.favorite_outline,
            size: 20,
          ),
        ],
      ),
    );
  }
}
