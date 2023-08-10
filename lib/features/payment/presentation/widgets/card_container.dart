// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:expo_kg/shared/configs/texts.dart';
import 'package:expo_kg/shared/constants/border.dart';
import 'package:expo_kg/shared/constants/border_radius.dart';
import 'package:expo_kg/shared/constants/margin.dart';
import 'package:expo_kg/shared/constants/sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

import '../cubit/selected_card.dart';

class CardContainer extends StatelessWidget {
  const CardContainer({
    Key? key,
    required this.card,
    required this.index,
  }) : super(key: key);
  final CreditCardModel card;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<SelectedCard>().change(index);
      },
      child: Container(
        height: 63,
        padding: marginH,
        decoration: BoxDecoration(
          border: commonThinBorder,
          borderRadius: borderR10,
        ),
        child: Row(
          children: [
            BlocBuilder<SelectedCard, int>(
              builder: (context, state) {
                return state == index
                    ? Image.asset(
                        'assets/icons/product/subtract.png',
                        height: 22,
                      )
                    : Container(
                        height: 22,
                        width: 22,
                        decoration: BoxDecoration(
                          borderRadius: borderRC,
                          border: commonThinBorder,
                        ),
                      );
              },
            ),
            sizedboxH15,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${card.cardHolderName} *${card.cardNumber.substring(15, 19)}',
                  style: h18,
                ),
                Text(
                  '${card.expiryDate.substring(0, 2)}/${card.expiryDate.substring(3, 5)}',
                  style: st14,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
