import 'package:expo_kg/shared/configs/texts.dart';
import 'package:expo_kg/shared/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CommentsAverageRating extends StatelessWidget {
  const CommentsAverageRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Все отзывы',
            style: h18,
          ),
          Row(
            children: [
              const Text(
                '4.9',
                style: h24,
              ),
              const SizedBox(
                width: 10,
              ),
              RatingBarIndicator(
                rating: 4.9,
                itemBuilder: (context, index) => const Icon(
                  Icons.star,
                  color: AppColor.orange,
                ),
                unratedColor: AppColor.lightGrey,
                itemCount: 5,
                itemSize: 15,
                direction: Axis.horizontal,
              ),
            ],
          )
        ],
      ),
    );
  }
}
