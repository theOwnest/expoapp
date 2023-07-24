import 'package:expo_kg/shared/configs/texts.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Scaffold(
        appBar: AppBar(),
        body: const Column(
          children: [
            Text(
              'Регистрация',
              style: h24,
            ),
            Text(
              'Для того чтобы оформлять заказы необходимо пройти регистрацию по номеру телефона',
              style: st14,
            ),
          ],
        ),
      ),
    );
  }
}
