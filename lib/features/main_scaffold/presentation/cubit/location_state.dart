part of 'location_cubit.dart';

abstract class LocationState extends Equatable {
  const LocationState();

  @override
  List<Object> get props => [];
}

class LocationNotAccessed extends LocationState {}

class LocationAccessed extends LocationState {
  const LocationAccessed({
    required this.currentLocation,
  });
  final Position currentLocation;
  @override
  List<Object> get props => [currentLocation];
}
