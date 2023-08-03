// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:expo_kg/features/merchant/presentation/widgets/textfield_title.dart';
import 'package:expo_kg/shared/widgets/rounded_small_button.dart';
import 'package:flutter/material.dart';

class TextfieldWithButton extends StatelessWidget {
  const TextfieldWithButton({
    Key? key,
    required this.title,
    required this.buttonTitle,
    this.initialValue,
    this.textFunction,
    this.buttonFunction,
  }) : super(key: key);
  final String title;
  final String buttonTitle;
  final String? initialValue;
  final Function? textFunction;
  final Function? buttonFunction;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextfieldWithTitle(
          title: title,
          function: textFunction,
          initialValue: initialValue,
        ),
        const SizedBox(
          height: 10,
        ),
        RoundedSmallButton(
          title: buttonTitle,
          function: buttonFunction,
        ),
      ],
    );
  }
}
