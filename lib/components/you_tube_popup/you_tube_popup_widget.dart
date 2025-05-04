import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_youtube_player.dart';
import 'package:spotify_item_mwlatt/app_state.dart'
    as spotify_item_mwlatt_app_state;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'you_tube_popup_model.dart';
export 'you_tube_popup_model.dart';

/// Video
class YouTubePopupWidget extends StatefulWidget {
  const YouTubePopupWidget({super.key});

  @override
  State<YouTubePopupWidget> createState() => _YouTubePopupWidgetState();
}

class _YouTubePopupWidgetState extends State<YouTubePopupWidget> {
  late YouTubePopupModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => YouTubePopupModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    context.watch<spotify_item_mwlatt_app_state.FFAppState>();

    return Container(
      width: 400.0,
      height: 300.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: FlutterFlowYoutubePlayer(
        url: 'https://www.youtube.com/watch?v=${FFAppState().youtubeID}',
        width: 400.0,
        height: 300.0,
        autoPlay: false,
        looping: true,
        mute: false,
        showControls: true,
        showFullScreen: true,
        strictRelatedVideos: true,
      ),
    );
  }
}
