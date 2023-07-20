import 'package:expo_kg/shared/configs/texts.dart';
import 'package:expo_kg/shared/constants/border_radius.dart';
import 'package:expo_kg/shared/constants/colors.dart';
import 'package:expo_kg/shared/constants/margin.dart';
import 'package:flutter/material.dart';

class HomeProductSearchbar extends StatelessWidget {
  const HomeProductSearchbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.lightGrey,
        borderRadius: borderR10,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      margin: marginH,
      child: TextField(
        maxLines: 1,
        style: st14,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.zero,
          border: InputBorder.none,
          hintText: 'Найти товары',
          hintStyle: st14.copyWith(
            color: AppColor.darkGrey,
          ),
          suffixIconConstraints: const BoxConstraints(
            maxHeight: 18,
          ),
          suffixIcon: Image.asset(
            'assets/icons/home/search.png',
          ),
        ),
      ),
    );
  }
}
