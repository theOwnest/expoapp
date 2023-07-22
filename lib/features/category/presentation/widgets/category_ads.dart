import 'package:expo_kg/shared/configs/texts.dart';
import 'package:expo_kg/shared/constants/border_radius.dart';
import 'package:expo_kg/shared/constants/colors.dart';
import 'package:expo_kg/shared/constants/margin.dart';
import 'package:flutter/material.dart';

class CategoryAds extends StatelessWidget {
  const CategoryAds({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.separated(
        padding: marginH,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color(
                  0xffF07E2B,
                ),
                Color(
                  0xffFEDC65,
                ),
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: borderR10,
          ),
          width: 230,
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                categoryAds[index],
                style: h18.copyWith(
                  color: AppColor.white,
                ),
              ),
              Image.asset(
                'assets/debug/ads/smiling_emote.png',
                width: 30,
              ),
            ],
          ),
        ),
        separatorBuilder: (context, index) => const SizedBox(
          width: 10,
        ),
        itemCount: categoryAds.length,
      ),
    );
  }
}

final categoryAds = [
  'Хиты продаж',
  'Новинки',
];
