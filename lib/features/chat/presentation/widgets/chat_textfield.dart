import 'package:expo_kg/features/chat/data/models/message.dart';
import 'package:expo_kg/features/chat/presentation/cubit/chat_controller.dart';
import 'package:expo_kg/features/chat/presentation/cubit/chat_cubit.dart';
import 'package:expo_kg/shared/configs/random.dart';
import 'package:expo_kg/shared/configs/texts.dart';
import 'package:expo_kg/shared/constants/border_radius.dart';
import 'package:expo_kg/shared/constants/colors.dart';
import 'package:expo_kg/shared/constants/sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatTextfield extends StatefulWidget {
  const ChatTextfield({super.key});

  @override
  State<ChatTextfield> createState() => _ChatTextfieldState();
}

class _ChatTextfieldState extends State<ChatTextfield> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      padding: const EdgeInsets.only(
        top: 20,
        left: 15,
        right: 15,
        bottom: 33,
      ),
      decoration: BoxDecoration(
        color: AppColor.white,
        boxShadow: [
          BoxShadow(
            color: AppColor.lightGrey.withOpacity(
              0.3,
            ),
            blurRadius: 5,
            offset: const Offset(0, -10),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: AppColor.lightGrey,
                borderRadius: borderR10,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              alignment: Alignment.center,
              child: TextField(
                controller: controller,
                textInputAction: TextInputAction.search,
                style: st14,
                decoration: InputDecoration(
                  isDense: true,
                  border: InputBorder.none,
                  hintText: 'Напишите сообщение',
                  hintStyle: st14,
                  suffixIconConstraints: const BoxConstraints(
                    maxHeight: 15,
                  ),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(
                      left: 5,
                    ),
                    child: Image.asset(
                      'assets/icons/chat/attachment.png',
                    ),
                  ),
                ),
              ),
            ),
          ),
          sizedboxH10,
          GestureDetector(
            onTap: () {
              context.read<ChatCubit>().typeMessage(
                    context.read<ChatController>().state.id,
                    MessageModel(
                      id: uuid.v1(),
                      message: controller.text,
                      time: DateTime.now(),
                      isMine: true,
                    ),
                  );
              controller.clear();
            },
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: AppColor.orange,
                borderRadius: borderR10,
              ),
              child: Center(
                child: Image.asset(
                  'assets/icons/chat/send.png',
                  height: 14,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
