// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:expo_kg/features/chat/data/models/chat.dart';
import 'package:expo_kg/features/chat/presentation/cubit/chat_cubit.dart';
import 'package:expo_kg/shared/configs/routes.dart';
import 'package:expo_kg/shared/configs/texts.dart';
import 'package:expo_kg/shared/constants/divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../shared/constants/border_radius.dart';
import '../../../../shared/constants/colors.dart';

class ChatContainer extends StatelessWidget {
  const ChatContainer({
    Key? key,
    required this.chat,
  }) : super(key: key);
  final ChatModel chat;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        try {
          context.pushNamed(
            RoutesNames.messagingPage,
            extra: BlocProvider.of<ChatCubit>(context),
            queryParameters: {
              'chatId': chat.id,
            },
          );
        } catch (e) {
          log("Couldn't open the page: $e");
        }
      },
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 36,
                width: 36,
                decoration: BoxDecoration(
                  color: AppColor.lightGrey,
                  borderRadius: borderRC,
                ),
                child: Center(
                  child: Image.asset(
                    'assets/icons/product/person.png',
                    width: 14,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      chat.fullName,
                      style: h14,
                    ),
                    if (chat.messages.isNotEmpty)
                      Text(
                        chat.messages.last.message,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: st14,
                      ),
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              if (chat.messages.isNotEmpty)
                Text(
                  DateFormat('dd.MM.yyyy').format(chat.messages.last.time),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: st14,
                ),
            ],
          ),
          divider30,
        ],
      ),
    );
  }
}
