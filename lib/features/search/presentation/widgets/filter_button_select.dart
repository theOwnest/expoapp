// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:expo_kg/shared/configs/texts.dart';
import 'package:expo_kg/shared/constants/sizedbox.dart';
import 'package:expo_kg/shared/widgets/selectable_button.dart';
import 'package:flutter/material.dart';

class FilterButtonSelect extends StatelessWidget {
  const FilterButtonSelect({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        sizedbox35,
        Text(
          'Заголовок',
          style: h14,
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            SelectableButton(
              title: 'Lorem Ipsum',
              isSelected: true,
            ),
            SizedBox(
              width: 15,
            ),
            SelectableButton(
              title: 'Lorem Ipsum',
              isSelected: false,
            ),
          ],
        )
      ],
    );
  }
}
