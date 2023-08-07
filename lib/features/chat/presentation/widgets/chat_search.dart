// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:expo_kg/features/chat/presentation/cubit/chat_search.dart';
import 'package:expo_kg/shared/configs/texts.dart';
import 'package:expo_kg/shared/constants/border_radius.dart';
import 'package:expo_kg/shared/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatSearchbar extends StatelessWidget {
  const ChatSearchbar({
    Key? key,
    this.function,
  }) : super(key: key);
  final Function? function;

  @override
  Widget build(BuildContext context) {
    return Container(
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
        onChanged: (value) {
          context.read<ChatSearchController>().search(value);
        },
        onEditingComplete: () {},
        style: st14,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.zero,
          border: InputBorder.none,
          hintText: 'Поиск по чатам',
          hintStyle: st14,
          suffixIconConstraints: const BoxConstraints(
            maxHeight: 18,
          ),
          suffixIcon: Image.asset(
            'assets/icons/home/search.png',
          ),
        ),
      ),
    );
  }
}
