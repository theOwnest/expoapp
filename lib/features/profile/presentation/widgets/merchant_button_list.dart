import 'package:expo_kg/shared/configs/routes.dart';
import 'package:expo_kg/shared/widgets/forward_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileMerchantButtonsList extends StatelessWidget {
  const ProfileMerchantButtonsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ForwardButton(
          title: 'Мои объявления',
        ),
        ForwardButton(
          title: 'История покупок',
          function: () {
            context.pushNamed(
              RoutesNames.profileOrderHistory,
            );
          },
        ),
        const ForwardButton(
          title: 'Вывод стредств',
        ),
        const ForwardButton(
          title: 'Данные магазина',
        ),
        ForwardButton(
          title: 'Отслеживание статуса',
          function: () {
            context.pushNamed(
              RoutesNames.profileOrderTracking,
            );
          },
        ),
        const ForwardButton(
          title: 'Настройка уведомлений',
        ),
      ],
    );
  }
}
