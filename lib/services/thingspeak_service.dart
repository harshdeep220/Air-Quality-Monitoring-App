import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/air_quality_data.dart';

class ThingspeakService {
  static const String channelId = "2593537"; // Replace with your channel ID
  static const String apiKey = "DL7614GR33CVSTOB"; // Replace with your API key
  static const String baseUrl = "https://api.thingspeak.com/channels/$channelId/feeds.json";

  Future<AirQualityData> fetchAirQualityData() async {
    final uri = Uri.parse(baseUrl).replace(
      queryParameters: {
        'api_key': apiKey,
        'results': '1',
      },
    );

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final feeds = data['feeds'] as List<dynamic>;
      
      if (feeds.isEmpty) {
        throw Exception('No data available');
      }

      return AirQualityData.fromJson(feeds[0] as Map<String, dynamic>);
    } else {
      throw Exception('Failed to fetch data: ${response.statusCode}');
    }
  }
}