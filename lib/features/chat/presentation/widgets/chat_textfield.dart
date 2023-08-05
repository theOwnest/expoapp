import 'package:expo_kg/shared/configs/texts.dart';
import 'package:expo_kg/shared/constants/border_radius.dart';
import 'package:expo_kg/shared/constants/colors.dart';
import 'package:flutter/material.dart';

class ChatTextfield extends StatelessWidget {
  const ChatTextfield({super.key});

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
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: AppColor.lightGrey,
                borderRadius: borderR10,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              child: TextField(
                textInputAction: TextInputAction.search,
                maxLines: 1,
                onChanged: (value) {},
                style: st14,
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                  border: InputBorder.none,
                  hintText: 'Напишите сообщение',
                  hintStyle: st14,
                  suffixIconConstraints: const BoxConstraints(
                    maxHeight: 18,
                  ),
                  suffixIcon: Image.asset(
                    'assets/icons/chat/attachment.png',
                    height: 14,
                  ),
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: AppColor.orange,
              borderRadius: borderR10,
            ),
            child: Image.asset(
              'assets/icons/chat/send.png',
              height: 14,
            ),
          )
        ],
      ),
    );
  }
}
