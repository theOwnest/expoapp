import 'package:expo_kg/features/comment/presentation/cubit/rating_cont_cubit.dart';
import 'package:expo_kg/features/comment/presentation/widgets/comment_textfield.dart';
import 'package:expo_kg/features/comment/presentation/widgets/rate_container.dart';
import 'package:expo_kg/shared/constants/margin.dart';
import 'package:expo_kg/shared/constants/sizedbox.dart';
import 'package:expo_kg/shared/widgets/appbar_title.dart';
import 'package:expo_kg/shared/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import '../../../../shared/constants/colors.dart';

class RateProductPage extends StatelessWidget {
  const RateProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RatingContCubit(),
      child: KeyboardDismisser(
        child: Scaffold(
          body: SafeArea(
            child: Padding(
              padding: marginHV10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppbarBackButton(),
                  const Column(
                    children: [
                      RateProductContainer(),
                      sizedbox35,
                      CommentTextfield(),
                    ],
                  ),
                  const Spacer(),
                  Builder(builder: (context) {
                    return BlocBuilder<RatingContCubit, RatingContState>(
                      builder: (context, state) {
                        final isAvailable =
                            state.comment != null && state.rating != null;
                        return RoundedButton(
                          title: 'Сохранить изменения',
                          color: isAvailable
                              ? AppColor.orange
                              : AppColor.orange.withOpacity(
                                  0.2,
                                ),
                          textColor:
                              isAvailable ? AppColor.white : AppColor.orange,
                          function: isAvailable
                              ? () {
                                  if (context.canPop()) context.pop();
                                }
                              : null,
                        );
                      },
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
