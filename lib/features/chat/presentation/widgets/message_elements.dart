import 'package:expo_kg/features/chat/presentation/cubit/chat_controller.dart';
import 'package:expo_kg/features/chat/presentation/widgets/message_container.dart';
import 'package:expo_kg/shared/constants/margin.dart';
import 'package:expo_kg/shared/constants/sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessageElements extends StatelessWidget {
  const MessageElements({super.key});

  @override
  Widget build(BuildContext context) {
    final chat = context.read<ChatController>().state;
    return Expanded(
      child: Padding(
        padding: marginH,
        child: ListView.separated(
          padding: marginV,
          itemBuilder: (context, index) => MessageContainer(
            message: chat.messages[index],
          ),
          separatorBuilder: (context, index) => sizedbox10,
          itemCount: chat.messages.length,
        ),
      ),
    );
  }
}
