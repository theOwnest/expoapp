import 'package:flutter/material.dart';

class AppbarButtonContainer extends StatelessWidget {
  const AppbarButtonContainer({
    Key? key,
    required this.icon,
    this.function,
  }) : super(key: key);
  final String icon;
  final Function? function;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (function != null) {
          function!();
        }
      },
      child: SizedBox(
        height: 24,
        width: 24,
        child: Image.asset(
          'assets/icons/product/$icon.png',
        ),
      ),
    );
  }
}
