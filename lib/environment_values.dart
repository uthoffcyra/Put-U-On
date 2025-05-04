import 'dart:convert';
import 'package:flutter/services.dart';

class FFDevEnvironmentValues {
  static const String currentEnvironment = 'Production';
  static const String environmentValuesPath =
      'assets/environment_values/environment.json';

  static final FFDevEnvironmentValues _instance =
      FFDevEnvironmentValues._internal();

  factory FFDevEnvironmentValues() {
    return _instance;
  }

  FFDevEnvironmentValues._internal();

  Future<void> initialize() async {
    try {
      final String response =
          await rootBundle.loadString(environmentValuesPath);
      final data = await json.decode(response);
      _currentEnv = data['currentEnv'];
      _stripeAPI = data['stripeAPI'];
      _showTestText = data['showTestText'];
      _showAds = data['showAds'];
    } catch (e) {
      print('Error loading environment values: $e');
    }
  }

  String _currentEnv = '';
  String get currentEnv => _currentEnv;

  String _stripeAPI = '';
  String get stripeAPI => _stripeAPI;

  bool _showTestText = false;
  bool get showTestText => _showTestText;

  bool _showAds = false;
  bool get showAds => _showAds;
}
