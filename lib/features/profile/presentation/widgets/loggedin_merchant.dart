// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:expo_kg/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:expo_kg/features/merchant/data/models/merchant.dart';
import 'package:expo_kg/features/profile/presentation/widgets/merchant_button_list.dart';
import 'package:expo_kg/shared/constants/colors.dart';
import 'package:expo_kg/shared/constants/sizedbox.dart';
import 'package:expo_kg/shared/widgets/dense_text_button.dart';
import 'package:expo_kg/shared/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'user_info.dart';

class ProfileLoggedInMerchant extends StatelessWidget {
  const ProfileLoggedInMerchant({
    Key? key,
    required this.user,
  }) : super(key: key);
  final MerchantModel user;

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
            const ProfileMerchantButtonsList(),
            DenseTextButton(
              title: 'Выйти',
              function: () {
                context.read<AuthCubit>().logOut();
              },
            ),
          ],
        ),
        Column(
          children: [
            const RoundedButton(
              title: '+ Добавить объявление',
              color: AppColor.black,
            ),
            sizedbox15,
            RoundedButton(
              title: 'Перейти на профиль покупателя',
              function: () {
                context.read<AuthCubit>().goToCustomer();
              },
            ),
          ],
        ),
      ],
    );
  }
}
