// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:expo_kg/features/merchant/data/enums/merchant_type.dart';
import 'package:expo_kg/features/merchant/presentation/cubit/merchant_anketa_cubit.dart';
import 'package:expo_kg/features/merchant/presentation/cubit/merchant_type_cont.dart';
import 'package:expo_kg/shared/configs/texts.dart';
import 'package:expo_kg/shared/constants/colors.dart';
import 'package:expo_kg/shared/constants/sizedbox.dart';
import 'package:expo_kg/shared/widgets/selectable_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class MerchantAnketaForm extends StatelessWidget {
  const MerchantAnketaForm({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MerchantAnketaCubit, MerchantAnketaState>(
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
              initialValue: state.anketa?.fullName ?? '',
              onChanged: (value) {
                context.read<MerchantAnketaCubit>().change(
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
                    sizedboxH15,
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
            sizedbox10,
            const Text(
              'Почта',
              style: h14,
            ),
            FormBuilderTextField(
              name: 'Почта/номер',
              autovalidateMode: AutovalidateMode.onUserInteraction,
              initialValue: state.anketa?.email ?? '',
              onChanged: (value) {
                context.read<MerchantAnketaCubit>().change(
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
                    sizedboxH15,
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
            sizedbox10,
            const Text(
              'Номер телефона',
              style: h14,
            ),
            FormBuilderTextField(
              textInputAction: TextInputAction.done,
              name: 'Номер телефона',
              autovalidateMode: AutovalidateMode.onUserInteraction,
              initialValue: state.anketa?.phone ?? '',
              onChanged: (value) {
                context.read<MerchantAnketaCubit>().change(
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
                    sizedboxH15,
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
                sizedbox10,
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
                        sizedboxH15,
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
    );
  }
}
