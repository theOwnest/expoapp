import 'package:expo_kg/shared/configs/texts.dart';
import 'package:expo_kg/shared/constants/colors.dart';
import 'package:expo_kg/shared/constants/margin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeliveryContainer extends StatelessWidget {
  const DeliveryContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375.w,
      padding: marginHV20,
      decoration: const BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Доставка в пункт выдачи',
                style: h18,
              ),
              Image.asset(
                'assets/icons/home/address.png',
                width: 20,
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Пункт выдачи',
                style: st14,
              ),
              Text(
                'улица Центральная, д. 15',
                style: h14,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

class AddressContainerTextfield extends StatefulWidget {
  const AddressContainerTextfield({
    super.key,
  });

  @override
  State<AddressContainerTextfield> createState() =>
      _AddressContainerTextfieldState();
}

class _AddressContainerTextfieldState extends State<AddressContainerTextfield> {
  final controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    controller.text = 'улица Центральная, д. 15';
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: 1,
      decoration: InputDecoration(
        border: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColor.lightGrey,
          ),
        ),
        suffixIconConstraints: const BoxConstraints(
          maxHeight: 20,
        ),
        suffixIcon: Image.asset(
          'assets/icons/home/address.png',
        ),
      ),
    );
  }
}
