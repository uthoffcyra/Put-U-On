import '/auth/firebase_auth/auth_util.dart';
import '/backend/ai_agents/ai_agent.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:async';
import '/flutter_flow/custom_functions.dart' as functions;
import 'golden_path_widget.dart' show GoldenPathWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:google_fonts/google_fonts.dart';

class GoldenPathModel extends FlutterFlowModel<GoldenPathWidget> {
  ///  Local state fields for this page.
  /// The songs displayed for the current session.
  List<dynamic> recommendations = [];
  void addToRecommendations(dynamic item) => recommendations.add(item);
  void removeFromRecommendations(dynamic item) => recommendations.remove(item);
  void removeAtIndexFromRecommendations(int index) =>
      recommendations.removeAt(index);
  void insertAtIndexInRecommendations(int index, dynamic item) =>
      recommendations.insert(index, item);
  void updateRecommendationsAtIndex(int index, Function(dynamic) updateFn) =>
      recommendations[index] = updateFn(recommendations[index]);

  /// Used for preparing to show the NPS score input.
  int sessionSwipes = 0;

  /// Used for testing purposes.
  String? aiResponseValidator;

  /// Used for the color changing gradient.
  String? lastSwipeDirection;

  /// Whether the video on the current card should be shown rather than the
  /// album art.
  bool showVideo = false;

  /// The genre used for generating the current session.
  String? sessionGenre;

  ///  State fields for stateful widgets in this page.

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for SwipeableStack widget.
  late CardSwiperController swipeableStackController;
  // Stores action output result for [Backend Call - API (youtubeApi)] action in PlayButton widget.
  ApiCallResponse? youtubeButton;

  @override
  void initState(BuildContext context) {
    swipeableStackController = CardSwiperController();
  }

  @override
  void dispose() {}

  /// Action blocks.
  Future refreshRecommended(BuildContext context) async {
    ApiCallResponse? apiResult8nx;
    ApiCallResponse? apiResultjlw;
    Map<String, dynamic>? weatherRec;
    ApiCallResponse? apiResultmgv;

    if ((valueOrDefault(currentUserDocument?.dynamicWeights, '') == '') ||
        (valueOrDefault(currentUserDocument?.dynamicWeights, '') == '{}')) {
      // Initialize Weight Map.
      logFirebaseEvent('refreshRecommended_InitializeWeightMap');

      await currentUserReference!.update(createUsersRecordData(
        dynamicWeights: functions.incrementGenreWeights(
            '{}', (currentUserDocument?.manualTags.toList() ?? []).toList()),
      ));
    }
    // Generate from Manual Tags.
    logFirebaseEvent('refreshRecommended_GeneratefromManualTag');
    sessionGenre = functions.randomGenre(
        (currentUserDocument?.manualTags.toList() ?? []).toList());
    if (dropDownValue == 'Standard') {
      // Call Cloud Function.
      logFirebaseEvent('refreshRecommended_CallCloudFunction');
      apiResult8nx = await GetRecommendationsCall.call(
        genre: sessionGenre,
      );

      if ((apiResult8nx.succeeded ?? true)) {
        // Set recommendations list.
        logFirebaseEvent('refreshRecommended_Setrecommendationslis');
        recommendations = getJsonField(
          (apiResult8nx.jsonBody ?? ''),
          r'''$.recommendations''',
          true,
        )!
            .toList()
            .cast<dynamic>();
        if (!(recommendations.isNotEmpty)) {
          // Loops.
          logFirebaseEvent('refreshRecommended_Loops');
          await refreshRecommended(context);
        }
      } else {
        // Show error.
        logFirebaseEvent('refreshRecommended_Showerror');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Error completing this request.',
              style: FlutterFlowTheme.of(context).labelMedium.override(
                    font: GoogleFonts.inter(
                      fontWeight:
                          FlutterFlowTheme.of(context).labelMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).labelMedium.fontStyle,
                    ),
                    color: FlutterFlowTheme.of(context).primaryText,
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).labelMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).labelMedium.fontStyle,
                  ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).error,
          ),
        );
      }
    } else {
      logFirebaseEvent('refreshRecommended_backend_call');
      apiResultjlw = await GetWeatherCall.call();

      if ((apiResultjlw.succeeded ?? true)) {
        logFirebaseEvent('refreshRecommended_a_i_agent');
        await callAiAgent(
          context: context,
          prompt: 'Weather: ${getJsonField(
            (apiResultjlw.jsonBody ?? ''),
            r'''$.weather[:].description''',
          ).toString().toString()}, Genre:${sessionGenre}',
          threadId: currentUserEmail,
          agentCloudFunctionName: 'weatherAgentPreAPI',
          provider: 'GOOGLE',
          agentJson:
              "{\"status\":\"LIVE\",\"identifier\":{\"name\":\"weatherAgentPreAPI\",\"key\":\"6upy0\"},\"name\":\"WeatherAgent Pre API\",\"description\":\"Using a cloud function in firebase, and the user's current location value, the agent fetches songs with genres related to the current weather\",\"aiModel\":{\"provider\":\"GOOGLE\",\"model\":\"gemini-2.0-flash\",\"parameters\":{\"temperature\":{\"inputValue\":1},\"maxTokens\":{\"inputValue\":8192},\"topP\":{\"inputValue\":0.95}},\"messages\":[{\"role\":\"SYSTEM\",\"text\":\"Using a cloud function in firebase that fetches song recommendations for users, and the weather api response based on the user's current location value, fetch 10 songs with genres most related to the current weather, and returns jsons for the songs. The cloud function will return a json with extra data for each song, but I just would like the title and artist data. An example json for three songs will follow the format below. However, I would like to return 10 songs. Please follow the following format exactly:\\n\\n{\\\"queries\\\": [{\\\"title\\\":\\\"Shape of You\\\",\\\"artist\\\":\\\"Ed Sheeran\\\"},{\\\"title\\\":\\\"Blinding Lights\\\",\\\"artist\\\":\\\"The Weeknd\\\"},{\\\"title\\\":\\\"Rolling in the Deep\\\",\\\"artist\\\":\\\"Adele\\\"}]}\"}]},\"requestOptions\":{\"requestTypes\":[\"PLAINTEXT\"]},\"responseOptions\":{\"responseType\":\"JSON\"}}",
          responseType: 'JSON',
        ).then((generatedText) {
          weatherRec = generatedText;
        });

        logFirebaseEvent('refreshRecommended_update_page_state');
        aiResponseValidator = weatherRec?.toString();
        logFirebaseEvent('refreshRecommended_backend_call');
        apiResultmgv = await GetSongMetadataCall.call(
          queriesJson: getJsonField(
            weatherRec,
            r'''$.queries''',
            true,
          ),
        );

        if ((apiResultmgv.succeeded ?? true)) {
          logFirebaseEvent('refreshRecommended_update_page_state');
          recommendations = getJsonField(
            (apiResultmgv.jsonBody ?? ''),
            r'''$.recommendations''',
            true,
          )!
              .toList()
              .cast<dynamic>();
        }
      } else {
        logFirebaseEvent('refreshRecommended_show_snack_bar');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Error completing this request.',
              style: FlutterFlowTheme.of(context).labelMedium.override(
                    font: GoogleFonts.inter(
                      fontWeight:
                          FlutterFlowTheme.of(context).labelMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).labelMedium.fontStyle,
                    ),
                    color: FlutterFlowTheme.of(context).primaryText,
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).labelMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).labelMedium.fontStyle,
                  ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).error,
          ),
        );
      }
    }
  }

  Future dumpRecommended(BuildContext context) async {
    logFirebaseEvent('dumpRecommended_update_page_state');
    recommendations = [];
    sessionSwipes = 0;
  }

  Future gradientRefresh(BuildContext context) async {
    logFirebaseEvent('gradientRefresh_wait__delay');
    await Future.delayed(const Duration(milliseconds: 2000));
    logFirebaseEvent('gradientRefresh_update_page_state');
    lastSwipeDirection = null;
  }

  Future incrementGenreWeights(
    BuildContext context, {
    required List<String>? likedTags,
  }) async {
    // Increment Weight Map.
    logFirebaseEvent('incrementGenreWeights_IncrementWeightMap');

    await currentUserReference!.update(createUsersRecordData(
      dynamicWeights: functions.incrementGenreWeights(
          valueOrDefault(currentUserDocument?.dynamicWeights, ''),
          likedTags?.toList()),
    ));
  }
}
