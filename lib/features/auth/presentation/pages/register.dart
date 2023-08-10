import 'package:expo_kg/features/auth/presentation/cubit/phone_controller.dart';
import 'package:expo_kg/features/auth/presentation/widgets/register_phone.dart';
import 'package:expo_kg/shared/configs/routes.dart';
import 'package:expo_kg/shared/configs/texts.dart';
import 'package:expo_kg/shared/constants/colors.dart';
import 'package:expo_kg/shared/constants/margin.dart';
import 'package:expo_kg/shared/constants/sizedbox.dart';
import 'package:expo_kg/shared/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import '../cubit/button_available.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ButtonAvailableCont(),
        ),
        BlocProvider(
          create: (context) => PhoneController(),
        ),
      ],
      child: Builder(builder: (context) {
        return KeyboardDismisser(
          child: Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: marginHV15,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Регистрация',
                        style: h24,
                      ),
                      sizedbox10,
                      Text(
                        'Для того чтобы оформлять заказы необходимо пройти регистрацию по номеру телефона',
                        style: st14,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 60.h,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Регистрация',
                        style: h14,
                      ),
                      RegisterPhoneField(),
                    ],
                  ),
                  const Spacer(),
                  BlocBuilder<ButtonAvailableCont, bool>(
                    builder: (context, state) {
                      return RoundedButton(
                        title: 'Отправить СМС',
                        color: state
                            ? AppColor.orange
                            : AppColor.orange.withOpacity(
                                0.2,
                              ),
                        textColor: state ? AppColor.white : AppColor.orange,
                        function: state
                            ? () {
                                context.pushNamed(
                                  RoutesNames.smscode,
                                  queryParameters: {
                                    'phone':
                                        context.read<PhoneController>().state,
                                  },
                                );
                              }
                            : null,
                      );
                    },
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
