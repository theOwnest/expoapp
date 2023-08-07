import 'dart:io';

import 'package:expo_kg/features/profile/presentation/cubit/profile_image_cubit.dart';
import 'package:expo_kg/shared/constants/border_radius.dart';
import 'package:expo_kg/shared/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonalAddPhoto extends StatelessWidget {
  const PersonalAddPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: GestureDetector(
        onTap: () {
          context.read<ProfileImageCubit>().addImage();
        },
        child: Center(
          child: BlocBuilder<ProfileImageCubit, File?>(
            builder: (context, state) {
              if (state != null) {
                return ClipOval(
                  child: SizedBox(
                    height: 80,
                    width: 80,
                    child: Image.file(
                      state,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }
              return Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  color: AppColor.lightGrey,
                  borderRadius: borderRC,
                ),
                child: Center(
                  child: Image.asset(
                    'assets/icons/login/photo.png',
                    width: 22,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
