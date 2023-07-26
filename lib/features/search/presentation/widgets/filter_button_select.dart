// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:expo_kg/shared/constants/border_radius.dart';
import 'package:expo_kg/shared/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:expo_kg/shared/configs/texts.dart';

class FilterButtonSelect extends StatelessWidget {
  const FilterButtonSelect({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 35.h,
        ),
        const Text(
          'Заголовок',
          style: h14,
        ),
        const SizedBox(
          height: 10,
        ),
        const Row(
          children: [
            FilterSelectableButton(
              title: 'Lorem Ipsum',
              isSelected: true,
            ),
            SizedBox(
              width: 15,
            ),
            FilterSelectableButton(
              title: 'Lorem Ipsum',
              isSelected: false,
            ),
          ],
        )
      ],
    );
  }
}

class FilterSelectableButton extends StatelessWidget {
  const FilterSelectableButton({
    Key? key,
    required this.title,
    required this.isSelected,
  }) : super(key: key);
  final String title;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 45,
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColor.lightGrey,
            width: 1,
          ),
          borderRadius: borderR10,
        ),
        child: Row(
          children: [
            isSelected
                ? Image.asset(
                    'assets/icons/product/subtract.png',
                    height: 22,
                  )
                : Container(
                    height: 22,
                    width: 22,
                    decoration: BoxDecoration(
                      borderRadius: borderRC,
                      border: Border.all(
                        color: AppColor.lightGrey,
                        width: 1,
                      ),
                    ),
                  ),
            const SizedBox(
              width: 15,
            ),
            Text(
              title,
              style: st14,
            ),
          ],
        ),
      ),
    );
  }
}
