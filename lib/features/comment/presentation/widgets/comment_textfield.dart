import 'package:expo_kg/features/comment/presentation/cubit/rating_cont_cubit.dart';
import 'package:expo_kg/shared/configs/texts.dart';
import 'package:expo_kg/shared/constants/border.dart';
import 'package:expo_kg/shared/constants/sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentTextfield extends StatelessWidget {
  const CommentTextfield({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Напишите отзыв',
          style: h14,
        ),
        sizedbox15,
        SizedBox(
          height: 130,
          child: TextField(
            maxLines: null,
            expands: true,
            onChanged: (value) {
              context.read<RatingContCubit>().rate(
                    comment: value,
                  );
            },
            decoration: InputDecoration(
              enabledBorder: outlineInputBorder,
              border: outlineInputBorder,
              focusedBorder: outlineInputBorder,
            ),
          ),
        )
      ],
    );
  }
}
