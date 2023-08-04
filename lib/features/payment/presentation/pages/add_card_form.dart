import 'dart:developer';

import 'package:expo_kg/features/auth/presentation/cubit/button_available.dart';
import 'package:expo_kg/shared/configs/texts.dart';
import 'package:expo_kg/shared/constants/border.dart';
import 'package:expo_kg/shared/constants/colors.dart';
import 'package:expo_kg/shared/constants/margin.dart';
import 'package:expo_kg/shared/widgets/appbar_title.dart';
import 'package:expo_kg/shared/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:go_router/go_router.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import '../../../../shared/constants/sizedbox.dart';
import '../cubit/card_controller.dart';

class AddCardPage extends StatefulWidget {
  const AddCardPage({super.key});

  @override
  State<AddCardPage> createState() => _AddCardPageState();
}

class _AddCardPageState extends State<AddCardPage> {
  final _formCardKey = GlobalKey<FormState>();
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool useGlassMorphism = false;
  bool useBackgroundImage = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ButtonAvailableCont(),
      child: Builder(builder: (context) {
        return KeyboardDismisser(
          behavior: HitTestBehavior.opaque,
          child: Column(
            children: [
              const AppbarTitle(
                title: 'Новая карта',
              ),
              Expanded(
                child: Padding(
                  padding: marginH,
                  child: Column(
                    children: [
                      CreditCardForm(
                        formKey: _formCardKey,
                        obscureCvv: true,
                        cardNumber: cardNumber,
                        cvvCode: cvvCode,
                        isHolderNameVisible: true,
                        isCardNumberVisible: true,
                        isExpiryDateVisible: true,
                        cardHolderName: cardHolderName,
                        expiryDate: expiryDate,
                        themeColor: AppColor.lightGrey,
                        cardNumberDecoration: const InputDecoration(
                          labelText: 'Номер карты',
                          labelStyle: h14,
                          hintText: 'XXXX XXXX XXXX XXXX',
                          focusedBorder: underlineInputBorder,
                          enabledBorder: underlineInputBorder,
                        ),
                        expiryDateDecoration: const InputDecoration(
                          labelText: 'Срок действия',
                          labelStyle: h14,
                          focusedBorder: underlineInputBorder,
                          enabledBorder: underlineInputBorder,
                          hintText: 'XX/XX',
                        ),
                        cvvCodeDecoration: const InputDecoration(
                          labelText: 'CVV / CVC',
                          labelStyle: h14,
                          focusedBorder: underlineInputBorder,
                          enabledBorder: underlineInputBorder,
                          hintText: 'XXX',
                        ),
                        cardHolderDecoration: const InputDecoration(
                          labelText: 'Имя владельца карты',
                          labelStyle: h14,
                          focusedBorder: underlineInputBorder,
                          enabledBorder: underlineInputBorder,
                        ),
                        onCreditCardModelChange: (CreditCardModel card) {
                          onCreditCardModelChange(
                            context,
                            card,
                          );
                        },
                      ),
                      const Spacer(),
                      BlocBuilder<ButtonAvailableCont, bool>(
                        builder: (context, state) {
                          return RoundedButton(
                            title: 'Сохранить изменения',
                            color: state
                                ? AppColor.orange
                                : AppColor.orange.withOpacity(
                                    0.2,
                                  ),
                            textColor: state ? AppColor.white : AppColor.orange,
                            function: state
                                ? () {
                                    context.read<CardController>().addCard(
                                          CreditCardModel(
                                            cardNumber,
                                            expiryDate,
                                            cardHolderName,
                                            cvvCode,
                                            isCvvFocused,
                                          ),
                                        );
                                    if (context.canPop()) context.pop();
                                  }
                                : null,
                          );
                        },
                      ),
                      sizedbox15,
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  void onValidate() {
    if (_formCardKey.currentState!.validate()) {
      log('valid!');
    } else {
      log('invalid!');
    }
  }

  void onCreditCardModelChange(
      BuildContext context, CreditCardModel? creditCardModel) {
    context.read<ButtonAvailableCont>().change(
          _formCardKey.currentState!.validate(),
        );
    setState(() {
      cardNumber = creditCardModel!.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}
