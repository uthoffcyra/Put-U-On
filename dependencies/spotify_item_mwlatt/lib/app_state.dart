import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'package:ff_commons/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

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
      if (prefs.containsKey('ff_spotifyAS')) {
        try {
          final serializedData = prefs.getString('ff_spotifyAS') ?? '{}';
          _spotifyAS =
              SpotifyDTStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  SpotifyDTStruct _spotifyAS = SpotifyDTStruct.fromSerializableMap(jsonDecode(
      '{\"accessLevel\":\"user-read-recently-played\",\"tokens\":\"{\\\"access_token\\\":\\\"access\\\"}\"}'));
  SpotifyDTStruct get spotifyAS => _spotifyAS;
  set spotifyAS(SpotifyDTStruct value) {
    _spotifyAS = value;
    prefs.setString('ff_spotifyAS', value.serialize());
  }

  void updateSpotifyASStruct(Function(SpotifyDTStruct) updateFn) {
    updateFn(_spotifyAS);
    prefs.setString('ff_spotifyAS', _spotifyAS.serialize());
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
