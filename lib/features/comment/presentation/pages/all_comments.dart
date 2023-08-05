import 'package:expo_kg/features/comment/presentation/widgets/average_rating.dart';
import 'package:expo_kg/features/comment/presentation/widgets/comment_container.dart';
import 'package:expo_kg/features/product/data/datasources/comments.dart';
import 'package:expo_kg/shared/constants/margin.dart';
import 'package:expo_kg/shared/constants/sizedbox.dart';
import 'package:expo_kg/shared/widgets/appbar_title.dart';
import 'package:flutter/material.dart';

class AllCommentsPage extends StatelessWidget {
  const AllCommentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: marginHV10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppbarBackButton(),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CommentsAverageRating(),
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) => CommentContainer(
                          comment: commentsList[index],
                        ),
                        separatorBuilder: (context, index) => sizedbox10,
                        itemCount: commentsList.length,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
