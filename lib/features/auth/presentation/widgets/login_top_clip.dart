// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:expo_kg/shared/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../shared/constants/other.dart';

class LoginTopClip extends StatelessWidget {
  const LoginTopClip({
    Key? key,
    this.topHeight,
  }) : super(key: key);
  final double? topHeight;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: topHeight != null ? topHeight! + 200 : 200,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          Positioned(
            bottom: topHeight != null ? 50.h - topHeight! : 50.h,
            child: CircleAvatar(
              radius: 270.h,
              backgroundColor: AppColor.orange,
            ),
          ),
          Positioned(
            bottom: topHeight != null ? -topHeight! : 0,
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
