import 'package:expo_kg/shared/configs/texts.dart';
import 'package:expo_kg/shared/constants/colors.dart';
import 'package:expo_kg/shared/constants/divider.dart';
import 'package:expo_kg/shared/widgets/rounded_button.dart';
import 'package:flutter/material.dart';

class OrderSpecs extends StatelessWidget {
  const OrderSpecs({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 35,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Характеристики',
              style: h14,
            ),
            SizedBox(
              height: 20,
            ),
            ProductSpecContainer(
              title: 'Дата оформления ',
              value: '14.01.2022 в 15:30',
            ),
            ProductSpecContainer(
              title: 'Дата доставки',
              value: '16.01.2022, с 9:00 до 18:00',
            ),
            ProductSpecContainer(
              title: 'Стоимсоть доставки ',
              value: 'Бесплтано',
            ),
            ProductSpecContainer(
              title: 'Сбособ оплаты',
              value: 'Картой Master Card •1234',
            ),
            ProductSpecContainer(
              title: 'Адрес доставки',
              value: 'улица Центральная, д. 15',
            ),
            ProductSpecContainer(
              title: 'Получатель',
              value: 'Иван Иванов \n+7 (912) 345 67 89',
            ),
            RoundedButton(
              title: 'Электронный чек',
              color: AppColor.black,
              height: 60,
            ),
          ],
        ),
      ),
    );
  }
}

class ProductSpecContainer extends StatelessWidget {
  const ProductSpecContainer({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: st14,
            ),
            Text(
              value,
              textAlign: TextAlign.end,
              style: h14,
            ),
          ],
        ),
        divider30,
      ],
    );
  }
}
