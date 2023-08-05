import 'package:expo_kg/shared/configs/texts.dart';
import 'package:expo_kg/shared/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../cubit/rating_cont_cubit.dart';

class RateProductContainer extends StatelessWidget {
  const RateProductContainer({super.key});

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
            'Оцените товар',
            style: h14,
          ),
          RatingBar.builder(
            onRatingUpdate: (value) {
              context.read<RatingContCubit>().rate(
                    rating: value,
                  );
            },
            itemBuilder: (context, index) => const Icon(
              Icons.star,
              color: AppColor.orange,
            ),
            unratedColor: AppColor.lightGrey,
            itemCount: 5,
            itemSize: 22,
            direction: Axis.horizontal,
          )
        ],
      ),
    );
  }
}
