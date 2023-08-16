import 'package:expo_kg/features/auth/data/models/user.dart';
import 'package:expo_kg/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:expo_kg/features/auth/presentation/cubit/button_available.dart';
import 'package:expo_kg/features/profile/presentation/cubit/profile_image_cubit.dart';
import 'package:expo_kg/features/profile/presentation/widgets/anketa_form.dart';
import 'package:expo_kg/features/profile/presentation/widgets/personal_add_photo.dart';
import 'package:expo_kg/shared/constants/margin.dart';
import 'package:expo_kg/shared/utils/pop_page.dart';
import 'package:expo_kg/shared/widgets/appbar_title.dart';
import 'package:expo_kg/shared/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({super.key});

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  final nameCont = TextEditingController();
  final phoneCont = TextEditingController();
  final emailCont = TextEditingController();
  final passCont = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ButtonAvailableCont(),
        ),
        BlocProvider(
          create: (context) => ProfileImageCubit(),
        ),
      ],
      child: Builder(builder: (context) {
        return Column(
          children: [
            const AppbarTitle(title: 'Личные данные'),
            Expanded(
              child: Padding(
                padding: marginHV10,
                child: CustomScrollView(
                  slivers: [
                    const PersonalAddPhoto(),
                    PersonalInfoAnketaForm(
                      nameCont: nameCont,
                      emailCont: emailCont,
                      phoneCont: phoneCont,
                      passCont: passCont,
                    ),
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: Column(
                        children: [
                          const Spacer(),
                          RoundedButton(
                            title: 'Сохранить изменения',
                            function: () {
                              context.read<AuthCubit>().changeInfo(
                                    UserModel(
                                      userName: nameCont.text,
                                      email: emailCont.text,
                                      phone: phoneCont.text,
                                    ),
                                  );
                              popPage(context);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
