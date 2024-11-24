import 'package:flutter/material.dart';
import '../models/air_quality_data.dart';
import '../services/thingspeak_service.dart';
import '../widgets/air_quality_card.dart';
import '../widgets/status_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ThingspeakService _service = ThingspeakService();
  AirQualityData? _data;
  String? _error;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchData();
    // Refresh data every 15 seconds
    Stream.periodic(const Duration(seconds: 15)).listen((_) => _fetchData());
  }

  Future<void> _fetchData() async {
    try {
      setState(() => _isLoading = true);
      final data = await _service.fetchAirQualityData();
      setState(() {
        _data = data;
        _error = null;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _fetchData,
        child: CustomScrollView(
          slivers: [
            const SliverAppBar(
              floating: true,
              title: Text('Air Quality Monitor'),
            ),
            SliverToBoxAdapter(
              child: StatusHeader(
                airQualityData: _data,
                isLoading: _isLoading,
              ),
            ),
            if (_error != null)
              SliverFillRemaining(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Error: $_error',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.error,
                        ),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: _fetchData,
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                ),
              )
            else if (_isLoading && _data == null)
              const SliverFillRemaining(
                child: Center(child: CircularProgressIndicator()),
              )
            else if (_data != null)
              SliverPadding(
                padding: const EdgeInsets.all(16),
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 1,
                  ),
                  delegate: SliverChildListDelegate(_data!.getCards()),
                ),
              ),
          ],
        ),
      ),
    );
  }
}