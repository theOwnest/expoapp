import 'dart:developer';

import 'package:expo_kg/features/map/data/models/address.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../../presentation/cubit/yandex_search_cubit.dart';

void yandexSearch(
  String query,
  BuildContext context,
) async {
  if (query.isEmpty) return;
  try {
    final resultWithSession = YandexSearch.searchByText(
      searchText: query,
      geometry: Geometry.fromBoundingBox(
        const BoundingBox(
          southWest:
              Point(latitude: 55.76996383933034, longitude: 37.57483142322235),
          northEast: Point(
              latitude: 55.785322774728414, longitude: 37.590924677311705),
        ),
      ),
      searchOptions: const SearchOptions(
        searchType: SearchType.geo,
        geometry: false,
      ),
    );

    final results = await resultWithSession.result;
    List<AddressModel> locations = results.items!
        .map(
          (e) => AddressModel(
            name: e.toponymMetadata?.address.formattedAddress ?? '',
            latitude: e.toponymMetadata!.balloonPoint.latitude,
            longitude: e.toponymMetadata!.balloonPoint.longitude,
          ),
        )
        .toList();
    if (context.mounted) {
      context.read<YandexSearchCubit>().search(locations);
    }
  } catch (e) {
    log('Fetching data error; $e');
  }
}
