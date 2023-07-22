// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:expo_kg/shared/configs/texts.dart';
import 'package:expo_kg/shared/constants/colors.dart';
import 'package:expo_kg/shared/constants/margin.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppbarTitle extends StatelessWidget {
  const AppbarTitle({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: marginHV10,
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: h18,
            ),
          ),
          const Positioned(
            left: 0,
            child: AppbarBackButton(),
          ),
        ],
      ),
    );
  }
}

class AppbarBackButton extends StatelessWidget {
  const AppbarBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (context.canPop()) {
          context.pop();
        }
      },
      child: SizedBox(
        height: 21,
        width: 21,
        child: Image.asset(
          'assets/icons/product/back.png',
          color: AppColor.black,
        ),
      ),
    );
  }
}
