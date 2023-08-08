import 'package:expo_kg/features/chat/presentation/cubit/chat_controller.dart';
import 'package:expo_kg/features/chat/presentation/cubit/chat_cubit.dart';
import 'package:expo_kg/features/chat/presentation/widgets/chat_appbar.dart';
import 'package:expo_kg/features/chat/presentation/widgets/chat_textfield.dart';
import 'package:expo_kg/features/chat/presentation/widgets/message_elements.dart';
import 'package:expo_kg/shared/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class MessagingPage extends StatelessWidget {
  const MessagingPage({
    Key? key,
    required this.chatId,
  }) : super(key: key);
  final String chatId;
  @override
  Widget build(BuildContext context) {
    final chat = context.read<ChatCubit>().getById(chatId);
    return BlocProvider(
      create: (context) => ChatController(chat),
      child: const KeyboardDismisser(
        child: Scaffold(
          backgroundColor: AppColor.white,
          body: SafeArea(
            child: Column(
              children: [
                ChatAppBar(),
                MessageElements(),
                ChatTextfield(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
