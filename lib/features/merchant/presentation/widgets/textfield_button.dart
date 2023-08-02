import 'package:expo_kg/features/merchant/presentation/widgets/textfield_title.dart';
import 'package:expo_kg/shared/widgets/rounded_small_button.dart';
import 'package:flutter/material.dart';

class TextfieldWithButton extends StatelessWidget {
  const TextfieldWithButton({
    Key? key,
    required this.title,
    required this.buttonTitle,
    this.function,
  }) : super(key: key);
  final String title;
  final String buttonTitle;
  final Function? function;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextfieldWithTitle(
          title: title,
        ),
        const SizedBox(
          height: 10,
        ),
        RoundedSmallButton(
          title: buttonTitle,
          function: function,
        ),
      ],
    );
  }
}
