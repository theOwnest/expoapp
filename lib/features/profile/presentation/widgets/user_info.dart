import 'package:auto_size_text/auto_size_text.dart';
import 'package:expo_kg/features/auth/data/models/user.dart';
import 'package:expo_kg/shared/constants/border_radius.dart';
import 'package:expo_kg/shared/constants/colors.dart';
import 'package:expo_kg/shared/constants/sizedbox.dart';
import 'package:flutter/material.dart';

import '../../../../shared/configs/texts.dart';

class ProfileUserInfo extends StatelessWidget {
  const ProfileUserInfo({
    super.key,
    required this.user,
  });

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: AutoSizeText(
                user.userName,
                style: h24,
                maxLines: 1,
                minFontSize: 16,
              ),
            ),
            sizedboxH10,
            Container(
              height: 36,
              width: 36,
              decoration: BoxDecoration(
                color: AppColor.lightGrey,
                borderRadius: borderRC,
              ),
              child: Center(
                child: Image.asset(
                  'assets/icons/product/person.png',
                  width: 14,
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          user.phone,
          style: st14,
        ),
      ],
    );
  }
}
