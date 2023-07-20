import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          height: 60,
          child: Text(
            'Chat',
          ),
        ),
        Expanded(
          child: Center(
            child: Text(
              'Chat',
            ),
          ),
        ),
      ],
    );
  }
}
