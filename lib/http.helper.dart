import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class HttpHelper {
  final String urlKey = DotEnv().env['URL_KEY'];
  final String urlBase = DotEnv().env['URL_BASE'];
  final String urlUpcoming = DotEnv().env['URL_UPCOMING'];
  final String urlLanguage = DotEnv().env['URL_LANG'];

  Future<String> getUpcoming() async {
    final String upcomming = urlBase + urlUpcoming + urlKey + urlLanguage;
    http.Response result = await http.get(upcomming);

    if (result.statusCode == HttpStatus.ok) {
      String responseBody = result.body;
      return responseBody;
    } else {
      return null;
    }
  }
}
