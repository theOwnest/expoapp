import 'package:expo_kg/shared/configs/texts.dart';
import 'package:expo_kg/shared/constants/margin.dart';
import 'package:flutter/material.dart';

class HomeAddressDropDown extends StatelessWidget {
  const HomeAddressDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: marginHV10,
      child: Row(
        children: [
          Image.asset(
            'assets/icons/home/location.png',
            height: 17,
          ),
          const SizedBox(
            width: 10,
          ),
          const Text(
            'улица Центральная, д. 15',
            style: st14,
          ),
          const SizedBox(
            width: 10,
          ),
          const Icon(
            Icons.keyboard_arrow_down,
          ),
        ],
      ),
    );
  }
}
