// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:expo_kg/shared/configs/texts.dart';
import 'package:expo_kg/shared/constants/colors.dart';
import 'package:expo_kg/shared/constants/sizedbox.dart';
import 'package:flutter/material.dart';

class TextfieldWithTitle extends StatelessWidget {
  const TextfieldWithTitle({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
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
        TextField(
          style: st14.copyWith(
            color: AppColor.black,
          ),
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
