import 'package:expo_kg/shared/configs/texts.dart';
import 'package:expo_kg/shared/widgets/rounded_button.dart';
import 'package:flutter/material.dart';

class OrderTotalPrice extends StatelessWidget {
  const OrderTotalPrice({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Стоимость',
                style: st14,
              ),
              Text(
                '2 599 KGS',
                style: h24,
              ),
            ],
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: RoundedButton(
              title: 'Повторить заказ',
            ),
          ),
        ],
      ),
    );
  }
}
