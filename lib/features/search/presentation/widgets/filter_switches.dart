import 'package:expo_kg/shared/configs/texts.dart';
import 'package:expo_kg/shared/constants/colors.dart';
import 'package:expo_kg/shared/constants/divider.dart';
import 'package:expo_kg/shared/constants/sizedbox.dart';
import 'package:flutter/cupertino.dart';

class FilterSwitches extends StatelessWidget {
  const FilterSwitches({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        sizedbox35,
        FilterSwitchContainer(),
        FilterSwitchContainer(),
        FilterSwitchContainer(),
      ],
    );
  }
}

class FilterSwitchContainer extends StatefulWidget {
  const FilterSwitchContainer({super.key});

  @override
  State<FilterSwitchContainer> createState() => _FilterSwitchContainerState();
}

class _FilterSwitchContainerState extends State<FilterSwitchContainer> {
  bool isSwitchOn = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Заголовок',
              style: h14,
            ),
            SizedBox(
              height: 25,
              child: FittedBox(
                child: CupertinoSwitch(
                  value: isSwitchOn,
                  activeColor: AppColor.orange,
                  onChanged: (value) {
                    setState(() {
                      isSwitchOn = !isSwitchOn;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
        divider30,
      ],
    );
  }
}
