import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/about_algorithms/about_algorithms_widget.dart';
import '/components/nps/nps_widget.dart';
import '/components/you_tube_popup/you_tube_popup_widget.dart';
import '/flutter_flow/flutter_flow_ad_banner.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_swipeable_stack.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_youtube_player.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:async';
import 'package:spotify_item_mwlatt/app_state.dart'
    as spotify_item_mwlatt_app_state;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'golden_path_model.dart';
export 'golden_path_model.dart';

class GoldenPathWidget extends StatefulWidget {
  const GoldenPathWidget({super.key});

  static String routeName = 'goldenPath';
  static String routePath = 'goldenpath';

  @override
  State<GoldenPathWidget> createState() => _GoldenPathWidgetState();
}

class _GoldenPathWidgetState extends State<GoldenPathWidget>
    with TickerProviderStateMixin {
  late GoldenPathModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GoldenPathModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'goldenPath'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('GOLDEN_PATH_goldenPath_ON_INIT_STATE');
      logFirebaseEvent('goldenPath_action_block');
      await _model.refreshRecommended(context);
      safeSetState(() {});
    });

    animationsMap.addAll({
      'containerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 500.0.ms,
            begin: 0.2,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        loop: true,
        reverse: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 800.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(0.0, 30.0),
          ),
        ],
      ),
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
    context.watch<spotify_item_mwlatt_app_state.FFAppState>();

    return YoutubeFullScreenWrapper(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: Color(0xFF11001C),
          body: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Container(
              constraints: BoxConstraints(
                maxWidth: 400.0,
              ),
              decoration: BoxDecoration(),
              child: Container(
                width: double.infinity,
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            () {
                              if (_model.lastSwipeDirection == 'left') {
                                return Color(0x85FF5963);
                              } else if (_model.lastSwipeDirection == 'right') {
                                return Color(0x88249689);
                              } else {
                                return Color(0x4C6E60EE);
                              }
                            }(),
                            Colors.transparent
                          ],
                          stops: [0.0, 0.4],
                          begin: AlignmentDirectional(
                              computeGradientAlignmentX(
                                  _model.lastSwipeDirection == 'left'
                                      ? 340.0
                                      : 20.0),
                              computeGradientAlignmentY(
                                  _model.lastSwipeDirection == 'left'
                                      ? 340.0
                                      : 20.0)),
                          end: AlignmentDirectional(
                              -1 *
                                  computeGradientAlignmentX(
                                      _model.lastSwipeDirection == 'left'
                                          ? 340.0
                                          : 20.0),
                              -1 *
                                  computeGradientAlignmentY(
                                      _model.lastSwipeDirection == 'left'
                                          ? 340.0
                                          : 20.0)),
                        ),
                      ),
                    ).animateOnPageLoad(
                        animationsMap['containerOnPageLoadAnimation1']!),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0,
                            50.0,
                            0.0,
                            valueOrDefault<double>(
                              !FFDevEnvironmentValues().showAds ? 50.0 : 0.0,
                              0.0,
                            )),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 20.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Container(
                                      width: 40.0,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        color: Color(0xFF361665),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Container(
                                          width: double.infinity,
                                          height: double.infinity,
                                          child: Stack(
                                            children: [
                                              if (_model.dropDownValue ==
                                                  'Standard')
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Icon(
                                                    Icons.headset_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 24.0,
                                                  ),
                                                ),
                                              if (_model.dropDownValue ==
                                                  'Weather/AI')
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Icon(
                                                    Icons.sunny_snowing,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 24.0,
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  AuthUserStreamWidget(
                                    builder: (context) =>
                                        FlutterFlowDropDown<String>(
                                      controller:
                                          _model.dropDownValueController ??=
                                              FormFieldController<String>(
                                        _model.dropDownValue ??=
                                            valueOrDefault<String>(
                                          valueOrDefault(
                                              currentUserDocument
                                                  ?.lastUsedFlavor,
                                              ''),
                                          'Standard',
                                        ),
                                      ),
                                      options: ['Weather/AI', 'Standard'],
                                      onChanged: (val) async {
                                        safeSetState(
                                            () => _model.dropDownValue = val);
                                        logFirebaseEvent(
                                            'GOLDEN_PATH_DropDown_6dke0030_ON_FORM_WI');
                                        logFirebaseEvent(
                                            'DropDown_action_block');
                                        await _model.dumpRecommended(context);
                                        safeSetState(() {});
                                        logFirebaseEvent(
                                            'DropDown_backend_call');

                                        await currentUserReference!
                                            .update(createUsersRecordData(
                                          lastUsedFlavor: _model.dropDownValue,
                                        ));
                                        logFirebaseEvent(
                                            'DropDown_action_block');
                                        await _model
                                            .refreshRecommended(context);
                                        safeSetState(() {});
                                      },
                                      width: 240.0,
                                      height: 40.0,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                      hintText: 'Select...',
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24.0,
                                      ),
                                      fillColor: Color(0xFF361665),
                                      elevation: 2.0,
                                      borderColor: Colors.transparent,
                                      borderWidth: 0.0,
                                      borderRadius: 8.0,
                                      margin: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 12.0, 0.0),
                                      hidesUnderline: true,
                                      isOverButton: false,
                                      isSearchable: false,
                                      isMultiSelect: false,
                                    ),
                                  ),
                                  FlutterFlowIconButton(
                                    borderRadius: 8.0,
                                    buttonSize: 40.0,
                                    fillColor: Color(0xFF361665),
                                    icon: Icon(
                                      Icons.question_mark,
                                      color: FlutterFlowTheme.of(context).info,
                                      size: 24.0,
                                    ),
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'GOLDEN_PATH_question_mark_ICN_ON_TAP');
                                      logFirebaseEvent(
                                          'IconButton_bottom_sheet');
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        context: context,
                                        builder: (context) {
                                          return WebViewAware(
                                            child: GestureDetector(
                                              onTap: () {
                                                FocusScope.of(context)
                                                    .unfocus();
                                                FocusManager
                                                    .instance.primaryFocus
                                                    ?.unfocus();
                                              },
                                              child: Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child: AboutAlgorithmsWidget(),
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));
                                    },
                                  ),
                                ].divide(SizedBox(width: 12.0)),
                              ),
                            ),
                            if (_model.recommendations.isNotEmpty)
                              Expanded(
                                child: Builder(
                                  builder: (context) {
                                    final trackItem = _model.recommendations
                                        .map((e) => e)
                                        .toList();

                                    return FlutterFlowSwipeableStack(
                                      onSwipeFn: (index) async {
                                        logFirebaseEvent(
                                            'GOLDEN_PATH_SwipeableStack_avtdctyz_ON_W');
                                        final trackItemItem = trackItem[index];
                                        logFirebaseEvent(
                                            'SwipeableStack_update_page_state');
                                        _model.sessionSwipes =
                                            _model.sessionSwipes + 1;
                                        _model.showVideo = false;
                                        logFirebaseEvent(
                                            'SwipeableStack_action_block');
                                        unawaited(
                                          () async {
                                            await _model
                                                .gradientRefresh(context);
                                            safeSetState(() {});
                                          }(),
                                        );
                                        if (_model.sessionSwipes >=
                                            _model.recommendations.length) {
                                          logFirebaseEvent(
                                              'SwipeableStack_action_block');
                                          await _model.dumpRecommended(context);
                                          safeSetState(() {});
                                          logFirebaseEvent(
                                              'SwipeableStack_action_block');
                                          await _model
                                              .refreshRecommended(context);
                                          safeSetState(() {});
                                        }
                                      },
                                      onLeftSwipe: (index) async {
                                        logFirebaseEvent(
                                            'GOLDEN_PATH_SwipeableStack_avtdctyz_ON_L');
                                        final trackItemItem = trackItem[index];
                                        logFirebaseEvent(
                                            'SwipeableStack_update_page_state');
                                        _model.lastSwipeDirection = 'left';
                                        safeSetState(() {});
                                      },
                                      onRightSwipe: (index) async {
                                        logFirebaseEvent(
                                            'GOLDEN_PATH_SwipeableStack_avtdctyz_ON_R');
                                        final trackItemItem = trackItem[index];
                                        // Add to Liked Songs list.
                                        logFirebaseEvent(
                                            'SwipeableStack_AddtoLikedSongslist');

                                        await LikedSongsRecord.collection
                                            .doc()
                                            .set({
                                          ...createLikedSongsRecordData(
                                            coverArt: getJsonField(
                                              trackItemItem,
                                              r'''$.image''',
                                            ).toString(),
                                            songTitle: getJsonField(
                                              trackItemItem,
                                              r'''$.track''',
                                            ).toString(),
                                            artist: getJsonField(
                                              trackItemItem,
                                              r'''$.artist''',
                                            ).toString(),
                                            user: currentUserReference,
                                            url: getJsonField(
                                              trackItemItem,
                                              r'''$.url''',
                                            ).toString(),
                                            explicit: getJsonField(
                                              trackItemItem,
                                              r'''$.explicit''',
                                            ),
                                          ),
                                          ...mapToFirestore(
                                            {
                                              'added':
                                                  FieldValue.serverTimestamp(),
                                            },
                                          ),
                                        });
                                        // Update taste profile.
                                        logFirebaseEvent(
                                            'SwipeableStack_Updatetasteprofile');
                                        await _model.incrementGenreWeights(
                                          context,
                                          likedTags: (getJsonField(
                                            trackItemItem,
                                            r'''$.artist_genres	''',
                                            true,
                                          ) as List)
                                              .map<String>((s) => s.toString())
                                              .toList(),
                                        );
                                        // Update Gradient.
                                        logFirebaseEvent(
                                            'SwipeableStack_UpdateGradient');
                                        _model.lastSwipeDirection = 'right';
                                        safeSetState(() {});
                                        // Update Swipe Count
                                        logFirebaseEvent(
                                            'SwipeableStack_UpdateSwipeCount');
                                        FFAppState().numSwipes =
                                            FFAppState().numSwipes + 1;
                                        safeSetState(() {});
                                        if (FFAppState().numSwipes == 10) {
                                          // Openm NPS dialog.
                                          logFirebaseEvent(
                                              'SwipeableStack_OpenmNPSdialog');
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            isDismissible: false,
                                            enableDrag: false,
                                            context: context,
                                            builder: (context) {
                                              return WebViewAware(
                                                child: GestureDetector(
                                                  onTap: () {
                                                    FocusScope.of(context)
                                                        .unfocus();
                                                    FocusManager
                                                        .instance.primaryFocus
                                                        ?.unfocus();
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        MediaQuery.viewInsetsOf(
                                                            context),
                                                    child: NpsWidget(),
                                                  ),
                                                ),
                                              );
                                            },
                                          ).then(
                                              (value) => safeSetState(() {}));
                                        }
                                      },
                                      onUpSwipe: (index) {},
                                      onDownSwipe: (index) {},
                                      itemBuilder: (context, trackItemIndex) {
                                        final trackItemItem =
                                            trackItem[trackItemIndex];
                                        return Material(
                                          color: Colors.transparent,
                                          elevation: 1.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                          ),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 4.0,
                                                  color: Color(0x2B202529),
                                                  offset: Offset(
                                                    0.0,
                                                    2.0,
                                                  ),
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                width: 2.0,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(20.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      if (!_model.showVideo)
                                                        Container(
                                                          width: 240.0,
                                                          height: 240.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0x17923297),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                          ),
                                                          child: Stack(
                                                            children: [
                                                              ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            16.0),
                                                                child: Image
                                                                    .network(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    getJsonField(
                                                                      trackItemItem,
                                                                      r'''$.image''',
                                                                    )?.toString(),
                                                                    'https://firebasestorage.googleapis.com/v0/b/put-u-on-v87ycz.firebasestorage.app/o/vinyl.jpg?alt=media&token=f8a5bf0e-4560-4607-8c9c-ec4ffdd8cfc2',
                                                                  ),
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Builder(
                                                                  builder:
                                                                      (context) =>
                                                                          FlutterFlowIconButton(
                                                                    borderRadius:
                                                                        1000.0,
                                                                    buttonSize:
                                                                        50.0,
                                                                    fillColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    icon: Icon(
                                                                      Icons
                                                                          .play_arrow,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .info,
                                                                      size:
                                                                          30.0,
                                                                    ),
                                                                    onPressed:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'GOLDEN_PATH_PAGE_PlayButton_ON_TAP');
                                                                      logFirebaseEvent(
                                                                          'PlayButton_backend_call');
                                                                      _model.youtubeButton =
                                                                          await YoutubeApiCall
                                                                              .call(
                                                                        searchQuery:
                                                                            '${getJsonField(
                                                                          trackItemItem,
                                                                          r'''$.track''',
                                                                        ).toString()} ${getJsonField(
                                                                          trackItemItem,
                                                                          r'''$.artist''',
                                                                        ).toString()}',
                                                                      );

                                                                      if ((_model
                                                                              .youtubeButton
                                                                              ?.succeeded ??
                                                                          true)) {
                                                                        logFirebaseEvent(
                                                                            'PlayButton_update_app_state');
                                                                        FFAppState().youtubeID =
                                                                            YoutubeApiCall.videoID(
                                                                          (_model.youtubeButton?.jsonBody ??
                                                                              ''),
                                                                        )!;
                                                                        safeSetState(
                                                                            () {});
                                                                        logFirebaseEvent(
                                                                            'PlayButton_alert_dialog');
                                                                        await showDialog(
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (dialogContext) {
                                                                            return Dialog(
                                                                              elevation: 0,
                                                                              insetPadding: EdgeInsets.zero,
                                                                              backgroundColor: Colors.transparent,
                                                                              alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                              child: WebViewAware(
                                                                                child: GestureDetector(
                                                                                  onTap: () {
                                                                                    FocusScope.of(dialogContext).unfocus();
                                                                                    FocusManager.instance.primaryFocus?.unfocus();
                                                                                  },
                                                                                  child: Container(
                                                                                    height: 300.0,
                                                                                    width: 400.0,
                                                                                    child: YouTubePopupWidget(),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            );
                                                                          },
                                                                        );
                                                                      } else {
                                                                        logFirebaseEvent(
                                                                            'PlayButton_show_snack_bar');
                                                                        ScaffoldMessenger.of(context)
                                                                            .showSnackBar(
                                                                          SnackBar(
                                                                            content:
                                                                                Text(
                                                                              'Couldn\'t find song for playback.',
                                                                              style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                    ),
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                  ),
                                                                            ),
                                                                            duration:
                                                                                Duration(milliseconds: 4000),
                                                                            backgroundColor:
                                                                                FlutterFlowTheme.of(context).error,
                                                                          ),
                                                                        );
                                                                      }

                                                                      safeSetState(
                                                                          () {});
                                                                    },
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      if (_model.showVideo)
                                                        FlutterFlowYoutubePlayer(
                                                          url:
                                                              'https://www.youtube.com/watch?v=${FFAppState().youtubeID}',
                                                          width: 240.0,
                                                          height: 240.0,
                                                          autoPlay: false,
                                                          looping: true,
                                                          mute: false,
                                                          showControls: true,
                                                          showFullScreen: true,
                                                          strictRelatedVideos:
                                                              true,
                                                        ),
                                                    ],
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Flexible(
                                                            child: Text(
                                                              getJsonField(
                                                                trackItemItem,
                                                                r'''$.track''',
                                                              ).toString(),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleLarge
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .interTight(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleLarge
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleLarge
                                                                          .fontStyle,
                                                                    ),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleLarge
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleLarge
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          ),
                                                          if (getJsonField(
                                                            trackItemItem,
                                                            r'''$.explicit''',
                                                          ))
                                                            Icon(
                                                              Icons
                                                                  .explicit_rounded,
                                                              color: Color(
                                                                  0xB3745276),
                                                              size: 20.0,
                                                            ),
                                                        ].divide(SizedBox(
                                                            width: 8.0)),
                                                      ),
                                                      Text(
                                                        getJsonField(
                                                          trackItemItem,
                                                          r'''$.artist''',
                                                        ).toString(),
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
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
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
                                                    ].divide(
                                                        SizedBox(height: 8.0)),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      FlutterFlowIconButton(
                                                        borderRadius: 8.0,
                                                        buttonSize: 60.0,
                                                        fillColor: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        icon: Icon(
                                                          Icons
                                                              .thumb_down_sharp,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .info,
                                                          size: 32.0,
                                                        ),
                                                        onPressed: () async {
                                                          logFirebaseEvent(
                                                              'GOLDEN_PATH_PAGE_dislike_ON_TAP');
                                                          logFirebaseEvent(
                                                              'dislike_swipeable_stack');
                                                          _model
                                                              .swipeableStackController
                                                              .swipeLeft();
                                                        },
                                                      ),
                                                      FlutterFlowIconButton(
                                                        borderRadius: 8.0,
                                                        buttonSize: 60.0,
                                                        fillColor: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        icon: Icon(
                                                          Icons.open_in_new,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .info,
                                                          size: 32.0,
                                                        ),
                                                        onPressed: () async {
                                                          logFirebaseEvent(
                                                              'GOLDEN_PATH_PAGE_openExternal_ON_TAP');
                                                          logFirebaseEvent(
                                                              'openExternal_launch_u_r_l');
                                                          await launchURL(
                                                              getJsonField(
                                                            trackItemItem,
                                                            r'''$.url''',
                                                          ).toString());
                                                        },
                                                      ),
                                                      FlutterFlowIconButton(
                                                        borderRadius: 8.0,
                                                        buttonSize: 60.0,
                                                        fillColor: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        icon: Icon(
                                                          Icons.favorite,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .info,
                                                          size: 32.0,
                                                        ),
                                                        onPressed: () async {
                                                          logFirebaseEvent(
                                                              'GOLDEN_PATH_PAGE_love_ON_TAP');
                                                          logFirebaseEvent(
                                                              'love_backend_call');

                                                          await LikedSongsRecord
                                                              .collection
                                                              .doc()
                                                              .set(
                                                                  createLikedSongsRecordData(
                                                                coverArt:
                                                                    getJsonField(
                                                                  trackItemItem,
                                                                  r'''$.image''',
                                                                ).toString(),
                                                                songTitle:
                                                                    getJsonField(
                                                                  trackItemItem,
                                                                  r'''$.track''',
                                                                ).toString(),
                                                                artist:
                                                                    getJsonField(
                                                                  trackItemItem,
                                                                  r'''$.artist''',
                                                                ).toString(),
                                                                user:
                                                                    currentUserReference,
                                                              ));
                                                          logFirebaseEvent(
                                                              'love_swipeable_stack');
                                                          _model
                                                              .swipeableStackController
                                                              .swipeRight();
                                                          logFirebaseEvent(
                                                              'love_update_app_state');
                                                          FFAppState()
                                                                  .numSwipes =
                                                              FFAppState()
                                                                      .numSwipes +
                                                                  1;
                                                          safeSetState(() {});
                                                          if (FFAppState()
                                                                  .numSwipes ==
                                                              5) {
                                                            logFirebaseEvent(
                                                                'love_bottom_sheet');
                                                            await showModalBottomSheet(
                                                              isScrollControlled:
                                                                  true,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              isDismissible:
                                                                  false,
                                                              enableDrag: false,
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return WebViewAware(
                                                                  child:
                                                                      GestureDetector(
                                                                    onTap: () {
                                                                      FocusScope.of(
                                                                              context)
                                                                          .unfocus();
                                                                      FocusManager
                                                                          .instance
                                                                          .primaryFocus
                                                                          ?.unfocus();
                                                                    },
                                                                    child:
                                                                        Padding(
                                                                      padding: MediaQuery
                                                                          .viewInsetsOf(
                                                                              context),
                                                                      child:
                                                                          NpsWidget(),
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                safeSetState(
                                                                    () {}));
                                                          }
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ].divide(
                                                    SizedBox(height: 30.0)),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                      itemCount: trackItem.length,
                                      controller:
                                          _model.swipeableStackController,
                                      loop: false,
                                      cardDisplayCount: 3,
                                      scale: 0.9,
                                    );
                                  },
                                ),
                              ),
                            if (!(_model.recommendations.isNotEmpty))
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.0),
                                  border: Border.all(
                                    color: Color(0x47AEAEAE),
                                    width: 2.0,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(30.0),
                                  child: Text(
                                    'Finding you new some fresh tunes...',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle: FontStyle.italic,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle: FontStyle.italic,
                                        ),
                                  ),
                                ),
                              ).animateOnPageLoad(animationsMap[
                                  'containerOnPageLoadAnimation2']!),
                            if (FFDevEnvironmentValues().showTestText)
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 20.0),
                                child: Text(
                                  'golden',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle: FontStyle.italic,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FontStyle.italic,
                                      ),
                                ),
                              ),
                            if (FFDevEnvironmentValues().showAds)
                              Align(
                                alignment: AlignmentDirectional(0.0, 1.0),
                                child: FlutterFlowAdBanner(
                                  showsTestAd: false,
                                  androidAdUnitID:
                                      'ca-app-pub-2950810636009245~2256712801',
                                ),
                              ),
                          ].divide(SizedBox(height: 20.0)),
                        ),
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
