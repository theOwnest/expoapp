// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:expo_kg/features/auth/presentation/cubit/button_available.dart';
import 'package:expo_kg/features/auth/presentation/cubit/sms_controller.dart';
import 'package:expo_kg/features/auth/presentation/widgets/sms_field.dart';
import 'package:expo_kg/shared/configs/routes.dart';
import 'package:expo_kg/shared/configs/texts.dart';
import 'package:expo_kg/shared/constants/colors.dart';
import 'package:expo_kg/shared/constants/margin.dart';
import 'package:expo_kg/shared/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class SmsCodePage extends StatelessWidget {
  const SmsCodePage({
    Key? key,
    required this.phone,
  }) : super(key: key);
  final String phone;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SmsController(),
        ),
        BlocProvider(
          create: (context) => ButtonAvailableCont(),
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
                    ],
                  ),
                  SizedBox(
                    height: 60.h,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Введите код из СМС сообщения',
                        style: h14,
                      ),
                      SmsCodeField(),
                    ],
                  ),
                  const Spacer(),
                  BlocBuilder<ButtonAvailableCont, bool>(
                    builder: (context, state) {
                      return RoundedButton(
                        title: 'Готово',
                        color: state
                            ? AppColor.orange
                            : AppColor.orange.withOpacity(
                                0.2,
                              ),
                        textColor: state ? AppColor.white : AppColor.orange,
                        function: state
                            ? () {
                                context.pushNamed(
                                  RoutesNames.anketa,
                                  queryParameters: {
                                    'phone': phone,
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
