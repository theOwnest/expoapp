// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:expo_kg/features/merchant/presentation/widgets/add_photo.dart';
import 'package:expo_kg/features/merchant/presentation/widgets/textfield_title.dart';
import 'package:flutter/material.dart';

import 'textfield_button.dart';

class MerchantAnketaShopOnly extends StatelessWidget {
  const MerchantAnketaShopOnly({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextfieldWithTitle(
          title: 'ИНН',
        ),
        TextfieldWithTitle(
          title: 'Год основания магазина',
        ),
        AddPhoto(),
        TextfieldWithButton(
          title: 'Адрес',
          buttonTitle: 'Указать на карте',
        ),
        TextfieldWithButton(
          title: 'Сайт',
          buttonTitle: '+ Добавить еще сайт',
        ),
      ],
    );
  }
}
