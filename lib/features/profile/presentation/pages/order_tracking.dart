import 'package:expo_kg/features/profile/data/datasources/order_history.dart';
import 'package:expo_kg/features/profile/data/enums/order_status.dart';
import 'package:expo_kg/features/profile/presentation/widgets/order_container.dart';
import 'package:expo_kg/shared/constants/margin.dart';
import 'package:expo_kg/shared/widgets/appbar_title.dart';
import 'package:flutter/material.dart';

class OrderTracking extends StatelessWidget {
  const OrderTracking({super.key});

  @override
  Widget build(BuildContext context) {
    final orders = orderHistoryList
        .where(
          (element) => element.status == OrderStatus.pending,
        )
        .toList();
    return Column(
      children: [
        const AppbarTitle(title: 'История покупок'),
        Expanded(
          child: ListView.separated(
            padding: marginHV10,
            itemBuilder: (context, index) => OrderContainer(
              order: orders[index],
            ),
            separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
            itemCount: orders.length,
          ),
        ),
      ],
    );
  }
}
