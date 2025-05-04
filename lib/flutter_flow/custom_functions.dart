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
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';
import "package:spotify_item_mwlatt/backend/schema/structs/index.dart"
    as spotify_item_mwlatt_data_schema;
import 'package:spotify_item_mwlatt/flutter_flow/custom_functions.dart'
    as spotify_item_mwlatt_functions;

String? buildWeatherIconUrl(String? iconCode) {
  return "http://openweathermap.org/img/w/$iconCode.png";
}

String randomGenre(List<String> likedGenres) {
  // Get a random string from a list of strings.
  if (likedGenres.isEmpty) {
    return 'jazz';
  }
  final randomIndex = math.Random().nextInt(likedGenres.length);
  return likedGenres[randomIndex];
}

String stringToImagePath(String string) {
  return string;
}

String incrementGenreWeights(
  String weights,
  List<String>? genres,
) {
  if (genres == null || genres.length == 0) {
    return '{"jazz":0.5}';
  }

  final weightMap = jsonDecode(weights) as Map<String, dynamic>;

  for (final genre in genres!) {
    if (weightMap.containsKey(genre)) {
      // Existing genre gets weight boost
      weightMap[genre] = weightMap[genre]! + 0.2;
    } else {
      // New subgenre discovered - add with small initial weight
      weightMap[genre] = 0.5;
    }
  }

  return jsonEncode(weightMap);
}

String chooseWeightedGenre(String jsonWeights) {
  final userTasteProfile = jsonDecode(jsonWeights);

  // Calculate the sum of all weights
  double totalWeight = 0;
  for (double weight in userTasteProfile.values) {
    totalWeight += weight;
  }

  // Generate a random value between 0 and the total weight
  final random = math.Random();
  double randomValue = random.nextDouble() * totalWeight;

  // Find the genre that corresponds to the random value
  double currentSum = 0;
  for (var entry in userTasteProfile.entries) {
    currentSum += entry.value;
    if (randomValue <= currentSum) {
      return entry.key;
    }
  }

  // Fallback (should not reach here if the math is correct)
  return userTasteProfile.keys.first;
}
