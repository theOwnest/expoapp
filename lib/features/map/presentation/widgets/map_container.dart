// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

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

  @override
  Widget build(BuildContext context) {
    return YandexMap(
      mapObjects: [
        if (widget.position != null)
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
              latitude: widget.position!.latitude,
              longitude: widget.position!.longitude,
            ),
          ),
      ],
      onMapCreated: (YandexMapController yandexMapController) async {
        controller = yandexMapController;
        if (widget.position != null) {
          controller.moveCamera(
            animation:
                const MapAnimation(type: MapAnimationType.linear, duration: 1),
            CameraUpdate.newCameraPosition(
              CameraPosition(
                target: Point(
                  latitude: widget.position!.latitude,
                  longitude: widget.position!.longitude,
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
  }
}
