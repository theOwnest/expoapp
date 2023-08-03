// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:expo_kg/features/order/presentation/cubit/order_controller.dart';
import 'package:expo_kg/features/order/presentation/widgets/order_products.dart';
import 'package:expo_kg/features/order/presentation/widgets/order_specs.dart';
import 'package:expo_kg/features/order/presentation/widgets/order_status.dart';
import 'package:expo_kg/features/order/presentation/widgets/order_total_price.dart';
import 'package:expo_kg/features/profile/data/models/order.dart';
import 'package:expo_kg/shared/configs/texts.dart';
import 'package:expo_kg/shared/constants/margin.dart';
import 'package:expo_kg/shared/constants/sizedbox.dart';
import 'package:expo_kg/shared/widgets/appbar_title.dart';
import 'package:expo_kg/shared/widgets/custom_rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderInfo extends StatelessWidget {
  const OrderInfo({
    Key? key,
    required this.order,
  }) : super(key: key);
  final OrderModel order;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderController(order),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              AppbarTitle(
                title:
                    'Данные заказа № ${order.id.substring(order.id.length - 7)}',
              ),
              const Expanded(
                child: Padding(
                  padding: marginHV15,
                  child: CustomScrollView(
                    slivers: [
                      OrderInfoStatus(),
                      OrderSpecs(),
                      OrderTotalPrice(),
                      SliverToBoxAdapter(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            sizedbox35,
                            Text(
                              'Состав заказа',
                              style: h14,
                            ),
                            sizedbox15,
                          ],
                        ),
                      ),
                      OrderProducts(),
                      SliverToBoxAdapter(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            sizedbox35,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Оцените заказ',
                                  style: h14,
                                ),
                                CustomRatingContainer(
                                  rating: 0,
                                ),
                              ],
                            ),
                            sizedbox15,
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
