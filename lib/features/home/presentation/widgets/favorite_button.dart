import 'package:expo_kg/shared/constants/border_radius.dart';
import 'package:expo_kg/shared/constants/colors.dart';
import 'package:flutter/material.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 22,
      width: 22,
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: borderRC,
      ),
      padding: const EdgeInsets.all(3),
      child: Image.asset(
        'assets/icons/home/heart.png',
      ),
    );
  }
}
