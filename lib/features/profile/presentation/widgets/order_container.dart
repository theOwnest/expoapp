// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:expo_kg/features/profile/data/enums/order_status.dart';
import 'package:expo_kg/features/profile/data/models/order.dart';
import 'package:expo_kg/shared/configs/routes.dart';
import 'package:expo_kg/shared/configs/texts.dart';
import 'package:expo_kg/shared/constants/border.dart';
import 'package:expo_kg/shared/constants/border_radius.dart';
import 'package:expo_kg/shared/constants/colors.dart';
import 'package:expo_kg/shared/constants/margin.dart';
import 'package:expo_kg/shared/constants/sizedbox.dart';
import 'package:expo_kg/shared/extensions/datetime.dart';
import 'package:expo_kg/shared/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OrderContainer extends StatelessWidget {
  const OrderContainer({
    Key? key,
    required this.order,
  }) : super(key: key);
  final OrderModel order;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(
          RoutesNames.orderInfo,
          extra: order,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          border: commonThinBorder,
          borderRadius: borderR10,
        ),
        padding: marginHV15,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Заказ: ${order.id.substring(order.id.length - 7)}',
                  style: h18,
                ),
                Text(
                  order.address,
                  style: h14,
                ),
              ],
            ),
            sizedbox15,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Заказ создан',
                      style: h14,
                    ),
                    Text(
                      order.createdAt.toRussianTime(),
                      style: st14,
                    ),
                  ],
                ),
                if (order.status == OrderStatus.delivered)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Доставлено',
                        style: h14,
                      ),
                      Text(
                        order.createdAt.toRussianTime(),
                        style: st14,
                      ),
                    ],
                  ),
              ],
            ),
            sizedbox15,
            if (order.status == OrderStatus.pending)
              RoundedButton(
                title: 'Смотреть на карте',
                height: 40,
                function: () {
                  context.pushNamed(
                    RoutesNames.deliveryLocation,
                  );
                },
              ),
            sizedbox15,
            SizedBox(
              height: 50,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 6,
                  crossAxisSpacing: 10,
                ),
                itemCount:
                    order.products.length > 6 ? 6 : order.products.length,
                itemBuilder: (context, index) => Container(
                  decoration: BoxDecoration(
                    color: AppColor.lightGrey,
                    borderRadius: borderR10,
                  ),
                  padding: const EdgeInsets.all(3),
                  child: Image.asset(
                    order.products[index].images.first,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
