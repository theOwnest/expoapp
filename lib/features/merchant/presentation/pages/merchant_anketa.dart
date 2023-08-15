import 'package:expo_kg/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:expo_kg/features/auth/presentation/cubit/button_available.dart';
import 'package:expo_kg/features/main_scaffold/presentation/cubit/location_cubit.dart';
import 'package:expo_kg/features/map/presentation/cubit/selected_location_cubit.dart';
import 'package:expo_kg/features/merchant/data/enums/merchant_type.dart';
import 'package:expo_kg/features/merchant/presentation/cubit/merchant_anketa_cubit.dart';
import 'package:expo_kg/features/merchant/presentation/cubit/merchant_type_cont.dart';
import 'package:expo_kg/features/merchant/presentation/cubit/shop_images_controller.dart';
import 'package:expo_kg/features/merchant/presentation/widgets/anketa_shop_only.dart';
import 'package:expo_kg/features/merchant/presentation/widgets/merchant_form.dart';
import 'package:expo_kg/shared/configs/routes.dart';
import 'package:expo_kg/shared/constants/colors.dart';
import 'package:expo_kg/shared/constants/margin.dart';
import 'package:expo_kg/shared/constants/sizedbox.dart';
import 'package:expo_kg/shared/widgets/appbar_title.dart';
import 'package:expo_kg/shared/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import '../widgets/textfield_button.dart';
import '../widgets/textfield_title.dart';

class MerchantAnketa extends StatefulWidget {
  const MerchantAnketa({super.key});

  @override
  State<MerchantAnketa> createState() => _MerchantAnketaState();
}

class _MerchantAnketaState extends State<MerchantAnketa> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MerchantAnketaCubit()
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
        BlocProvider(
          create: (context) => ShopImagesCubit(),
        ),
        BlocProvider(
          create: (context) => LocationCubit(),
        ),
        BlocProvider(
          create: (context) => SelectedLocationCubit(),
        ),
      ],
      child: Builder(builder: (context) {
        return KeyboardDismisser(
          child: Scaffold(
            body: SafeArea(
              child: FormBuilder(
                key: _formKey,
                onChanged: () {
                  context.read<ButtonAvailableCont>().change(
                        _formKey.currentState!.isValid,
                      );
                },
                child: Column(
                  children: [
                    const AppbarTitle(
                      title: 'Анкета продавца',
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: marginHV15,
                          child: BlocBuilder<MerchantAnketaCubit,
                              MerchantAnketaState>(
                            builder: (context, state) {
                              return Column(
                                children: [
                                  const MerchantAnketaForm(),
                                  Column(
                                    children: [
                                      TextfieldWithTitle(
                                        title: 'Название магазина',
                                        initialValue: state.shopName,
                                        function: (String name) {
                                          context
                                              .read<MerchantAnketaCubit>()
                                              .change(
                                                shopName: name,
                                              );
                                        },
                                        validator:
                                            FormBuilderValidators.compose(
                                          [
                                            FormBuilderValidators.required(
                                              errorText: 'Заполните поле',
                                            ),
                                          ],
                                        ),
                                      ),
                                      TextfieldWithTitle(
                                        title: 'Описание рода деятельности',
                                        initialValue: state.description,
                                        function: (String name) {
                                          context
                                              .read<MerchantAnketaCubit>()
                                              .change(
                                                description: name,
                                              );
                                        },
                                        validator:
                                            FormBuilderValidators.compose(
                                          [
                                            FormBuilderValidators.required(
                                              errorText: 'Заполните поле',
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  BlocBuilder<MerchantTypeCont,
                                      MerchantTypeEnum>(
                                    builder: (context, state) {
                                      if (state == MerchantTypeEnum.shop) {
                                        return const MerchantAnketaShopOnly();
                                      }
                                      return const SizedBox.shrink();
                                    },
                                  ),
                                  Column(
                                    children: [
                                      TextfieldWithButton(
                                        title: 'Мессенджеры',
                                        buttonTitle: '+ Добавить мессенджер',
                                        initialValue: state.messenger,
                                        textFunction: (String name) {
                                          context
                                              .read<MerchantAnketaCubit>()
                                              .change(
                                                messenger: name,
                                              );
                                        },
                                      ),
                                      TextfieldWithButton(
                                        title: 'Рабочий телефон',
                                        buttonTitle: '+ Добавить еще телефон',
                                        initialValue: state.workPhone,
                                        textFunction: (String name) {
                                          context
                                              .read<MerchantAnketaCubit>()
                                              .change(
                                                workPhone: name,
                                              );
                                        },
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
                                        textColor: state
                                            ? AppColor.white
                                            : AppColor.orange,
                                        function: state
                                            ? () {
                                                if (context
                                                        .read<
                                                            MerchantTypeCont>()
                                                        .state ==
                                                    MerchantTypeEnum.shop) {
                                                  context
                                                      .read<AuthCubit>()
                                                      .addShop(
                                                        context
                                                            .read<
                                                                MerchantAnketaCubit>()
                                                            .state
                                                            .getshop,
                                                      );
                                                }
                                                if (context
                                                        .read<
                                                            MerchantTypeCont>()
                                                        .state ==
                                                    MerchantTypeEnum.person) {
                                                  context
                                                      .read<AuthCubit>()
                                                      .addMerchant(
                                                        context
                                                            .read<
                                                                MerchantAnketaCubit>()
                                                            .state
                                                            .getMerchant,
                                                      );
                                                }
                                                context.goNamed(
                                                  RoutesNames.profile,
                                                );
                                              }
                                            : null,
                                      );
                                    },
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
