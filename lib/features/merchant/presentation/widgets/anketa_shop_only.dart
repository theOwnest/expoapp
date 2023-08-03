// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:expo_kg/features/merchant/presentation/cubit/merchant_anketa_cubit.dart';
import 'package:expo_kg/features/merchant/presentation/widgets/add_photo.dart';
import 'package:expo_kg/features/merchant/presentation/widgets/textfield_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            ),
            TextfieldWithTitle(
              title: 'Год основания магазина',
              initialValue: state.openedDate,
              function: (String name) {
                context.read<MerchantAnketaCubit>().change(
                      openedDate: name,
                    );
              },
            ),
            const AddPhoto(),
            const TextfieldWithButton(
              title: 'Адрес',
              buttonTitle: 'Указать на карте',
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
