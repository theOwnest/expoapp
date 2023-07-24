import 'package:expo_kg/shared/constants/colors.dart';
import 'package:expo_kg/shared/constants/other.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginTopClip extends StatelessWidget {
  const LoginTopClip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          Positioned(
            bottom: 50.h,
            child: CircleAvatar(
              radius: 270.h,
              backgroundColor: AppColor.orange,
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: 120.h,
              height: 120.h,
              padding: EdgeInsets.all(
                30.h,
              ),
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.circular(34),
                boxShadow: [
                  bigShadow,
                ],
              ),
              child: Image.asset(
                'assets/icons/login/logo.png',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
