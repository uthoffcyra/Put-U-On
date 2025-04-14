import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:ff_commons/flutter_flow/lat_lng.dart';
import 'package:ff_commons/flutter_flow/place.dart';
import 'package:ff_commons/flutter_flow/uploaded_file.dart';
import '/backend/backend.dart';
import "package:spotify_item_mwlatt/backend/schema/structs/index.dart"
    as spotify_item_mwlatt_data_schema;
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';
import "package:spotify_item_mwlatt/backend/schema/structs/index.dart"
    as spotify_item_mwlatt_data_schema;
import 'package:spotify_item_mwlatt/flutter_flow/custom_functions.dart'
    as spotify_item_mwlatt_functions;

String? buildWeatherIconUrl(String? iconCode) {
  return "http://openweathermap.org/img/w/$iconCode.png";
}
