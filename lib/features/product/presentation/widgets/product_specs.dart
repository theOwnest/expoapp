import 'package:expo_kg/shared/configs/texts.dart';
import 'package:expo_kg/shared/constants/colors.dart';
import 'package:expo_kg/shared/constants/divider.dart';
import 'package:expo_kg/shared/widgets/rounded_button.dart';
import 'package:flutter/material.dart';

class ProductSpecs extends StatelessWidget {
  const ProductSpecs({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Характеристики',
          style: h14,
        ),
        SizedBox(
          height: 20,
        ),
        ProductSpecContainer(
          title: 'Подключение ',
          value: 'Беспроводное',
        ),
        ProductSpecContainer(
          title: 'Интерфейс подключения ',
          value: 'Bluetooth',
        ),
        ProductSpecContainer(
          title: 'Частота ',
          value: '20-20 000',
        ),
        ProductSpecContainer(
          title: 'Система шумоподавления',
          value: 'Есть',
        ),
        ProductSpecContainer(
          title: 'Микрофон ',
          value: 'Есть',
        ),
        RoundedButton(
          title: 'Все характеристики',
          color: AppColor.black,
          height: 60,
        ),
      ],
    );
  }
}

class ProductSpecContainer extends StatelessWidget {
  const ProductSpecContainer({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: st14,
            ),
            Text(
              value,
              style: h14,
            ),
          ],
        ),
        divider30,
      ],
    );
  }
}
