import 'package:expo_kg/features/home/presentation/widgets/product_list_container.dart';
import 'package:expo_kg/features/order/presentation/cubit/order_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderProducts extends StatelessWidget {
  const OrderProducts({super.key});

  @override
  Widget build(BuildContext context) {
    final order = context.read<OrderController>().state;
    return SliverList.separated(
      itemBuilder: (context, index) => ProductListContainer(
        product: order.products[index],
      ),
      separatorBuilder: (context, index) => const SizedBox(
        height: 10,
      ),
      itemCount: order.products.length,
    );
  }
}
