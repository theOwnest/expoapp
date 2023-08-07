import 'package:expo_kg/features/chat/presentation/cubit/chat_search.dart';
import 'package:expo_kg/features/chat/presentation/widgets/chat_elements.dart';
import 'package:expo_kg/features/chat/presentation/widgets/chat_search.dart';
import 'package:expo_kg/shared/constants/margin.dart';
import 'package:expo_kg/shared/constants/sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatSearchController(),
      child: const Padding(
        padding: marginHV10,
        child: Column(
          children: [
            ChatSearchbar(),
            sizedbox25,
            ChatAllElements(),
          ],
        ),
      ),
    );
  }
}
