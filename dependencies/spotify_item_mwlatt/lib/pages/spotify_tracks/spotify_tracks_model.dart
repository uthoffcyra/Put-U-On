import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/app_bar_title/app_bar_title_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'spotify_tracks_widget.dart' show SpotifyTracksWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SpotifyTracksModel extends FlutterFlowModel<SpotifyTracksWidget> {
  ///  Local state fields for this page.

  SpotifySongsStruct? spotifySongsPS;
  void updateSpotifySongsPSStruct(Function(SpotifySongsStruct) updateFn) {
    updateFn(spotifySongsPS ??= SpotifySongsStruct());
  }

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Recently played tracks)] action in spotifyTracks widget.
  ApiCallResponse? tracksRes;
  // Stores action output result for [Backend Call - API (Access Token)] action in spotifyTracks widget.
  ApiCallResponse? accessTokenRes;
  // Stores action output result for [Backend Call - API (Recently played tracks)] action in spotifyTracks widget.
  ApiCallResponse? tracks2Res;
  // Model for appBarTitle component.
  late AppBarTitleModel appBarTitleModel;

  @override
  void initState(BuildContext context) {
    appBarTitleModel = createModel(context, () => AppBarTitleModel());
  }

  @override
  void dispose() {
    appBarTitleModel.dispose();
  }
}
