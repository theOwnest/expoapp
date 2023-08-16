import 'dart:developer';

import 'package:dio/dio.dart';

geocoder(double lat, double long) async {
  try {
    final dio = Dio();
    final response = await dio.get(
        'https://geocode-maps.yandex.ru/1.x/?apikey=e6341052-a50a-4721-83da-b9e3f215e24c&geocode=$lat,$long&lang=ru_RU');
    log(response.data.toString());
  } catch (e) {
    log("Couldn't get the geocoding: $e");
  }
}
