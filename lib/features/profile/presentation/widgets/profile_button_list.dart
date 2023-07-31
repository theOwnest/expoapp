import 'package:expo_kg/shared/configs/routes.dart';
import 'package:expo_kg/shared/configs/texts.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileButtonsList extends StatelessWidget {
  const ProfileButtonsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileButtonContainer(
          title: 'История покупок',
          function: () {
            context.pushNamed(
              RoutesNames.profileOrderHistory,
            );
          },
        ),
        ProfileButtonContainer(
          title: 'Отслеживание статуса',
          function: () {
            context.pushNamed(
              RoutesNames.profileOrderTracking,
            );
          },
        ),
        const ProfileButtonContainer(
          title: 'Способы оплаты',
        ),
        const ProfileButtonContainer(
          title: 'Личные данные',
        ),
        const ProfileButtonContainer(
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
    return GestureDetector(
      onTap: () {
        if (function != null) {
          function!();
        }
      },
      child: Column(
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
      ),
    );
  }
}
