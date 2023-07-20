import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          height: 60,
          child: Text(
            'Favorite',
          ),
        ),
        Expanded(
          child: Center(
            child: Text(
              'Favorite',
            ),
          ),
        ),
      ],
    );
  }
}
