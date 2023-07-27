import 'package:expo_kg/shared/configs/routes.dart';
import 'package:expo_kg/shared/configs/texts.dart';
import 'package:expo_kg/shared/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import '../widgets/login_top_clip.dart';

class RegisterCongratulationPage extends StatelessWidget {
  const RegisterCongratulationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Scaffold(
        body: Column(
          children: [
            LoginTopClip(
              topHeight: 60.h,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                child: Column(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 75.h,
                        ),
                        const Text(
                          'Поздравляем!',
                          style: h24,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          'Вы успешно зарегестрированы! Мы отправили код с подтверждением на вашу почту.',
                          style: st14,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    const Spacer(),
                    RoundedButton(
                      title: 'Готово',
                      function: () {
                        context.goNamed(
                          RoutesNames.profile,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 70.h,
            ),
          ],
        ),
      ),
    );
  }
}
