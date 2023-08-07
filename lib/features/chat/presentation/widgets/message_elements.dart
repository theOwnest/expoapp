import 'package:expo_kg/features/chat/presentation/cubit/chat_controller.dart';
import 'package:expo_kg/features/chat/presentation/cubit/chat_cubit.dart';
import 'package:expo_kg/features/chat/presentation/widgets/message_container.dart';
import 'package:expo_kg/shared/constants/margin.dart';
import 'package:expo_kg/shared/constants/sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessageElements extends StatelessWidget {
  const MessageElements({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: marginH,
        child: BlocBuilder<ChatCubit, ChatState>(
          builder: (context, state) {
            final chat = context.read<ChatCubit>().getById(
                  context.read<ChatController>().state.id,
                );
            return ListView.separated(
              reverse: true,
              padding: marginV,
              itemBuilder: (context, index) => MessageContainer(
                message: chat.messages[chat.messages.length - index - 1],
              ),
              separatorBuilder: (context, index) => sizedbox10,
              itemCount: chat.messages.length,
            );
          },
        ),
      ),
    );
  }
}
