import 'package:equatable/equatable.dart';
import 'package:expo_kg/shared/constants/hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(const FavoriteState([]));
  load() {
    List<MapEntry<int, String>> favoritesList = [];
    final favoriteBox = Hive.box(
      HiveConstants.favoriteBox,
    );
    for (int i = 0; i < favoriteBox.values.length; i++) {
      final key = favoriteBox.keyAt(i);
      favoritesList.add(
        MapEntry(
          key,
          favoriteBox.get(key),
        ),
      );
    }
    emit(
      FavoriteState(
        favoritesList,
      ),
    );
  }

  favoriteAction(String id) {
    final favoriteBox = Hive.box(
      HiveConstants.favoriteBox,
    );
    List<MapEntry<int, String>> favoritesList = [
      ...super.state.favorites,
    ];
    if (super.state.favorites.any((element) => element.value == id)) {
      favoriteBox.delete(
        super.state.favorites.firstWhere((element) => element.value == id).key,
      );
      favoritesList.removeWhere(
        (element) => element.value == id,
      );
    } else {
      int key = 0;
      if (favoriteBox.isNotEmpty) {
        key = (favoriteBox.keys.last as int) + 1;
      }
      favoriteBox.put(key, id);
      favoritesList.add(
        MapEntry(
          key,
          id,
        ),
      );
    }
    emit(
      FavoriteState(
        favoritesList,
      ),
    );
  }

  bool isFavorite(String id) {
    return super.state.favorites.any(
          (element) => element.value == id,
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
