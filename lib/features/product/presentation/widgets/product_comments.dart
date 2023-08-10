import 'package:expo_kg/features/comment/presentation/widgets/comment_container.dart';
import 'package:expo_kg/features/product/data/datasources/comments.dart';
import 'package:expo_kg/features/product/presentation/cubit/product_cont.dart';
import 'package:expo_kg/shared/configs/routes.dart';
import 'package:expo_kg/shared/configs/texts.dart';
import 'package:expo_kg/shared/constants/colors.dart';
import 'package:expo_kg/shared/constants/sizedbox.dart';
import 'package:expo_kg/shared/widgets/custom_text_button.dart';
import 'package:expo_kg/shared/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_router/go_router.dart';

class ProductComments extends StatelessWidget {
  const ProductComments({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Отзывы',
              style: h14,
            ),
            Row(
              children: [
                Text(
                  context
                      .read<ProductController>()
                      .state
                      .rating
                      .toStringAsFixed(1),
                  style: h24,
                ),
                sizedboxH10,
                RatingBarIndicator(
                  rating: context.read<ProductController>().state.rating,
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
        const SizedBox(
          height: 20,
        ),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => CommentContainer(
            comment: commentsList[index],
          ),
          separatorBuilder: (context, index) => const SizedBox(
            height: 10,
          ),
          itemCount: commentsList.length > 3 ? 3 : commentsList.length,
        ),
        CustomTextButton(
          title: 'Смотреть все (36)',
          textStyle: st12.copyWith(
            color: AppColor.orange,
          ),
          function: () {
            context.pushNamed(
              RoutesNames.allComments,
            );
          },
        ),
        RoundedButton(
          title: 'Добавить отзыв',
          color: AppColor.black,
          height: 60,
          function: () {
            context.pushNamed(
              RoutesNames.rateProduct,
            );
          },
        ),
      ],
    );
  }
}
