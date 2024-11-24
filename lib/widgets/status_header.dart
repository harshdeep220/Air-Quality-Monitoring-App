import 'package:flutter/material.dart';
import '../models/air_quality_data.dart';

class StatusHeader extends StatelessWidget {
  final AirQualityData? airQualityData;
  final bool isLoading;

  const StatusHeader({
    super.key,
    required this.airQualityData,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading && airQualityData == null) {
      return const SizedBox.shrink();
    }

    final status = airQualityData?.airQualityStatus ?? 'Unknown';
    final statusColor = airQualityData?.statusColor ?? Colors.grey;

    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 12,
            ),
            decoration: BoxDecoration(
              color: statusColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: statusColor,
                width: 2,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.lens,
                  size: 12,
                  color: statusColor,
                ),
                const SizedBox(width: 8),
                Text(
                  status,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: statusColor,
                  ),
                ),
              ],
            ),
          ),
          if (airQualityData?.timestamp != null) ...[
            const SizedBox(height: 8),
            Text(
              'Last updated: ${_formatDateTime(airQualityData!.timestamp!)}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ],
      ),
    );
  }

  String _formatDateTime(DateTime dateTime) {
    return '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
  }
}