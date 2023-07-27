// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:expo_kg/shared/constants/border_radius.dart';
import 'package:expo_kg/shared/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:expo_kg/features/home/data/datasources/categories.dart';
import 'package:expo_kg/shared/configs/texts.dart';

class FilterSelectable extends StatelessWidget {
  const FilterSelectable({super.key});

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
        SizedBox(
          height: 40.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => FilterSelectableContainer(
              title: categoryList[index].name,
              isSelected: index == 1,
            ),
            separatorBuilder: (context, index) => const SizedBox(
              width: 10,
            ),
            itemCount: categoryList.length,
          ),
        )
      ],
    );
  }
}

class FilterSelectableContainer extends StatelessWidget {
  const FilterSelectableContainer({
    Key? key,
    required this.isSelected,
    required this.title,
  }) : super(key: key);
  final bool isSelected;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      decoration: BoxDecoration(
        color: isSelected
            ? AppColor.orange
            : AppColor.orange.withOpacity(
                0.2,
              ),
        borderRadius: borderRC,
      ),
      alignment: Alignment.center,
      child: Text(
        title,
        style: st14.copyWith(
          color: isSelected ? AppColor.white : AppColor.orange,
        ),
      ),
    );
  }
}