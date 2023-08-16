import 'dart:developer';

import 'package:dio/dio.dart';

geocoder(double lat, double long) async {
  try {
    final dio = Dio();
    final response = await dio.get(
        'https://geocode-maps.yandex.ru/1.x/?apikey=8ce68a07-65cd-4eba-b649-bb95403baf85&geocode=$lat,$long&lang=ru_RU');
    log(response.data.toString());
  } catch (e) {
    log("Couldn't get the geocoding: $e");
  }
}
