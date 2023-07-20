import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class BaseHttpClient {
  var client = http.Client();
  final token = null;
  final baseUrl = '';
  Map<String, String> getDefaultHeader() {
    return token != null
        ? {
            'Authorization': 'Bearer $token',
            'Accept': 'application/json',
            'Content-Type': 'application/json',
          }
        : {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
          };
  }

  Future<dynamic> get(String api, [Map<String, String>? headers]) async {
    var url = Uri.parse(baseUrl + api);
    var response = await client.get(
      url,
      headers: headers ?? getDefaultHeader(),
    );
    if (response.statusCode == 200) {
      return response.body;
    } else {
      //throw exception and catch it in UI
    }
  }

  Future<dynamic> post(
    String api,
    dynamic object, [
    Map<String, String>? headers,
  ]) async {
    var url = Uri.parse(baseUrl + api);
    var payload = jsonEncode(object);
    var response = await client.post(
      url,
      body: payload,
      headers: headers ?? getDefaultHeader(),
    );
    if (response.statusCode < 300) {
      return response.body;
    } else {
      log(
        response.body.toString(),
      );
    }
  }

  ///PUT Request
  Future<dynamic> put(
    String api,
    dynamic object, [
    Map<String, String>? headers,
  ]) async {
    var url = Uri.parse(baseUrl + api);
    var payload = json.encode(object);

    var response = await client.put(
      url,
      body: payload,
      headers: headers ?? getDefaultHeader(),
    );
    if (response.statusCode < 300) {
      return response.body;
    } else {
      log(
        response.body.toString(),
      );
    }
  }

  Future<dynamic> patch(
    String api,
    dynamic object, [
    Map<String, String>? headers,
  ]) async {
    var url = Uri.parse(baseUrl + api);
    var payload = json.encode(object);

    var response = await client.patch(
      url,
      body: payload,
      headers: headers ?? getDefaultHeader(),
    );
    if (response.statusCode < 300) {
      return response.body;
    } else {
      log(
        response.body.toString(),
      );
    }
  }

  Future<dynamic> delete(
    String api, [
    Map<String, String>? headers,
  ]) async {
    var url = Uri.parse(baseUrl + api);

    var response = await client.delete(
      url,
      headers: headers ?? getDefaultHeader(),
    );
    if (response.statusCode < 300) {
      return response.body;
    } else {
      log(
        response.body.toString(),
      );
    }
  }
}
