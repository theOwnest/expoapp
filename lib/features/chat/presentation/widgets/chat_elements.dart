import 'package:expo_kg/features/chat/presentation/cubit/chat_cubit.dart';
import 'package:expo_kg/features/chat/presentation/widgets/chat_container.dart';
import 'package:expo_kg/shared/constants/sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatElements extends StatelessWidget {
  const ChatElements({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<ChatCubit, ChatState>(
        builder: (context, state) {
          return ListView.separated(
            itemBuilder: (context, index) => ChatContainer(
              chat: state.chats[index],
            ),
            separatorBuilder: (context, index) => sizedbox10,
            itemCount: state.chats.length,
          );
        },
      ),
    );
  }
}
