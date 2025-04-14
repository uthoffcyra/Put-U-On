import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _temp = prefs.getDouble('ff_temp') ?? _temp;
    });
    _safeInit(() {
      _weatherDescription =
          prefs.getString('ff_weatherDescription') ?? _weatherDescription;
    });
    _safeInit(() {
      _weatherIcon = prefs.getString('ff_weatherIcon') ?? _weatherIcon;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  double _temp = 0.0;
  double get temp => _temp;
  set temp(double value) {
    _temp = value;
    prefs.setDouble('ff_temp', value);
  }

  String _weatherDescription = '';
  String get weatherDescription => _weatherDescription;
  set weatherDescription(String value) {
    _weatherDescription = value;
    prefs.setString('ff_weatherDescription', value);
  }

  String _weatherIcon = '';
  String get weatherIcon => _weatherIcon;
  set weatherIcon(String value) {
    _weatherIcon = value;
    prefs.setString('ff_weatherIcon', value);
  }

  int _numSwipes = 0;
  int get numSwipes => _numSwipes;
  set numSwipes(int value) {
    _numSwipes = value;
  }

  String _spotifyToken = '';
  String get spotifyToken => _spotifyToken;
  set spotifyToken(String value) {
    _spotifyToken = value;
  }

  String _currentUserUid = '';
  String get currentUserUid => _currentUserUid;
  set currentUserUid(String value) {
    _currentUserUid = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
