// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:expo_kg/features/merchant/presentation/cubit/shop_images_controller.dart';
import 'package:expo_kg/shared/configs/texts.dart';
import 'package:expo_kg/shared/constants/border_radius.dart';
import 'package:expo_kg/shared/constants/colors.dart';
import 'package:expo_kg/shared/constants/margin.dart';
import 'package:expo_kg/shared/constants/sizedbox.dart';
import 'package:expo_kg/shared/widgets/rounded_small_button.dart';

class AddPhoto extends StatelessWidget {
  const AddPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        sizedbox35,
        const Text(
          'Добавить фото',
          style: h14,
        ),
        Padding(
          padding: marginV,
          child: BlocBuilder<ShopImagesCubit, List<File>>(
            builder: (context, state) {
              return GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 4,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                children: List.generate(
                  state.length < 5 ? 4 : state.length,
                  (index) => (state.length - 1) >= index
                      ? AddPhotoContainer(
                          photo: state[index],
                        )
                      : const AddPhotoContainer(),
                ),
              );
            },
          ),
        ),
        RoundedSmallButton(
          title: '+ Добавить еще фото',
          function: () {
            context.read<ShopImagesCubit>().addImage();
          },
        ),
      ],
    );
  }
}

class AddPhotoContainer extends StatelessWidget {
  const AddPhotoContainer({
    Key? key,
    this.photo,
  }) : super(key: key);
  final File? photo;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (photo == null) {
          context.read<ShopImagesCubit>().addImage();
        }
      },
      child: photo != null
          ? ClipRRect(
              borderRadius: borderR10,
              child: Image.file(
                photo!,
                fit: BoxFit.cover,
              ),
            )
          : Container(
              decoration: BoxDecoration(
                color: AppColor.lightGrey,
                borderRadius: borderR10,
              ),
              child: Center(
                child: Image.asset(
                  'assets/icons/login/photo.png',
                  width: 22,
                ),
              ),
            ),
    );
  }
}
