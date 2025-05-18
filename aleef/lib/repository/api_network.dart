import 'dart:convert';
import 'package:http/http.dart' as http;

/// ApiNetwork handles network requests related to fetching cat images.
class ApiNetwork {
  static const String _baseURL = 'https://cataas.com';
  static final String _catEndpoint = '/cat';

  /// Fetches a random cat image JSON metadata from the API.
  static Future<Map<String, dynamic>> getImage() async {
    var url = Uri.parse('$_baseURL$_catEndpoint?json=true');
    var response = await http.get(url);

    // Check if the response status code indicates success
    if (response.statusCode >= 200 && response.statusCode <= 299) {
      final bodyJson = jsonDecode(response.body);
      return Map.from(bodyJson).cast<String, dynamic>();
    } else {
      throw FormatException('The error came from ${response.statusCode}');
    }
  }
}
