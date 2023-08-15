// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:expo_kg/features/main_scaffold/presentation/cubit/location_cubit.dart';
import 'package:expo_kg/features/map/presentation/cubit/selected_location_cubit.dart';
import 'package:expo_kg/features/merchant/presentation/cubit/merchant_anketa_cubit.dart';
import 'package:expo_kg/features/merchant/presentation/widgets/add_photo.dart';
import 'package:expo_kg/features/merchant/presentation/widgets/textfield_title.dart';
import 'package:expo_kg/shared/configs/routes.dart';
import 'package:expo_kg/shared/constants/cubit_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';

import '../../../../shared/models/multiple_cubits.dart';
import 'textfield_button.dart';

class MerchantAnketaShopOnly extends StatelessWidget {
  const MerchantAnketaShopOnly({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MerchantAnketaCubit, MerchantAnketaState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextfieldWithTitle(
              title: 'ИНН',
              initialValue: state.inn,
              function: (String name) {
                context.read<MerchantAnketaCubit>().change(
                      inn: name,
                    );
              },
              validator: FormBuilderValidators.compose(
                [
                  FormBuilderValidators.required(
                    errorText: 'Заполните поле',
                  ),
                ],
              ),
            ),
            TextfieldWithTitle(
              title: 'Год основания магазина',
              initialValue: state.openedDate,
              function: (String name) {
                context.read<MerchantAnketaCubit>().change(
                      openedDate: name,
                    );
              },
              validator: FormBuilderValidators.compose(
                [
                  FormBuilderValidators.required(
                    errorText: 'Заполните поле',
                  ),
                ],
              ),
            ),
            const AddPhoto(),
            BlocBuilder<SelectedLocationCubit, SelectedLocationState>(
              builder: (context, state) {
                return TextfieldWithButton(
                  title: 'Адрес',
                  initialValue: state.location?.name ?? '',
                  buttonTitle: 'Указать на карте',
                  buttonFunction: () {
                    context.pushNamed(
                      RoutesNames.addressLocation,
                      extra: MultipleCubits(
                        cubits: {
                          CubitStrings.locationCubit:
                              BlocProvider.of<LocationCubit>(context),
                          CubitStrings.selectedLocationCubit:
                              BlocProvider.of<SelectedLocationCubit>(context),
                        },
                      ),
                    );
                  },
                );
              },
            ),
            TextfieldWithButton(
              title: 'Сайт',
              buttonTitle: '+ Добавить еще сайт',
              initialValue: state.website,
              textFunction: (String name) {
                context.read<MerchantAnketaCubit>().change(
                      website: name,
                    );
              },
            ),
          ],
        );
      },
    );
  }
}
