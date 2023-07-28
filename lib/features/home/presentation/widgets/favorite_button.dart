// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:expo_kg/features/favorite/presentation/cubit/favorite_cubit.dart';
import 'package:expo_kg/shared/constants/border_radius.dart';
import 'package:expo_kg/shared/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({
    Key? key,
    required this.id,
  }) : super(key: key);
  final String id;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<FavoriteCubit>().favoriteAction(id);
      },
      child: Container(
        height: 22,
        width: 22,
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: borderRC,
        ),
        padding: const EdgeInsets.all(3),
        child: BlocBuilder<FavoriteCubit, FavoriteState>(
          builder: (context, state) {
            final isFavorite = context.read<FavoriteCubit>().isFavorite(id);
            return Image.asset(
              isFavorite
                  ? 'assets/icons/home/heart-filled.png'
                  : 'assets/icons/home/heart.png',
            );
          },
        ),
      ),
    );
  }
}
