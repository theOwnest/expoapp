// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:expo_kg/features/chat/data/models/message.dart';
import 'package:expo_kg/shared/configs/texts.dart';
import 'package:expo_kg/shared/constants/colors.dart';
import 'package:expo_kg/shared/constants/sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class MessageContainer extends StatelessWidget {
  const MessageContainer({
    Key? key,
    required this.message,
  }) : super(key: key);
  final MessageModel message;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          message.isMine ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Container(
          width: 290.w,
          padding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 20,
          ),
          decoration: BoxDecoration(
              color: message.isMine ? AppColor.orange : AppColor.lightGrey,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(15),
                topRight: const Radius.circular(15),
                bottomLeft: message.isMine
                    ? const Radius.circular(15)
                    : const Radius.circular(5),
                bottomRight: message.isMine
                    ? const Radius.circular(5)
                    : const Radius.circular(15),
              )),
          child: Text(
            message.message,
            style: st14.copyWith(
              color: message.isMine ? AppColor.white : AppColor.black,
            ),
          ),
        ),
        sizedbox5,
        Text(
          DateFormat('hh:mm').format(message.time),
        ),
      ],
    );
  }
}
