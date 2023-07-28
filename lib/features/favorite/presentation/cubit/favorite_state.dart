// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'favorite_cubit.dart';

class FavoriteState extends Equatable {
  final List<String> favorites;
  const FavoriteState(
    this.favorites,
  );

  @override
  List<Object> get props => [
        favorites,
      ];
}
