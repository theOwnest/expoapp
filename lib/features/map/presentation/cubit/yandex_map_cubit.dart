import 'package:equatable/equatable.dart';
import 'package:expo_kg/features/map/data/models/address.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'yandex_map_state.dart';

class YandexMapCubit extends Cubit<YandexMapState> {
  YandexMapCubit() : super(YandexMapNotAssigned());
  addPoint(AddressModel location) {
    emit(
      YandexMapAssigned(
        location: location,
      ),
    );
  }
}
