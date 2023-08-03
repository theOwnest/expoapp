// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:expo_kg/shared/configs/texts.dart';
import 'package:expo_kg/shared/constants/colors.dart';
import 'package:expo_kg/shared/constants/sizedbox.dart';
import 'package:flutter/material.dart';

class TextfieldWithTitle extends StatelessWidget {
  const TextfieldWithTitle({
    Key? key,
    required this.title,
    this.initialValue,
    this.function,
  }) : super(key: key);
  final String title;
  final String? initialValue;
  final Function? function;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        sizedbox35,
        Text(
          title,
          style: h14,
        ),
        TextFormField(
          initialValue: initialValue,
          textInputAction: TextInputAction.next,
          style: st14.copyWith(
            color: AppColor.black,
          ),
          onChanged: (value) {
            if (function != null) {
              function!(value);
            }
          },
          decoration: const InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: AppColor.lightGrey,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
