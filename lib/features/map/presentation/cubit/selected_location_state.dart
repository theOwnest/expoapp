// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'selected_location_cubit.dart';

class SelectedLocationState extends Equatable {
  const SelectedLocationState({
    this.location,
  });
  final AddressModel? location;
  @override
  List<Object> get props => [location!];
}
