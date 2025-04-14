import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/app_bar_title/app_bar_title_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'spotify_auth_widget.dart' show SpotifyAuthWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SpotifyAuthModel extends FlutterFlowModel<SpotifyAuthWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Access Refresh Token)] action in spotifyAuth widget.
  ApiCallResponse? spotifyAuthRes;
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
