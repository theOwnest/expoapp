import 'package:equatable/equatable.dart';
import 'package:expo_kg/features/map/data/models/address.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'selected_location_state.dart';

class SelectedLocationCubit extends Cubit<SelectedLocationState> {
  SelectedLocationCubit() : super(const SelectedLocationState());
  addPoint(AddressModel location) {
    emit(
      SelectedLocationState(
        location: location,
      ),
    );
  }
}
