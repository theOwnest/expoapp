import 'package:expo_kg/shared/configs/routes.dart';
import 'package:expo_kg/shared/configs/texts.dart';
import 'package:expo_kg/shared/constants/border_radius.dart';
import 'package:expo_kg/shared/constants/colors.dart';
import 'package:expo_kg/shared/constants/margin.dart';
import 'package:expo_kg/shared/constants/sizedbox.dart';
import 'package:expo_kg/shared/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileNotLoggedIn extends StatelessWidget {
  const ProfileNotLoggedIn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Ваш профиль',
          style: h24,
        ),
        sizedbox10,
        const Text(
          'Здесь находятся история покупок, статусы заказов, спасобы оплаты и другое.',
          style: st14,
        ),
        sizedbox30,
        Container(
          padding: marginHV15,
          decoration: BoxDecoration(
            color: AppColor.lightGrey,
            borderRadius: borderR10,
          ),
          child: Column(
            children: [
              const Text(
                'Войдите, чтобы покупать и продавать товары',
                style: h18,
              ),
              sizedbox20,
              RoundedButton(
                title: 'Вход/регистрация',
                function: () {
                  context.pushNamed(
                    RoutesNames.login,
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
