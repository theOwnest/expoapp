// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:expo_kg/shared/configs/texts.dart';
import 'package:expo_kg/shared/constants/colors.dart';
import 'package:expo_kg/shared/constants/sizedbox.dart';

class TextfieldWithTitle extends StatelessWidget {
  const TextfieldWithTitle({
    Key? key,
    required this.title,
    this.initialValue,
    this.function,
    this.validator,
  }) : super(key: key);
  final String title;
  final String? initialValue;
  final Function? function;
  final String? Function(String?)? validator;
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
        FormBuilderTextField(
          name: title,
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
          validator: validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
        ),
      ],
    );
  }
}
