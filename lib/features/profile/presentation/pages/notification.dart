import 'package:expo_kg/shared/constants/margin.dart';
import 'package:expo_kg/shared/widgets/appbar_title.dart';
import 'package:expo_kg/shared/widgets/switch_title.dart';
import 'package:flutter/material.dart';

class NotificationSettings extends StatelessWidget {
  const NotificationSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        AppbarTitle(title: 'Настройки уведомлений'),
        Expanded(
          child: Padding(
            padding: marginHV10,
            child: Column(
              children: [
                SwitchTitleButton(
                  title: 'Получать письма на почту',
                ),
                SwitchTitleButton(
                  title: 'Получать СМС',
                ),
                SwitchTitleButton(
                  title: 'Персональные предложения',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
