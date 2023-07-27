// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:expo_kg/features/auth/data/models/user.dart';
import 'package:expo_kg/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:expo_kg/features/auth/presentation/cubit/button_available.dart';
import 'package:expo_kg/features/auth/presentation/widgets/anketa_form.dart';
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

class AnketaPage extends StatefulWidget {
  const AnketaPage({
    Key? key,
    required this.phone,
  }) : super(key: key);
  final String phone;
  @override
  State<AnketaPage> createState() => _AnketaPageState();
}

class _AnketaPageState extends State<AnketaPage> {
  final nameCont = TextEditingController();
  final emailCont = TextEditingController();
  final passCont = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ButtonAvailableCont(),
        ),
      ],
      child: Builder(builder: (context) {
        return KeyboardDismisser(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
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
                        'Анкета',
                        style: h24,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Заполните поля ниже',
                        style: st14,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 60.h,
                  ),
                  AnketaForm(
                    nameCont: nameCont,
                    emailCont: emailCont,
                    passCont: passCont,
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
                                context.read<AuthCubit>().register(
                                      UserModel(
                                        fullName: nameCont.text,
                                        email: emailCont.text,
                                        phone: widget.phone,
                                      ),
                                    );
                                context.goNamed(
                                  RoutesNames.congrats,
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
