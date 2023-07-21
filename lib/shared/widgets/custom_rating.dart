import 'package:expo_kg/shared/configs/texts.dart';
import 'package:expo_kg/shared/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CustomRatingContainer extends StatelessWidget {
  const CustomRatingContainer({
    Key? key,
    required this.rating,
  }) : super(key: key);
  final double rating;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RatingBarIndicator(
          rating: rating,
          itemBuilder: (context, index) => const Icon(
            Icons.star,
            color: AppColor.orange,
          ),
          itemCount: 5,
          itemSize: 15,
          direction: Axis.horizontal,
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          rating.toStringAsFixed(1),
          style: st14,
        ),
      ],
    );
  }
}
