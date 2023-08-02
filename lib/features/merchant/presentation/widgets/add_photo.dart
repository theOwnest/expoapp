import 'package:expo_kg/shared/configs/texts.dart';
import 'package:expo_kg/shared/constants/border_radius.dart';
import 'package:expo_kg/shared/constants/colors.dart';
import 'package:expo_kg/shared/constants/margin.dart';
import 'package:expo_kg/shared/constants/sizedbox.dart';
import 'package:expo_kg/shared/widgets/rounded_small_button.dart';
import 'package:flutter/material.dart';

class AddPhoto extends StatelessWidget {
  const AddPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        sizedbox35,
        const Text(
          'Добавить фото',
          style: h14,
        ),
        Padding(
          padding: marginV,
          child: GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 4,
            crossAxisSpacing: 8,
            children: List.generate(
              4,
              (index) => const AddPhotoContainer(),
            ),
          ),
        ),
        const RoundedSmallButton(
          title: '+ Добавить еще фото',
        ),
      ],
    );
  }
}

class AddPhotoContainer extends StatelessWidget {
  const AddPhotoContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.lightGrey,
        borderRadius: borderR10,
      ),
      child: Center(
        child: Image.asset(
          'assets/icons/login/photo.png',
          width: 22,
        ),
      ),
    );
  }
}
