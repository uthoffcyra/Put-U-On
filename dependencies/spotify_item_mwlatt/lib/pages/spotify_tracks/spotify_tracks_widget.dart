import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/app_bar_title/app_bar_title_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'spotify_tracks_model.dart';
export 'spotify_tracks_model.dart';

class SpotifyTracksWidget extends StatefulWidget {
  const SpotifyTracksWidget({super.key});

  static String routeName = 'spotifyTracks';
  static String routePath = 'spotifyTracks';
  static void maybeSetRouteName(String? updatedRouteName) =>
      routeName = updatedRouteName ?? routeName;
  static void maybeSetRoutePath(String? updatedRoutePath) =>
      routePath = updatedRoutePath ?? routePath;

  @override
  State<SpotifyTracksWidget> createState() => _SpotifyTracksWidgetState();
}

class _SpotifyTracksWidgetState extends State<SpotifyTracksWidget> {
  late SpotifyTracksModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SpotifyTracksModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.tracksRes = await SpotifyAPIGroup.recentlyPlayedTracksCall.call(
        accessToken: FFAppState().spotifyAS.tokens.accessToken,
      );

      if ((_model.tracksRes?.succeeded ?? true)) {
        _model.spotifySongsPS =
            SpotifySongsStruct.maybeFromMap((_model.tracksRes?.jsonBody ?? ''));
        safeSetState(() {});
      } else {
        _model.accessTokenRes =
            await SpotifyAccountAPIGroup.accessTokenCall.call(
          base64: valueOrDefault<String>(
            functions.toBase64(
                '${FFLibraryValues().clientID}:${FFLibraryValues().clientSecret}'),
            '123',
          ),
          refreshToken: FFAppState().spotifyAS.tokens.refreshToken,
        );

        if ((_model.accessTokenRes?.succeeded ?? true)) {
          _model.tracks2Res =
              await SpotifyAPIGroup.recentlyPlayedTracksCall.call(
            accessToken: SpotifyAuthStruct.maybeFromMap(
                    (_model.accessTokenRes?.jsonBody ?? ''))
                ?.accessToken,
          );

          if ((_model.tracks2Res?.succeeded ?? true)) {
            _model.spotifySongsPS = SpotifySongsStruct.maybeFromMap(
                (_model.tracks2Res?.jsonBody ?? ''));
            safeSetState(() {});
          }
        }
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFF5F5F5),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            context.pushNamed(HelpWidget.routeName);
          },
          backgroundColor: FlutterFlowTheme.of(context).primary,
          elevation: 8.0,
          child: Icon(
            Icons.help,
            color: FlutterFlowTheme.of(context).alternate,
            size: 24.0,
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.black,
          automaticallyImplyLeading: false,
          title: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              context.pushNamed(HomeWidget.routeName);
            },
            child: wrapWithModel(
              model: _model.appBarTitleModel,
              updateCallback: () => safeSetState(() {}),
              child: AppBarTitleWidget(
                title: 'Spotify - Recently Played Songs',
              ),
            ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 4.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
            child: Builder(
              builder: (context) {
                final item = _model.spotifySongsPS?.items?.toList() ?? [];

                return ListView.separated(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: item.length,
                  separatorBuilder: (_, __) => SizedBox(height: 16.0),
                  itemBuilder: (context, itemIndex) {
                    final itemItem = item[itemIndex];
                    return Material(
                      color: Colors.transparent,
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 16.0, 16.0, 16.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  itemItem.track.album.images.firstOrNull!.url,
                                  width: 80.0,
                                  height: 80.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      itemItem.track.name,
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Text(
                                      functions.listToComma(
                                          itemItem.track.artists.toList()),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Text(
                                      itemItem.track.album.name,
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ].divide(SizedBox(height: 4.0)),
                                ),
                              ),
                              Text(
                                functions
                                    .formatDuration(itemItem.track.durationMs),
                                style: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ].divide(SizedBox(width: 16.0)),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
