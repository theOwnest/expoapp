// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:expo_kg/shared/configs/texts.dart';
import 'package:expo_kg/shared/constants/border.dart';
import 'package:expo_kg/shared/constants/border_radius.dart';
import 'package:expo_kg/shared/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:expo_kg/features/product/data/models/comment.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';

class CommentContainer extends StatelessWidget {
  const CommentContainer({
    Key? key,
    required this.comment,
  }) : super(key: key);
  final CommentModel comment;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: borderR10,
        border: commonThinBorder,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RatingBarIndicator(
                rating: comment.rating,
                itemBuilder: (context, index) => const Icon(
                  Icons.star,
                  color: AppColor.orange,
                ),
                unratedColor: AppColor.lightGrey,
                itemCount: 5,
                itemSize: 15,
                direction: Axis.horizontal,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        comment.author,
                        style: h14,
                      ),
                      Text(
                        DateFormat.yMd().format(comment.time),
                        style: h14,
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 36,
                    width: 36,
                    decoration: BoxDecoration(
                      color: AppColor.lightGrey,
                      borderRadius: borderRC,
                    ),
                    child: Center(
                      child: Image.asset(
                        'assets/icons/product/person.png',
                        width: 14,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            comment.comment,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: st14,
          ),
        ],
      ),
    );
  }
}
