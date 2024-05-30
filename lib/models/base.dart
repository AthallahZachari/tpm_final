import 'dart:convert';
import 'package:http/http.dart' as http;

class BaseNetwork {
  static String baseUrl =
      'https://backend-flight-system-dot-h-02-415813.uc.r.appspot.com';

  static Future<Map<String, dynamic>> get(String partUrl) async {
    final String fullUrl = "$baseUrl/$partUrl";
    final response = await http.get(Uri.parse(fullUrl));
    return _processResponse(response);
  }

    static Future<Map<String, dynamic>> getExchange() async {
    const String fullUrl =
        "https://v6.exchangerate-api.com/v6/c350aaeb6ba7ce3905c85161/latest/IDr";
    final response = await http.get(
      Uri.parse(fullUrl),
    );
    return _processResponse(response);
  }

  static Future<Map<String, dynamic>> _processResponse(
      http.Response response) async {
    final body = response.body;
    if (body.isNotEmpty) {
      final jsonBody = json.decode(body);
      return jsonBody;
    } else {
      return {"error": true};
    }
  }
}