import 'package:expo_kg/shared/constants/border_radius.dart';
import 'package:expo_kg/shared/constants/colors.dart';
import 'package:flutter/material.dart';

class PersonalAddPhoto extends StatelessWidget {
  const PersonalAddPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Center(
        child: Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            color: AppColor.lightGrey,
            borderRadius: borderRC,
          ),
          child: Center(
            child: Image.asset(
              'assets/icons/login/photo.png',
              width: 22,
            ),
          ),
        ),
      ),
    );
  }
}
