// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:expo_kg/shared/configs/routes.dart';
import 'package:expo_kg/shared/configs/texts.dart';
import 'package:expo_kg/shared/constants/border_radius.dart';
import 'package:expo_kg/shared/constants/colors.dart';
import 'package:expo_kg/shared/constants/margin.dart';

class HomeProductSearchbar extends StatelessWidget {
  const HomeProductSearchbar({
    Key? key,
    this.isSearchPage,
    this.function,
    this.tapOutSideFunction,
    this.controller,
  }) : super(key: key);
  final bool? isSearchPage;
  final Function? function;
  final Function? tapOutSideFunction;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isSearchPage != null && isSearchPage!) return;
        context.pushNamed(
          RoutesNames.search,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.lightGrey,
          borderRadius: borderR10,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
        margin: marginH,
        child: TextField(
          controller: controller,
          textInputAction: TextInputAction.search,
          maxLines: 1,
          onChanged: (value) {
            if (function != null) {
              function!(value);
            }
          },
          onEditingComplete: () {},
          style: st14,
          autofocus: isSearchPage ?? false,
          enabled: isSearchPage ?? false,
          decoration: InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.zero,
            border: InputBorder.none,
            hintText: 'Найти товары',
            hintStyle: st14,
            suffixIconConstraints: const BoxConstraints(
              maxHeight: 18,
            ),
            suffixIcon: Image.asset(
              'assets/icons/home/search.png',
            ),
          ),
        ),
      ),
    );
  }
}
