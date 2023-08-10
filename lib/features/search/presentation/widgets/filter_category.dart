import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:expo_kg/shared/configs/texts.dart';
import 'package:expo_kg/shared/constants/border.dart';
import 'package:expo_kg/shared/constants/colors.dart';
import 'package:expo_kg/shared/constants/sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterCategory extends StatefulWidget {
  const FilterCategory({super.key});

  @override
  State<FilterCategory> createState() => _FilterCategoryState();
}

class _FilterCategoryState extends State<FilterCategory> {
  final List<String> items = [
    'Выбор 1',
    'Выбор 2',
    'Выбор 3',
    'Выбор 4',
    'Выбор 5',
  ];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        sizedbox35,
        const Text(
          'Заголовок',
          style: h14,
        ),
        sizedbox10,
        DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
            isExpanded: true,
            hint: const Row(
              children: [
                Text(
                  'Текст',
                  style: st14,
                ),
              ],
            ),
            items: items
                .map(
                  (String item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: st14,
                    ),
                  ),
                )
                .toList(),
            value: selectedValue,
            onChanged: (value) {
              setState(() {
                selectedValue = value;
              });
            },
            buttonStyleData: ButtonStyleData(
              height: 45,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: commonThinBorder,
                color: AppColor.white,
              ),
            ),
            iconStyleData: const IconStyleData(
              icon: Icon(
                Icons.keyboard_arrow_down,
                size: 18,
              ),
              iconEnabledColor: AppColor.lightGrey,
            ),
            dropdownStyleData: DropdownStyleData(
              maxHeight: 300.h,
              width: 345.w,
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.circular(5),
                border: commonThinBorder,
              ),
              elevation: 0,
            ),
          ),
        ),
      ],
    );
  }
}
