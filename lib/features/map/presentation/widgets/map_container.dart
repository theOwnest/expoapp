import 'package:expo_kg/features/main_scaffold/presentation/cubit/location_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class YandexMapContainer extends StatefulWidget {
  const YandexMapContainer({super.key});

  @override
  State<YandexMapContainer> createState() => _YandexMapContainerState();
}

class _YandexMapContainerState extends State<YandexMapContainer> {
  late YandexMapController controller;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationCubit, LocationState>(
      builder: (context, state) {
        return YandexMap(
          mapObjects: [
            if (state is LocationAccessed)
              PlacemarkMapObject(
                opacity: 1,
                mapId: const MapObjectId(
                  'my-location',
                ),
                icon: PlacemarkIcon.single(
                  PlacemarkIconStyle(
                    image: BitmapDescriptor.fromAssetImage(
                      'assets/icons/home/big-location.png',
                    ),
                    scale: 1.5,
                  ),
                ),
                point: Point(
                  latitude: state.currentLocation.latitude,
                  longitude: state.currentLocation.longitude,
                ),
              ),
          ],
          onMapCreated: (YandexMapController yandexMapController) async {
            controller = yandexMapController;
            if (state is LocationAccessed) {
              controller.moveCamera(
                animation: const MapAnimation(
                    type: MapAnimationType.linear, duration: 1),
                CameraUpdate.newCameraPosition(
                  CameraPosition(
                    target: Point(
                      latitude: state.currentLocation.latitude,
                      longitude: state.currentLocation.longitude,
                    ),
                    zoom: 12,
                  ),
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
          zoomGesturesEnabled: true,
          mapMode: MapMode.driving,
        );
      },
    );
  }
}
