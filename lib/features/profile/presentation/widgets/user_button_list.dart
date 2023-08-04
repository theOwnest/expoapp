import 'package:expo_kg/shared/configs/routes.dart';
import 'package:expo_kg/shared/widgets/forward_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileUserButtonsList extends StatelessWidget {
  const ProfileUserButtonsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ForwardButton(
          title: 'История покупок',
          function: () {
            context.pushNamed(
              RoutesNames.profileOrderHistory,
            );
          },
        ),
        ForwardButton(
          title: 'Отслеживание статуса',
          function: () {
            context.pushNamed(
              RoutesNames.profileOrderTracking,
            );
          },
        ),
        ForwardButton(
          title: 'Способы оплаты',
          function: () {
            context.pushNamed(
              RoutesNames.paymentMethod,
            );
          },
        ),
        const ForwardButton(
          title: 'Личные данные',
        ),
        const ForwardButton(
          title: 'Настройка уведомлений',
        ),
      ],
    );
  }
}
