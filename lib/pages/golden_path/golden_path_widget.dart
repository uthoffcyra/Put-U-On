import '/backend/api_requests/api_calls.dart';
import '/components/nps/nps_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_swipeable_stack.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:spotify_item_mwlatt/app_state.dart'
    as spotify_item_mwlatt_app_state;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'golden_path_model.dart';
export 'golden_path_model.dart';

class GoldenPathWidget extends StatefulWidget {
  const GoldenPathWidget({super.key});

  static String routeName = 'goldenPath';
  static String routePath = 'goldenpath';

  @override
  State<GoldenPathWidget> createState() => _GoldenPathWidgetState();
}

class _GoldenPathWidgetState extends State<GoldenPathWidget> {
  late GoldenPathModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GoldenPathModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'goldenPath'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('GOLDEN_PATH_goldenPath_ON_INIT_STATE');
      logFirebaseEvent('goldenPath_backend_call');
      _model.apiResult5dd = await GetRecommendationsCall.call(
        genre: 'jazz',
      );

      if ((_model.apiResult5dd?.succeeded ?? true)) {
        logFirebaseEvent('goldenPath_update_page_state');
        _model.recommendations = getJsonField(
          (_model.apiResult5dd?.jsonBody ?? ''),
          r'''$.recommendations''',
          true,
        )!
            .toList()
            .cast<dynamic>();
        safeSetState(() {});
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
    context.watch<spotify_item_mwlatt_app_state.FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFF11001C),
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Container(
              constraints: BoxConstraints(
                maxWidth: 400.0,
              ),
              decoration: BoxDecoration(),
              child: Stack(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 80.0, 0.0, 80.0),
                          child: Builder(
                            builder: (context) {
                              final trackItem =
                                  _model.recommendations.map((e) => e).toList();

                              return FlutterFlowSwipeableStack(
                                onSwipeFn: (index) {},
                                onLeftSwipe: (index) {},
                                onRightSwipe: (index) async {
                                  logFirebaseEvent(
                                      'GOLDEN_PATH_SwipeableStack_avtdctyz_ON_R');
                                  final trackItemItem = trackItem[index];
                                  logFirebaseEvent(
                                      'SwipeableStack_update_app_state');
                                  FFAppState().numSwipes =
                                      FFAppState().numSwipes + 1;
                                  safeSetState(() {});
                                  if (FFAppState().numSwipes == 5) {
                                    logFirebaseEvent(
                                        'SwipeableStack_bottom_sheet');
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      isDismissible: false,
                                      enableDrag: false,
                                      context: context,
                                      builder: (context) {
                                        return GestureDetector(
                                          onTap: () {
                                            FocusScope.of(context).unfocus();
                                            FocusManager.instance.primaryFocus
                                                ?.unfocus();
                                          },
                                          child: Padding(
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
                                            child: NpsWidget(),
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));
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
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
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
                                          color: FlutterFlowTheme.of(context)
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
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  width: 3.0,
                                                ),
                                              ),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                                child: Image.network(
                                                  valueOrDefault<String>(
                                                    getJsonField(
                                                      trackItemItem,
                                                      r'''$.image''',
                                                    )?.toString(),
                                                    'https://firebasestorage.googleapis.com/v0/b/put-u-on-v87ycz.firebasestorage.app/o/vinyl.jpg?alt=media&token=f8a5bf0e-4560-4607-8c9c-ec4ffdd8cfc2',
                                                  ),
                                                  width: 240.0,
                                                  height: 240.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  getJsonField(
                                                    trackItemItem,
                                                    r'''$.track''',
                                                  ).toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleLarge
                                                      .override(
                                                        fontFamily:
                                                            'Inter Tight',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                                Text(
                                                  getJsonField(
                                                    trackItemItem,
                                                    r'''$.artist''',
                                                  ).toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleMedium
                                                      .override(
                                                        fontFamily:
                                                            'Inter Tight',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ].divide(SizedBox(height: 8.0)),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                FlutterFlowIconButton(
                                                  borderRadius: 8.0,
                                                  buttonSize: 60.0,
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  icon: Icon(
                                                    Icons.thumb_down_sharp,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .info,
                                                    size: 32.0,
                                                  ),
                                                  onPressed: () {
                                                    print(
                                                        'dislike pressed ...');
                                                  },
                                                ),
                                                FlutterFlowIconButton(
                                                  borderRadius: 8.0,
                                                  buttonSize: 60.0,
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  icon: Icon(
                                                    Icons.favorite,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .info,
                                                    size: 32.0,
                                                  ),
                                                  onPressed: () {
                                                    print('love pressed ...');
                                                  },
                                                ),
                                                FlutterFlowIconButton(
                                                  borderRadius: 8.0,
                                                  buttonSize: 60.0,
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  icon: Icon(
                                                    Icons.add_circle_outline,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .info,
                                                    size: 32.0,
                                                  ),
                                                  onPressed: () {
                                                    print(
                                                        'saveToPlaylist pressed ...');
                                                  },
                                                ),
                                              ],
                                            ),
                                          ].divide(SizedBox(height: 30.0)),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                itemCount: trackItem.length,
                                controller: _model.swipeableStackController,
                                loop: false,
                                cardDisplayCount: 3,
                                scale: 0.9,
                              );
                            },
                          ),
                        ),
                      ),
                      Stack(
                        children: [],
                      ),
                    ].divide(SizedBox(height: 40.0)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
