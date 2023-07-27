import 'package:expo_kg/features/auth/presentation/cubit/button_available.dart';
import 'package:expo_kg/features/auth/presentation/cubit/sms_controller.dart';
import 'package:expo_kg/shared/configs/texts.dart';
import 'package:expo_kg/shared/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sms_autofill/sms_autofill.dart';

class SmsCodeField extends StatefulWidget {
  const SmsCodeField({super.key});

  @override
  State<SmsCodeField> createState() => _SmsCodeFieldState();
}

class _SmsCodeFieldState extends State<SmsCodeField> {
  final TextEditingController controller = TextEditingController();
  final fieldFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusScope.of(context).requestFocus(
          fieldFocus,
        );
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            width: 80.w,
            child: BlocBuilder<SmsController, String?>(
              builder: (context, state) {
                return PinFieldAutoFill(
                  controller: controller,
                  decoration: UnderlineDecoration(
                    gapSpace: 0,
                    textStyle: st14,
                    lineHeight: 1,
                    colorBuilder: const FixedColorBuilder(
                      AppColor.lightGrey,
                    ),
                  ),
                  codeLength: 5,
                  focusNode: fieldFocus,
                  currentCode: state,
                  onCodeChanged: (code) {
                    context.read<SmsController>().change(code);
                    if (code!.length == 5) {
                      context.read<ButtonAvailableCont>().change(true);
                      FocusScope.of(context).requestFocus(
                        fieldFocus,
                      );
                    } else {
                      context.read<ButtonAvailableCont>().change(false);
                    }
                  },
                );
              },
            ),
          ),
          const Expanded(
            child: Divider(
              height: 1,
              color: AppColor.lightGrey,
            ),
          ),
        ],
      ),
    );
  }
}
