import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          height: 60,
          child: Text(
            'Home',
          ),
        ),
        Expanded(
          child: Center(
            child: Text(
              'Home',
            ),
          ),
        ),
      ],
    );
  }
}
