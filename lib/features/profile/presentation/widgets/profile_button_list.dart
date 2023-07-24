import 'package:expo_kg/shared/configs/texts.dart';
import 'package:flutter/material.dart';

class ProfileButtonsList extends StatelessWidget {
  const ProfileButtonsList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ProfileButtonContainer(
          title: 'История покупок',
        ),
        ProfileButtonContainer(
          title: 'Отслеживание статуса',
        ),
        ProfileButtonContainer(
          title: 'Способы оплаты',
        ),
        ProfileButtonContainer(
          title: 'Личные данные',
        ),
        ProfileButtonContainer(
          title: 'Настройка уведомлений',
        ),
      ],
    );
  }
}

class ProfileButtonContainer extends StatelessWidget {
  const ProfileButtonContainer({
    Key? key,
    required this.title,
    this.function,
  }) : super(key: key);
  final String title;
  final Function? function;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: h14,
            ),
            const Icon(
              Icons.arrow_forward_ios,
            ),
          ],
        ),
        const Divider(
          height: 30,
          thickness: 1,
        ),
      ],
    );
  }
}
