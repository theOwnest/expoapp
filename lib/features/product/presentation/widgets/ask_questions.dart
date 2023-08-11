import 'package:expo_kg/shared/configs/routes.dart';
import 'package:expo_kg/shared/configs/texts.dart';
import 'package:expo_kg/shared/constants/border.dart';
import 'package:expo_kg/shared/constants/colors.dart';
import 'package:expo_kg/shared/constants/margin.dart';
import 'package:expo_kg/shared/constants/sizedbox.dart';
import 'package:expo_kg/shared/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
        RoundedButton(
          title: 'Задать вопрос',
          color: AppColor.black,
          function: () {
            context.goNamed(
              RoutesNames.chat,
            );
          },
        ),
        sizedbox30,
      ],
    );
  }
}
