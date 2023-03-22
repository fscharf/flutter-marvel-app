import 'dart:convert';

import 'package:marvel_portal/config/http_client.dart';
import 'package:marvel_portal/models/marvel.dart';

class MarvelController {
  static HttpClient httpClient = HttpClient();

  static List parseResponse(String responseBody) {
    Map<String, dynamic> jsonMap = jsonDecode(responseBody);
    List parsed = jsonMap['data']['results'];
    return parsed;
  }

  static List<CharacterModel> parseCharacters(String responseBody) {
    final parsed = parseResponse(responseBody);
    return parsed.map((json) => CharacterModel.fromJson(json)).toList();
  }

  static List<SerieModel> parseSeries(String responseBody) {
    final parsed = parseResponse(responseBody);
    return parsed.map((json) => SerieModel.fromJson(json)).toList();
  }

  static List<EventModel> parseEvents(String responseBody) {
    final parsed = parseResponse(responseBody);
    return parsed.map((json) => EventModel.fromJson(json)).toList();
  }

  Future<List<CharacterModel>> fetchCharacters() async {
    final response = await httpClient.request();
    if (response.statusCode == 200) {
      return parseCharacters(response.body);
    } else {
      throw Exception(
        'Failed to retrieve characters with status code: ${response.statusCode}. Reason: ${response.reasonPhrase}.',
      );
    }
  }

  Future<List<SerieModel>> fetchSeries(int id) async {
    final response = await httpClient.request(route: '/$id/series');
    if (response.statusCode == 200) {
      return parseSeries(response.body);
    } else {
      throw Exception(
        'Failed to retrieve series with status code: ${response.statusCode}. Reason: ${response.reasonPhrase}',
      );
    }
  }

  Future<List<EventModel>> fetchEvents(int id) async {
    final response = await httpClient.request(route: '/$id/events');
    if (response.statusCode == 200) {
      return parseEvents(response.body);
    } else {
      throw Exception(
        'Failed to retrieve events with status code: ${response.statusCode}. Reason: ${response.reasonPhrase}',
      );
    }
  }
}
