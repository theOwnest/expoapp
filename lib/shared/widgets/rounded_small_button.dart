// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:expo_kg/shared/configs/texts.dart';
import 'package:expo_kg/shared/constants/border_radius.dart';
import 'package:expo_kg/shared/constants/colors.dart';
import 'package:flutter/material.dart';

class RoundedSmallButton extends StatelessWidget {
  const RoundedSmallButton({
    Key? key,
    required this.title,
    this.function,
    this.color,
    this.textColor,
  }) : super(key: key);
  final String title;
  final Function? function;
  final Color? color;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (function != null) {
          function!();
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: color ?? AppColor.orange,
          borderRadius: borderR4,
        ),
        padding: const EdgeInsets.all(10),
        child: Text(
          title,
          style: h14.copyWith(
            color: textColor ?? AppColor.white,
          ),
        ),
      ),
    );
  }
}
