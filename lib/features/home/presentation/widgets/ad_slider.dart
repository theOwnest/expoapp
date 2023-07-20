import 'package:expo_kg/shared/configs/random.dart';
import 'package:expo_kg/shared/constants/border_radius.dart';
import 'package:expo_kg/shared/constants/margin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeAdSlider extends StatelessWidget {
  const HomeAdSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160.h,
      margin: marginHV15,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/debug/ads/${random.nextInt(2) + 1}.png',
          ),
          fit: BoxFit.cover,
        ),
        borderRadius: borderR10,
      ),
    );
  }
}
