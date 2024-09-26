import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const WeatherScreen(),
    );
  }
}

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final TextEditingController _city = TextEditingController();
  String cityName = 'City Name';
  String temperature = 'Temperature';
  String weather = 'Weather Condition';

  void _fetchWeather() {
    setState(() {
      cityName = _city.text;
      temperature = '';
      weather = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Weather App'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _city,
                decoration: InputDecoration(
                  labelText: 'Enter City Name',
                ),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: _fetchWeather,
                child: const Text('Fetch Weather'),
              ),
              const SizedBox(height: 20.0),
              Text(
                cityName,
              ),
              const SizedBox(height: 20.0),
              Text(
                temperature,
              ),
              const SizedBox(height: 20.0),
              Text(
                weather,
              )
            ],
          )),
    );
  }
}
