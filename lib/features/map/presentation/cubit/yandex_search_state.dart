part of 'yandex_search_cubit.dart';

abstract class YandexSearchState extends Equatable {
  const YandexSearchState();

  @override
  List<Object> get props => [];
}

class YandexSearchNotAssigned extends YandexSearchState {}

class YandexSearchAssigned extends YandexSearchState {
  final List<AddressModel> locations;
  const YandexSearchAssigned({
    required this.locations,
  });

  @override
  List<Object> get props => [locations];
}
