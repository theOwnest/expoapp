import 'package:expo_kg/shared/configs/texts.dart';
import 'package:expo_kg/shared/constants/border_radius.dart';
import 'package:expo_kg/shared/constants/colors.dart';
import 'package:expo_kg/shared/constants/margin.dart';
import 'package:flutter/material.dart';

class FreeDeliveryReminder extends StatelessWidget {
  const FreeDeliveryReminder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.green,
        borderRadius: borderR10,
      ),
      margin: marginHV10,
      padding: marginHV15,
      child: Row(
        children: [
          const Icon(
            Icons.thumb_up,
            color: AppColor.white,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(
              'Вам доступна бесплатная доставка! ',
              style: h14.copyWith(color: AppColor.white),
            ),
          ),
          const Icon(
            Icons.close,
            color: AppColor.white,
          ),
        ],
      ),
    );
  }
}
