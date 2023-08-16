import 'package:expo_kg/features/map/data/models/address.dart';
import 'package:expo_kg/features/map/data/utils/geocoder.dart';
import 'package:expo_kg/shared/configs/random.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../cubit/selected_location_cubit.dart';
import '../cubit/yandex_map_cubit.dart';

class MapContainer extends StatefulWidget {
  const MapContainer({
    Key? key,
    this.position,
  }) : super(key: key);
  final Position? position;
  @override
  State<MapContainer> createState() => _MapContainerState();
}

class _MapContainerState extends State<MapContainer> {
  late YandexMapController controller;
  List<MapObject> mapObjects = [];
  @override
  void initState() {
    super.initState();
    if (widget.position != null) {
      mapObjects.add(
        PlacemarkMapObject(
          opacity: 1,
          mapId: const MapObjectId(
            'my-location',
          ),
          icon: PlacemarkIcon.single(
            PlacemarkIconStyle(
              image: BitmapDescriptor.fromAssetImage(
                'assets/icons/home/my-location.png',
              ),
              scale: 1,
            ),
          ),
          point: Point(
            latitude: widget.position!.latitude,
            longitude: widget.position!.longitude,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<YandexMapCubit, YandexMapState>(
      listener: (context, moveState) {
        if (moveState is YandexMapAssigned) {
          context.read<SelectedLocationCubit>().addPoint(
                moveState.location,
              );
          moveToLocation(
            moveState.location,
          );
          addMarker(moveState.location);
        }
      },
      builder: (context, state) {
        return YandexMap(
          mapObjects: mapObjects,
          onMapCreated: (YandexMapController yandexMapController) async {
            controller = yandexMapController;
            if (widget.position != null) {
              moveToLocation(
                AddressModel(
                  name: 'Delivery point',
                  latitude: widget.position!.latitude,
                  longitude: widget.position!.longitude,
                ),
              );
            }
          },
          onObjectTap: (GeoObject geoObject) async {
            debugPrint('Tapped object: ${geoObject.name}');

            if (geoObject.selectionMetadata != null) {
              await controller.selectGeoObject(geoObject.selectionMetadata!.id,
                  geoObject.selectionMetadata!.layerId);
            }
          },
          onMapTap: (argument) async {
            geocoder(argument.latitude, argument.longitude);
            if (mounted) {
              final point = AddressModel(
                name: "Unknown",
                latitude: argument.latitude,
                longitude: argument.longitude,
              );
              context.read<YandexMapCubit>().addPoint(point);
            }
          },
          zoomGesturesEnabled: true,
          mapMode: MapMode.driving,
        );
      },
    );
  }

  Future moveToLocation(
    AddressModel appLatLong,
  ) async {
    controller.moveCamera(
      animation: const MapAnimation(type: MapAnimationType.linear, duration: 1),
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: Point(
            latitude: appLatLong.latitude,
            longitude: appLatLong.longitude,
          ),
          zoom: 12,
        ),
      ),
    );
  }

  addMarker(AddressModel location) {
    if (location.name == 'my-Location') {
      if (!mapObjects.any((element) => element.mapId.value == 'my-Location')) {
        mapObjects.add(
          PlacemarkMapObject(
            mapId: const MapObjectId(
              'my-Location',
            ),
            point: Point(
              latitude: location.latitude,
              longitude: location.longitude,
            ),
            opacity: 1,
            icon: PlacemarkIcon.single(
              PlacemarkIconStyle(
                scale: 1.2,
                image: BitmapDescriptor.fromAssetImage(
                  'assets/icons/home/my-location.png',
                ),
              ),
            ),
          ),
        );
      }
    } else {
      mapObjects.add(
        PlacemarkMapObject(
          mapId: MapObjectId(
            uuid.v1(),
          ),
          point: Point(
            latitude: location.latitude,
            longitude: location.longitude,
          ),
          opacity: 1,
          icon: PlacemarkIcon.single(
            PlacemarkIconStyle(
              scale: 1,
              image: BitmapDescriptor.fromAssetImage(
                'assets/icons/home/location.png',
              ),
            ),
          ),
        ),
      );
    }
  }
}
