// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../configs/texts.dart';
import '../constants/colors.dart';

class DenseTextButton extends StatelessWidget {
  const DenseTextButton({
    Key? key,
    this.function,
    required this.title,
    this.isBold = true,
  }) : super(key: key);
  final Function? function;
  final String title;
  final bool isBold;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        if (function != null) {
          function!();
        }
      },
      child: Text(
        title,
        style: isBold
            ? h18.copyWith(
                color: AppColor.orange,
              )
            : st14.copyWith(
                color: AppColor.orange,
              ),
      ),
    );
  }
}
