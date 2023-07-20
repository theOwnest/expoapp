// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:expo_kg/shared/configs/texts.dart';
import 'package:expo_kg/shared/constants/border_radius.dart';
import 'package:expo_kg/shared/constants/colors.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key,
    required this.title,
    this.function,
    this.color,
    this.width,
    this.height,
  }) : super(key: key);
  final String title;
  final Function? function;
  final Color? color;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (function != null) {
          function!();
        }
      },
      child: Container(
        height: height ?? 60,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          color: color ?? AppColor.orange,
          borderRadius: borderR10,
        ),
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          style: h18.copyWith(
            color: AppColor.white,
          ),
        ),
      ),
    );
  }
}
