// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:expo_kg/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:expo_kg/features/profile/presentation/widgets/profile_button_list.dart';
import 'package:expo_kg/shared/constants/border_radius.dart';
import 'package:expo_kg/shared/constants/colors.dart';
import 'package:flutter/material.dart';

import 'package:expo_kg/features/auth/data/models/user.dart';
import 'package:expo_kg/shared/configs/texts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileLoggedIn extends StatelessWidget {
  const ProfileLoggedIn({
    Key? key,
    required this.user,
  }) : super(key: key);
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  user.fullName,
                  style: h24,
                ),
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
        ),
        SizedBox(
          height: 40.h,
        ),
        const ProfileButtonsList(),
        TextButton(
          onPressed: () {
            context.read<AuthCubit>().logOut();
          },
          child: Text(
            'Выйти',
            style: h18.copyWith(
              color: AppColor.orange,
            ),
          ),
        ),
      ],
    );
  }
}