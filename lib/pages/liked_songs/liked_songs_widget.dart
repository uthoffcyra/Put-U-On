import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'liked_songs_model.dart';
export 'liked_songs_model.dart';

class LikedSongsWidget extends StatefulWidget {
  const LikedSongsWidget({super.key});

  static String routeName = 'likedSongs';
  static String routePath = 'likedSongs';

  @override
  State<LikedSongsWidget> createState() => _LikedSongsWidgetState();
}

class _LikedSongsWidgetState extends State<LikedSongsWidget> {
  late LikedSongsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LikedSongsModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'likedSongs'});
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          title: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
            child: Text(
              'Liked Songs',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    font: GoogleFonts.interTight(
                      fontWeight: FlutterFlowTheme.of(context)
                          .headlineMedium
                          .fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                    ),
                    color: Colors.white,
                    fontSize: 32.0,
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                  ),
            ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Container(
              constraints: BoxConstraints(
                maxWidth: 600.0,
              ),
              decoration: BoxDecoration(),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: StreamBuilder<List<LikedSongsRecord>>(
                        stream: queryLikedSongsRecord(
                          queryBuilder: (likedSongsRecord) => likedSongsRecord
                              .where(
                                'user',
                                isEqualTo: currentUserReference,
                              )
                              .orderBy('added', descending: true),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<LikedSongsRecord> columnLikedSongsRecordList =
                              snapshot.data!;

                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            children:
                                List.generate(columnLikedSongsRecordList.length,
                                    (columnIndex) {
                              final columnLikedSongsRecord =
                                  columnLikedSongsRecordList[columnIndex];
                              return Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(
                                    color: Color(0xB3611265),
                                    width: 2.0,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(20.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.network(
                                              columnLikedSongsRecord.coverArt,
                                              width: 80.0,
                                              height: 80.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Flexible(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Flexible(
                                                      child: Text(
                                                        columnLikedSongsRecord
                                                            .songTitle,
                                                        textAlign:
                                                            TextAlign.start,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .interTight(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ),
                                                    if (columnLikedSongsRecord
                                                        .explicit)
                                                      Icon(
                                                        Icons.explicit_rounded,
                                                        color:
                                                            Color(0xB3BF5AC3),
                                                        size: 20.0,
                                                      ),
                                                  ].divide(
                                                      SizedBox(width: 6.0)),
                                                ),
                                                Text(
                                                  columnLikedSongsRecord.artist,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ].divide(SizedBox(height: 8.0)),
                                            ),
                                          ),
                                        ].divide(SizedBox(width: 20.0)),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          FlutterFlowIconButton(
                                            borderRadius: 8.0,
                                            buttonSize: 50.0,
                                            fillColor: columnLikedSongsRecord
                                                    .recommended
                                                ? Color(0xFF249689)
                                                : Color(0xB33C033D),
                                            icon: Icon(
                                              Icons.emoji_people,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 32.0,
                                            ),
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'LIKED_SONGS_PAGE_emoji_people_ICN_ON_TAP');
                                              if (columnLikedSongsRecord
                                                  .recommended) {
                                                logFirebaseEvent(
                                                    'IconButton_backend_call');

                                                await columnLikedSongsRecord
                                                    .reference
                                                    .update(
                                                        createLikedSongsRecordData(
                                                  recommended: false,
                                                ));
                                              } else {
                                                logFirebaseEvent(
                                                    'IconButton_backend_call');

                                                await columnLikedSongsRecord
                                                    .reference
                                                    .update({
                                                  ...createLikedSongsRecordData(
                                                    recommended: true,
                                                  ),
                                                  ...mapToFirestore(
                                                    {
                                                      'added': FieldValue
                                                          .serverTimestamp(),
                                                    },
                                                  ),
                                                });
                                              }
                                            },
                                          ),
                                          FlutterFlowIconButton(
                                            borderRadius: 8.0,
                                            buttonSize: 50.0,
                                            fillColor: Color(0xB33C033D),
                                            icon: Icon(
                                              Icons.open_in_new,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 32.0,
                                            ),
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'LIKED_SONGS_PAGE_open_in_new_ICN_ON_TAP');
                                              logFirebaseEvent(
                                                  'IconButton_launch_u_r_l');
                                              await launchURL(
                                                  columnLikedSongsRecord.url);
                                            },
                                          ),
                                          FlutterFlowIconButton(
                                            borderRadius: 8.0,
                                            buttonSize: 50.0,
                                            fillColor: Color(0xB33C033D),
                                            icon: Icon(
                                              Icons.remove_circle_outline,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 32.0,
                                            ),
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'LIKED_SONGS_remove_circle_outline_ICN_ON');
                                              logFirebaseEvent(
                                                  'IconButton_alert_dialog');
                                              var confirmDialogResponse =
                                                  await showDialog<bool>(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return WebViewAware(
                                                            child: AlertDialog(
                                                              title: Text(
                                                                  'Are you sure?'),
                                                              content: Text(
                                                                  'This will be removed from your liked songs list. Deletion is permanent'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext,
                                                                          false),
                                                                  child: Text(
                                                                      'Cancel'),
                                                                ),
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext,
                                                                          true),
                                                                  child: Text(
                                                                      'Confirm'),
                                                                ),
                                                              ],
                                                            ),
                                                          );
                                                        },
                                                      ) ??
                                                      false;
                                              if (confirmDialogResponse) {
                                                logFirebaseEvent(
                                                    'IconButton_backend_call');
                                                await columnLikedSongsRecord
                                                    .reference
                                                    .delete();
                                              }
                                            },
                                          ),
                                        ].divide(SizedBox(width: 20.0)),
                                      ),
                                    ].divide(SizedBox(height: 20.0)),
                                  ),
                                ),
                              );
                            }).divide(SizedBox(height: 24.0)),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
