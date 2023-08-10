import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:expo_kg/features/search/data/datasources/sorting_options.dart';
import 'package:expo_kg/shared/configs/texts.dart';
import 'package:expo_kg/shared/constants/colors.dart';
import 'package:flutter/material.dart';

class SortDropdown extends StatefulWidget {
  const SortDropdown({super.key});

  @override
  State<SortDropdown> createState() => _SortDropdownState();
}

class _SortDropdownState extends State<SortDropdown> {
  String? selectedValue = sortingOptions.first;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        items: sortingOptions
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
        iconStyleData: const IconStyleData(
          icon: Icon(
            Icons.keyboard_arrow_down,
            size: 18,
          ),
          iconEnabledColor: AppColor.black,
        ),
      ),
    );
  }
}
