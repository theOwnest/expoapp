import 'package:equatable/equatable.dart';
import 'package:expo_kg/shared/constants/hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(const FavoriteState([]));
  load() {
    List<String> favoritesList = [];
    final searchHistoryBox = Hive.box(
      HiveConstants.favoriteBox,
    );
    for (var element in searchHistoryBox.values) {
      favoritesList.add(element);
    }
    emit(
      FavoriteState(
        favoritesList,
      ),
    );
  }

  addFavorite(String id) {
    final favoriteBox = Hive.box(
      HiveConstants.favoriteBox,
    );
    favoriteBox.add(id);
    emit(
      FavoriteState(
        [
          ...super.state.favorites,
          id,
        ],
      ),
    );
  }

  bool isFavorite(String id) {
    return super.state.favorites.any(
          (element) => element == id,
        );
  }

  clear() {
    final favoriteBox = Hive.box(
      HiveConstants.favoriteBox,
    );
    favoriteBox.clear();
    emit(
      const FavoriteState(
        [],
      ),
    );
  }
}
