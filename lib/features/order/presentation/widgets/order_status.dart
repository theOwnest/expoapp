import 'package:expo_kg/features/order/presentation/cubit/order_controller.dart';
import 'package:expo_kg/shared/configs/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderInfoStatus extends StatelessWidget {
  const OrderInfoStatus({super.key});

  @override
  Widget build(BuildContext context) {
    final order = context.read<OrderController>().state;
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Статус заказа',
                style: h14,
              ),
              Text(
                order.status.name,
                style: st14,
              ),
            ],
          ),
          const SizedBox(
            height: 35,
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Способ доставки',
                style: h14,
              ),
              Text(
                'Доставка курьером',
                style: st14,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
