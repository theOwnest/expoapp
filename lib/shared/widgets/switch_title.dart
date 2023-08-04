import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../configs/texts.dart';
import '../constants/colors.dart';

class SwitchTitleButton extends StatefulWidget {
  const SwitchTitleButton({
    Key? key,
    required this.title,
    this.function,
  }) : super(key: key);
  final String title;
  final Function? function;

  @override
  State<SwitchTitleButton> createState() => _SwitchTitleButtonState();
}

class _SwitchTitleButtonState extends State<SwitchTitleButton> {
  bool switchValue = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        setState(() {
          switchValue = !switchValue;
        });
        if (widget.function != null) {
          widget.function!();
        }
      },
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title,
                style: h14,
              ),
              SizedBox(
                height: 30,
                child: FittedBox(
                  child: CupertinoSwitch(
                    value: switchValue,
                    activeColor: AppColor.orange,
                    onChanged: (value) {},
                  ),
                ),
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
