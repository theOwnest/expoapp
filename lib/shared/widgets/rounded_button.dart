// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:expo_kg/shared/configs/texts.dart';
import 'package:expo_kg/shared/constants/border_radius.dart';
import 'package:expo_kg/shared/constants/colors.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key,
    required this.title,
    this.function,
    this.color,
    this.textColor,
    this.width,
    this.height,
    this.margin,
  }) : super(key: key);
  final String title;
  final Function? function;
  final Color? color;
  final Color? textColor;
  final double? width;
  final double? height;
  final EdgeInsets? margin;
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
        margin: margin,
        alignment: Alignment.center,
        child: Text(
          title,
          style: h18.copyWith(
            color: textColor ?? AppColor.white,
          ),
        ),
      ),
    );
  }
}
