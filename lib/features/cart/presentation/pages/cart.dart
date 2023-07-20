import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          height: 60,
          child: Text(
            'Cart',
          ),
        ),
        Expanded(
          child: Center(
            child: Text(
              'Cart',
            ),
          ),
        ),
      ],
    );
  }
}
