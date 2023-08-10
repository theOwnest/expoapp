// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:expo_kg/shared/configs/texts.dart';
import 'package:expo_kg/shared/constants/border.dart';
import 'package:expo_kg/shared/constants/border_radius.dart';
import 'package:expo_kg/shared/constants/sizedbox.dart';
import 'package:flutter/material.dart';

class SelectableButton extends StatelessWidget {
  const SelectableButton({
    Key? key,
    required this.title,
    required this.isSelected,
    this.function,
  }) : super(key: key);
  final String title;
  final bool isSelected;
  final Function? function;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          if (function != null) {
            function!();
          }
        },
        child: Container(
          height: 45,
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          decoration: BoxDecoration(
            border: commonThinBorder,
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
                        border: commonThinBorder,
                      ),
                    ),
              sizedboxH15,
              Text(
                title,
                style: st14,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
