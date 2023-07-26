import 'package:expo_kg/features/search/presentation/widgets/filter_button_select.dart';
import 'package:expo_kg/features/search/presentation/widgets/filter_category.dart';
import 'package:expo_kg/features/search/presentation/widgets/filter_price.dart';
import 'package:expo_kg/features/search/presentation/widgets/filter_selectable.dart';
import 'package:expo_kg/features/search/presentation/widgets/filter_switches.dart';
import 'package:expo_kg/shared/configs/texts.dart';
import 'package:expo_kg/shared/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Container(
        height: 770.h,
        padding: const EdgeInsets.symmetric(
          vertical: 25,
          horizontal: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Фильтры',
                  style: h24,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Отчистить',
                    style: st14.copyWith(
                      color: AppColor.orange,
                    ),
                  ),
                ),
              ],
            ),
            const Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FilterCategory(),
                    FilterSelectable(),
                    FilterPrice(),
                    FilterButtonSelect(),
                    FilterSwitches(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
