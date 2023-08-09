import 'package:equatable/equatable.dart';
import 'package:expo_kg/features/map/data/models/address.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'yandex_search_state.dart';

class YandexSearchCubit extends Cubit<YandexSearchState> {
  YandexSearchCubit() : super(YandexSearchNotAssigned());
  search(List<AddressModel> locations) {
    if (locations.isEmpty) {
      emit(
        YandexSearchNotAssigned(),
      );
    } else {
      emit(
        YandexSearchAssigned(
          locations: locations,
        ),
      );
    }
  }

  empty() {
    emit(
      YandexSearchNotAssigned(),
    );
  }
}
