import 'package:expo_kg/shared/configs/texts.dart';
import 'package:expo_kg/shared/constants/border.dart';
import 'package:expo_kg/shared/constants/colors.dart';
import 'package:expo_kg/shared/constants/margin.dart';
import 'package:expo_kg/shared/widgets/rounded_button.dart';
import 'package:flutter/material.dart';

class ProductAskQuestions extends StatelessWidget {
  const ProductAskQuestions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Задать вопрос продавцу',
          style: h18,
        ),
        Container(
          height: 130,
          margin: marginV,
          child: TextField(
            maxLines: null,
            expands: true,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              border: outlineInputBorder,
            ),
          ),
        ),
        const RoundedButton(
          title: 'Задать вопрос',
          color: AppColor.black,
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
