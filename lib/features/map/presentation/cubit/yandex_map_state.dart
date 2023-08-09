part of 'yandex_map_cubit.dart';

abstract class YandexMapState extends Equatable {
  const YandexMapState();

  @override
  List<Object> get props => [];
}

class YandexMapNotAssigned extends YandexMapState {}

class YandexMapAssigned extends YandexMapState {
  final AddressModel location;
  const YandexMapAssigned({
    required this.location,
  });

  @override
  List<Object> get props => [location];
}
