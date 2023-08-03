// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:expo_kg/features/auth/data/models/user.dart';
import 'package:expo_kg/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:expo_kg/features/profile/presentation/widgets/user_button_list.dart';
import 'package:expo_kg/features/profile/presentation/widgets/user_info.dart';
import 'package:expo_kg/shared/configs/routes.dart';
import 'package:expo_kg/shared/widgets/dense_text_button.dart';
import 'package:expo_kg/shared/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ProfileLoggedInUser extends StatelessWidget {
  const ProfileLoggedInUser({
    Key? key,
    required this.user,
  }) : super(key: key);
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileUserInfo(
              user: user,
            ),
            SizedBox(
              height: 40.h,
            ),
            const ProfileUserButtonsList(),
            DenseTextButton(
              title: 'Выйти',
              function: () {
                context.read<AuthCubit>().logOut();
              },
            ),
          ],
        ),
        RoundedButton(
          title: 'Стать продавцом',
          function: () {
            context.pushNamed(
              RoutesNames.merchantAnketa,
            );
          },
        ),
      ],
    );
  }
}
