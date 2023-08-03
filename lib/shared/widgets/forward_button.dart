import 'package:flutter/material.dart';

import '../configs/texts.dart';

class ForwardButton extends StatelessWidget {
  const ForwardButton({
    Key? key,
    required this.title,
    this.function,
  }) : super(key: key);
  final String title;
  final Function? function;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (function != null) {
          function!();
        }
      },
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: h14,
              ),
              const Icon(
                Icons.arrow_forward_ios,
              ),
            ],
          ),
          const Divider(
            height: 30,
            thickness: 1,
          ),
        ],
      ),
    );
  }
}
