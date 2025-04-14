import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

import 'package:spotify_item_mwlatt/backend/schema/structs/index.dart';

class FFLibraryValues {
  static FFLibraryValues _instance = FFLibraryValues._internal();

  factory FFLibraryValues() {
    return _instance;
  }

  FFLibraryValues._internal();

  static void reset() {
    _instance = FFLibraryValues._internal();
  }

  String clientID = 'f2d5c651b682459d96ef8cc2a605483c';
  String clientSecret = '107bef38d56649c4ae2d9c385d1ace40';
  String redirectUrlWeb = 'https://spotifyapp.flutterflow.app/spotify';
  String redirectUrlMobile = 'spotify://spotify.com/spotify';
}
