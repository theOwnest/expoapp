// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:expo_kg/features/merchant/data/enums/merchant_type.dart';
import 'package:expo_kg/features/merchant/data/models/anketa.dart';
import 'package:expo_kg/features/merchant/presentation/cubit/anketa_controller.dart';
import 'package:expo_kg/features/merchant/presentation/cubit/merchant_type_cont.dart';
import 'package:expo_kg/shared/configs/texts.dart';
import 'package:expo_kg/shared/constants/colors.dart';
import 'package:expo_kg/shared/constants/sizedbox.dart';
import 'package:expo_kg/shared/widgets/selectable_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../auth/presentation/cubit/button_available.dart';

class MerchantAnketaForm extends StatefulWidget {
  const MerchantAnketaForm({
    Key? key,
  }) : super(key: key);
  @override
  State<MerchantAnketaForm> createState() => _MerchantAnketaFormState();
}

class _MerchantAnketaFormState extends State<MerchantAnketaForm> {
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      onChanged: () {
        context.read<ButtonAvailableCont>().change(
              _formKey.currentState!.isValid,
            );
      },
      child: BlocBuilder<AnketaController, AnketaModel>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'ФИО',
                style: h14,
              ),
              FormBuilderTextField(
                name: 'ФИО',
                textInputAction: TextInputAction.next,
                style: st14.copyWith(
                  color: AppColor.black,
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                initialValue: state.fullName,
                onChanged: (value) {
                  context.read<AnketaController>().change(
                        fullName: value,
                      );
                },
                decoration: InputDecoration(
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColor.lightGrey,
                    ),
                  ),
                  prefixIconConstraints: const BoxConstraints(
                    maxHeight: 20,
                  ),
                  prefixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/icons/login/person.png',
                        color: AppColor.lightGrey,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                    ],
                  ),
                ),
                validator: FormBuilderValidators.compose(
                  [
                    FormBuilderValidators.required(
                      errorText: 'Заполните поле',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Почта',
                style: h14,
              ),
              FormBuilderTextField(
                name: 'Почта/номер',
                autovalidateMode: AutovalidateMode.onUserInteraction,
                initialValue: state.email,
                onChanged: (value) {
                  context.read<AnketaController>().change(
                        email: value,
                      );
                },
                textInputAction: TextInputAction.next,
                style: st14.copyWith(
                  color: AppColor.black,
                ),
                decoration: InputDecoration(
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColor.lightGrey,
                    ),
                  ),
                  prefixIconConstraints: const BoxConstraints(
                    maxHeight: 20,
                  ),
                  prefixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/icons/login/email.png',
                        color: AppColor.lightGrey,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                    ],
                  ),
                ),
                validator: FormBuilderValidators.compose(
                  [
                    FormBuilderValidators.required(
                      errorText: 'Заполните поле',
                    ),
                    FormBuilderValidators.email(
                      errorText: 'Неверно введена почта/номер',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Номер телефона',
                style: h14,
              ),
              FormBuilderTextField(
                textInputAction: TextInputAction.done,
                name: 'Номер телефона',
                autovalidateMode: AutovalidateMode.onUserInteraction,
                initialValue: state.phone,
                onChanged: (value) {
                  context.read<AnketaController>().change(
                        phone: value,
                      );
                },
                style: st14.copyWith(
                  color: AppColor.black,
                ),
                decoration: InputDecoration(
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColor.lightGrey,
                    ),
                  ),
                  prefixIconConstraints: const BoxConstraints(
                    maxHeight: 20,
                  ),
                  prefixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/icons/login/phone.png',
                        color: AppColor.lightGrey,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                    ],
                  ),
                ),
                validator: FormBuilderValidators.compose(
                  [
                    FormBuilderValidators.required(
                      errorText: 'Заполните поле',
                    ),
                  ],
                ),
              ),
              sizedbox35,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Тип продавца',
                    style: h14,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  BlocBuilder<MerchantTypeCont, MerchantTypeEnum>(
                    builder: (context, state) {
                      return Row(
                        children: [
                          SelectableButton(
                            title: 'Магазин',
                            isSelected: state == MerchantTypeEnum.shop,
                            function: () {
                              context.read<MerchantTypeCont>().change(
                                    MerchantTypeEnum.shop,
                                  );
                            },
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          SelectableButton(
                            title: 'Юр. лицо',
                            isSelected: state == MerchantTypeEnum.person,
                            function: () {
                              context.read<MerchantTypeCont>().change(
                                    MerchantTypeEnum.person,
                                  );
                            },
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
