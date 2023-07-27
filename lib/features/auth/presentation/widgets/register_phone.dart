import 'dart:developer';

import 'package:expo_kg/features/auth/presentation/cubit/phone_controller.dart';
import 'package:expo_kg/shared/configs/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../cubit/button_available.dart';

class RegisterPhoneField extends StatefulWidget {
  const RegisterPhoneField({super.key});

  @override
  State<RegisterPhoneField> createState() => _RegisterPhoneFieldState();
}

class _RegisterPhoneFieldState extends State<RegisterPhoneField> {
  final TextEditingController controller = TextEditingController();
  String initialCountry = 'RU';
  PhoneNumber number = PhoneNumber(isoCode: 'RU');
  @override
  Widget build(BuildContext context) {
    return InternationalPhoneNumberInput(
      onInputChanged: (PhoneNumber number) {
        context.read<PhoneController>().change(number.phoneNumber);
      },
      onInputValidated: (value) {
        context.read<ButtonAvailableCont>().change(value);
      },
      selectorConfig: const SelectorConfig(
        selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
      ),
      ignoreBlank: false,
      autoValidateMode: AutovalidateMode.always,
      selectorTextStyle: st14,
      initialValue: number,
      textFieldController: controller,
      formatInput: true,
      keyboardType:
          const TextInputType.numberWithOptions(signed: true, decimal: true),
      inputBorder: const UnderlineInputBorder(),
      errorMessage: 'Введите номер телефона',
      textStyle: st14,
      spaceBetweenSelectorAndTextField: 0,
      hintText: '',
      onSaved: (PhoneNumber number) {
        log('On Saved: $number');
      },
    );
  }
}
