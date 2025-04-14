// Automatic FlutterFlow imports
import '/backend/backend.dart';
import "package:spotify_item_mwlatt/backend/schema/structs/index.dart"
    as spotify_item_mwlatt_data_schema;
import "package:spotify_item_mwlatt/backend/schema/structs/index.dart"
    as spotify_item_mwlatt_data_schema;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!

Future launchSpotifyLogin(BuildContext context, String uid) async {
  if (uid.isEmpty) {
    print("UID is missing. Make sure the user is logged in.");
    return;
  }

  final url =
      'https://accounts.spotify.com/authorize?client_id=f4e1a9bf37164211ac9e9f996375b60f&response_type=code&redirect_uri=https://spotifycallback-nqeqw2nsyq-uc.a.run.app&scope=user-read-private%20user-read-email&show_dialog=true&state=$uid';

  await launchURL(url);
}
