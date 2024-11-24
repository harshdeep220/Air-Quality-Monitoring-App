import 'package:flutter/material.dart';
import '../widgets/air_quality_card.dart';

class AirQualityData {
  final double? pm25;
  final double? temperature;
  final double? humidity;
  final String? gasLevel;
  final DateTime? timestamp;

  const AirQualityData({
    this.pm25,
    this.temperature,
    this.humidity,
    this.gasLevel,
    this.timestamp,
  });

  factory AirQualityData.fromJson(Map<String, dynamic> json) {
    return AirQualityData(
      pm25: _parseDouble(json['field1']),
      temperature: _parseDouble(json['field2']),
      humidity: _parseDouble(json['field3']),
      gasLevel: json['field4'] as String?,
      timestamp: json['created_at'] != null 
          ? DateTime.parse(json['created_at'] as String)
          : null,
    );
  }

  static double? _parseDouble(dynamic value) {
    if (value == null) return null;
    if (value is num) return value.toDouble();
    if (value is String) return double.tryParse(value);
    return null;
  }

  String get airQualityStatus {
    if (pm25 == null) return 'Unknown';
    if (pm25! <= 12) return 'Good';
    if (pm25! <= 35.4) return 'Moderate';
    if (pm25! <= 55.4) return 'Unhealthy for Sensitive Groups';
    if (pm25! <= 150.4) return 'Unhealthy';
    if (pm25! <= 250.4) return 'Very Unhealthy';
    return 'Hazardous';
  }

  Color get statusColor {
    if (pm25 == null) return Colors.grey;
    if (pm25! <= 12) return Colors.green;
    if (pm25! <= 35.4) return Colors.yellow;
    if (pm25! <= 55.4) return Colors.orange;
    if (pm25! <= 150.4) return Colors.red;
    if (pm25! <= 250.4) return Colors.purple;
    return Colors.brown;
  }

  List<Widget> getCards() {
    return [
      AirQualityCard(
        title: 'PM2.5',
        value: pm25,
        unit: 'µg/m³',
        icon: Icons.air,
        color: statusColor,
      ),
      AirQualityCard(
        title: 'Temperature',
        value: temperature,
        unit: '°C',
        icon: Icons.thermostat,
        color: Colors.orange,
      ),
      AirQualityCard(
        title: 'Humidity',
        value: humidity,
        unit: '%',
        icon: Icons.water_drop,
        color: Colors.blue,
      ),
      AirQualityCard(
        title: 'Gas Level',
        value: gasLevel,
        unit: '',
        icon: Icons.cloud,
        color: Colors.purple,
      ),
    ];
  }
}