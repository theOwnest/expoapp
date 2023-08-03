import 'package:expo_kg/features/auth/presentation/widgets/login_form.dart';
import 'package:expo_kg/shared/configs/routes.dart';
import 'package:expo_kg/shared/configs/texts.dart';
import 'package:expo_kg/shared/constants/colors.dart';
import 'package:expo_kg/shared/constants/sizedbox.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import '../widgets/login_top_clip.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          reverse: true,
          child: Column(
            children: [
              const LoginTopClip(),
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(
                  top: 75.h,
                  left: 15,
                  right: 15,
                ),
                child: Column(
                  children: [
                    Column(
                      children: [
                        const Text(
                          'Войти',
                          style: h24,
                        ),
                        sizedbox15,
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: <TextSpan>[
                              const TextSpan(
                                text: 'Нет аккаунта? ',
                                style: h14,
                              ),
                              TextSpan(
                                text: 'Пройти регистрацию',
                                style: h14.copyWith(
                                  color: AppColor.orange,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    context.pushNamed(
                                      RoutesNames.register,
                                    );
                                  },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    const LoginForm(),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).viewInsets.bottom,
              )
            ],
          ),
        ),
      ),
    );
  }
}
