// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:expo_kg/shared/configs/texts.dart';
import 'package:expo_kg/shared/constants/colors.dart';
import 'package:expo_kg/shared/constants/sizedbox.dart';

class TextformfieldWithTitle extends StatefulWidget {
  const TextformfieldWithTitle({
    Key? key,
    required this.title,
    this.initialValue,
    this.validator,
    this.textInputType,
    this.obscureText,
    this.function,
    required this.controller,
  }) : super(key: key);
  final String title;
  final String? initialValue;
  final FormFieldValidator? validator;
  final TextInputType? textInputType;
  final bool? obscureText;
  final Function? function;
  final TextEditingController controller;
  @override
  State<TextformfieldWithTitle> createState() => _TextformfieldWithTitleState();
}

class _TextformfieldWithTitleState extends State<TextformfieldWithTitle> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        sizedbox35,
        Text(
          widget.title,
          style: h14,
        ),
        FormBuilderTextField(
          name: widget.title,
          controller: widget.controller,
          initialValue: widget.initialValue,
          textInputAction: TextInputAction.next,
          keyboardType: widget.textInputType,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          style: st14.copyWith(
            color: AppColor.black,
          ),
          onChanged: (value) {
            if (widget.function != null) {
              widget.function!(value);
            }
          },
          obscureText: widget.obscureText ?? false,
          decoration: const InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: AppColor.lightGrey,
              ),
            ),
          ),
          validator: widget.validator,
        ),
      ],
    );
  }
}
