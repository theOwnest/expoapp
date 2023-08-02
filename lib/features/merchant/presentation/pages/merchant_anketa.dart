import 'package:expo_kg/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:expo_kg/features/auth/presentation/cubit/button_available.dart';
import 'package:expo_kg/features/merchant/data/enums/merchant_type.dart';
import 'package:expo_kg/features/merchant/presentation/cubit/anketa_controller.dart';
import 'package:expo_kg/features/merchant/presentation/cubit/merchant_type_cont.dart';
import 'package:expo_kg/features/merchant/presentation/widgets/anketa_shop_only.dart';
import 'package:expo_kg/features/merchant/presentation/widgets/merchant_form.dart';
import 'package:expo_kg/shared/constants/colors.dart';
import 'package:expo_kg/shared/constants/margin.dart';
import 'package:expo_kg/shared/constants/sizedbox.dart';
import 'package:expo_kg/shared/widgets/appbar_title.dart';
import 'package:expo_kg/shared/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import '../widgets/textfield_button.dart';
import '../widgets/textfield_title.dart';

class MerchantAnketa extends StatelessWidget {
  const MerchantAnketa({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AnketaController()
            ..init(
              context.read<AuthCubit>().state,
            ),
        ),
        BlocProvider(
          create: (context) => ButtonAvailableCont(),
        ),
        BlocProvider(
          create: (context) => MerchantTypeCont(),
        ),
      ],
      child: Builder(builder: (context) {
        return KeyboardDismisser(
          child: Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  const AppbarTitle(
                    title: 'Анкета продавца',
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: marginHV15,
                        child: Column(
                          children: [
                            const MerchantAnketaForm(),
                            const Column(
                              children: [
                                TextfieldWithTitle(
                                  title: 'Название магазина',
                                ),
                                TextfieldWithTitle(
                                  title: 'Описание рода деятельности',
                                ),
                              ],
                            ),
                            BlocBuilder<MerchantTypeCont, MerchantTypeEnum>(
                              builder: (context, state) {
                                if (state == MerchantTypeEnum.shop) {
                                  return const MerchantAnketaShopOnly();
                                }
                                return const SizedBox.shrink();
                              },
                            ),
                            const Column(
                              children: [
                                TextfieldWithButton(
                                  title: 'Мессенджеры',
                                  buttonTitle: '+ Добавить мессенджер',
                                ),
                                TextfieldWithButton(
                                  title: 'Рабочий телефон',
                                  buttonTitle: '+ Добавить еще телефон',
                                ),
                              ],
                            ),
                            sizedbox35,
                            BlocBuilder<ButtonAvailableCont, bool>(
                              builder: (context, state) {
                                return RoundedButton(
                                  title: 'Готово',
                                  color: state
                                      ? AppColor.orange
                                      : AppColor.orange.withOpacity(
                                          0.2,
                                        ),
                                  textColor:
                                      state ? AppColor.white : AppColor.orange,
                                  function: state ? () {} : null,
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
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
