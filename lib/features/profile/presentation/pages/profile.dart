import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          height: 60,
          child: Text(
            'Profile',
          ),
        ),
        Expanded(
          child: Center(
            child: Text(
              'Profile',
            ),
          ),
        ),
      ],
    );
  }
}
