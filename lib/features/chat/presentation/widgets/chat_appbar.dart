import 'package:expo_kg/features/chat/presentation/cubit/chat_controller.dart';
import 'package:expo_kg/shared/configs/texts.dart';
import 'package:expo_kg/shared/constants/colors.dart';
import 'package:expo_kg/shared/constants/margin.dart';
import 'package:expo_kg/shared/constants/sizedbox.dart';
import 'package:expo_kg/shared/widgets/appbar_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatAppBar extends StatelessWidget {
  const ChatAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final chat = context.read<ChatController>().state;
    return Material(
      elevation: 10,
      shadowColor: AppColor.lightGrey.withOpacity(0.2),
      child: Container(
        padding: marginHV10,
        decoration: const BoxDecoration(
          color: AppColor.white,
        ),
        child: Row(
          children: [
            const AppbarBackButton(),
            sizedboxH10,
            Expanded(
              child: Row(
                children: [
                  ClipOval(
                    child: SizedBox(
                      height: 40,
                      width: 40,
                      child: Image.asset(
                        'assets/debug/person.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  sizedboxH10,
                  Text(
                    chat.fullName,
                    style: h18,
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.more_vert,
            ),
          ],
        ),
      ),
    );
  }
}
