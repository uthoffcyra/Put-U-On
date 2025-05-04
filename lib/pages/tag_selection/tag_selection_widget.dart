import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'tag_selection_model.dart';
export 'tag_selection_model.dart';

class TagSelectionWidget extends StatefulWidget {
  const TagSelectionWidget({
    super.key,
    this.referral,
  });

  final String? referral;

  static String routeName = 'tagSelection';
  static String routePath = 'tagSelection';

  @override
  State<TagSelectionWidget> createState() => _TagSelectionWidgetState();
}

class _TagSelectionWidgetState extends State<TagSelectionWidget> {
  late TagSelectionModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TagSelectionModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'tagSelection'});
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
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsets.all(24.0),
            child: Container(
              constraints: BoxConstraints(
                maxWidth: 400.0,
              ),
              decoration: BoxDecoration(),
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                    child: Text(
                      'Let\'s choose some music genres...',
                      style:
                          FlutterFlowTheme.of(context).headlineLarge.override(
                                font: GoogleFonts.interTight(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .headlineLarge
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineLarge
                                      .fontStyle,
                                ),
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .headlineLarge
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .headlineLarge
                                    .fontStyle,
                              ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(),
                      child: Builder(
                        builder: (context) {
                          final tagItem = _model.spotifyTags.toList();

                          return SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children:
                                  List.generate(tagItem.length, (tagItemIndex) {
                                final tagItemItem = tagItem[tagItemIndex];
                                return Stack(
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      height: 48.0,
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 16.0,
                                            color: FlutterFlowTheme.of(context)
                                                .accent1,
                                            offset: Offset(
                                              0.0,
                                              0.0,
                                            ),
                                          )
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                    AuthUserStreamWidget(
                                      builder: (context) => Material(
                                        color: Colors.transparent,
                                        child: Theme(
                                          data: ThemeData(
                                            checkboxTheme: CheckboxThemeData(
                                              visualDensity:
                                                  VisualDensity.compact,
                                              materialTapTargetSize:
                                                  MaterialTapTargetSize
                                                      .shrinkWrap,
                                            ),
                                            unselectedWidgetColor:
                                                FlutterFlowTheme.of(context)
                                                    .alternate,
                                          ),
                                          child: CheckboxListTile(
                                            value:
                                                _model.checkboxListTileValueMap[
                                                        tagItemItem] ??=
                                                    (currentUserDocument
                                                                ?.manualTags
                                                                .toList() ??
                                                            [])
                                                        .contains(tagItemItem),
                                            onChanged: (newValue) async {
                                              safeSetState(() => _model
                                                      .checkboxListTileValueMap[
                                                  tagItemItem] = newValue!);
                                            },
                                            title: Text(
                                              tagItemItem,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .titleLarge
                                                  .override(
                                                    font:
                                                        GoogleFonts.interTight(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleLarge
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleLarge
                                                              .fontStyle,
                                                    ),
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleLarge
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleLarge
                                                            .fontStyle,
                                                  ),
                                            ),
                                            tileColor:
                                                FlutterFlowTheme.of(context)
                                                    .accent1,
                                            activeColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            checkColor:
                                                FlutterFlowTheme.of(context)
                                                    .info,
                                            dense: false,
                                            controlAffinity:
                                                ListTileControlAffinity
                                                    .trailing,
                                            contentPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 12.0, 0.0),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }).divide(SizedBox(height: 16.0)),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: Color(0xFFAB51E3),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 7.0,
                              color: Color(0xFFBD7DE6),
                              offset: Offset(
                                0.0,
                                0.0,
                              ),
                              spreadRadius: 0.0,
                            )
                          ],
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      FFButtonWidget(
                        key: ValueKey('Button_o0qr'),
                        onPressed: () async {
                          logFirebaseEvent(
                              'TAG_SELECTION_COMPLETE_SELECTION_BTN_ON_');
                          if (widget.referral == 'sign up') {
                            logFirebaseEvent('Button_backend_call');

                            await currentUserReference!.update({
                              ...mapToFirestore(
                                {
                                  'manual_tags':
                                      _model.checkboxListTileCheckedItems,
                                },
                              ),
                            });
                            logFirebaseEvent('Button_navigate_to');

                            context.goNamed(GoldenPathWidget.routeName);
                          } else {
                            logFirebaseEvent('Button_backend_call');

                            await currentUserReference!.update({
                              ...mapToFirestore(
                                {
                                  'manual_tags':
                                      _model.checkboxListTileCheckedItems,
                                  'dynamic_weights': FieldValue.delete(),
                                },
                              ),
                            });
                            logFirebaseEvent('Button_navigate_to');

                            context.goNamed(UserSettingsWidget.routeName);
                          }
                        },
                        text: widget.referral == 'sign up'
                            ? 'Complete'
                            : 'Update Choices',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 50.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: Color(0xFF8B2FC9),
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    font: GoogleFonts.interTight(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color: Color(0xFFBE39EF),
                            width: 4.0,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ],
                  ),
                ].divide(SizedBox(height: 30.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
