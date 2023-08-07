// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:expo_kg/features/chat/data/models/chat.dart';
import 'package:expo_kg/features/chat/data/utils/search_chat.dart';
import 'package:expo_kg/features/chat/presentation/cubit/chat_cubit.dart';
import 'package:expo_kg/features/chat/presentation/cubit/chat_search.dart';
import 'package:expo_kg/features/chat/presentation/widgets/chat_container.dart';
import 'package:expo_kg/shared/constants/sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatAllElements extends StatelessWidget {
  const ChatAllElements({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<ChatCubit, ChatState>(
        builder: (context, state) {
          return ChatSearchedElements(
            allChats: state.chats,
          );
        },
      ),
    );
  }
}

class ChatSearchedElements extends StatelessWidget {
  const ChatSearchedElements({
    Key? key,
    required this.allChats,
  }) : super(key: key);
  final List<ChatModel> allChats;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatSearchController, String?>(
      builder: (context, state) {
        List<ChatModel> chats =
            state != null ? searchChat(state, allChats) : allChats;
        return ListView.separated(
          itemBuilder: (context, index) => ChatContainer(
            chat: chats[index],
          ),
          separatorBuilder: (context, index) => sizedbox10,
          itemCount: chats.length,
        );
      },
    );
  }
}
