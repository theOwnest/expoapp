import 'package:expo_kg/shared/configs/texts.dart';
import 'package:expo_kg/shared/constants/border.dart';
import 'package:expo_kg/shared/constants/colors.dart';
import 'package:expo_kg/shared/constants/sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';

class FilterPrice extends StatefulWidget {
  const FilterPrice({super.key});

  @override
  State<FilterPrice> createState() => _FilterPriceState();
}

class _FilterPriceState extends State<FilterPrice> {
  double _lowerValue = 50;
  double _upperValue = 180;
  var priceRange = const RangeValues(
    200,
    1000,
  );
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        sizedbox35,
        const Text(
          'Стоимость',
          style: h14,
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'от $_lowerValue',
              style: st14,
            ),
            Text(
              'от $_upperValue',
              style: st14,
            ),
          ],
        ),
        FlutterSlider(
          values: [
            _lowerValue,
            _upperValue,
          ],
          rangeSlider: true,
          max: 500,
          min: 0,
          handler: FlutterSliderHandler(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColor.white,
              border: commonThinBorder,
            ),
            child: Container(
              margin: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                color: AppColor.orange,
                shape: BoxShape.circle,
              ),
            ),
          ),
          rightHandler: FlutterSliderHandler(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColor.white,
              border: commonThinBorder,
            ),
            child: Container(
              margin: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                color: AppColor.orange,
                shape: BoxShape.circle,
              ),
            ),
          ),
          trackBar: const FlutterSliderTrackBar(
            activeTrackBar: BoxDecoration(
              color: AppColor.orange,
            ),
            inactiveDisabledTrackBarColor: AppColor.lightGrey,
          ),
          onDragging: (handlerIndex, lowerValue, upperValue) {
            setState(() {
              _lowerValue = lowerValue;
              _upperValue = upperValue;
            });
          },
        )
      ],
    );
  }
}
