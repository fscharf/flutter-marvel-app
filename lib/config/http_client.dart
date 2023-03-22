import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:crypto/crypto.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class HttpClient {
  static String textToMd5(String text) {
    return md5.convert(utf8.encode(text)).toString();
  }

  Future<http.Response> request({
    String route = '',
    int limit = 10,
    int offset = 0,
  }) async {
    String apiUrl = dotenv.env['API_URL'] ?? '';
    String publicKey = dotenv.env['PUBLIC_KEY'] ?? '';
    String privateKey = dotenv.env['PRIVATE_KEY'] ?? '';
    String hash = textToMd5('1$privateKey$publicKey');

    return await http.get(
      Uri.parse(
        '$apiUrl/characters$route?apikey=$publicKey&hash=$hash&ts=1&limit=$limit&offset=$offset',
      ),
    );
  }
}
