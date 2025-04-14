import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'golden_path_widget.dart' show GoldenPathWidget;
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class GoldenPathModel extends FlutterFlowModel<GoldenPathWidget> {
  ///  Local state fields for this page.

  List<dynamic> recommendations = [];
  void addToRecommendations(dynamic item) => recommendations.add(item);
  void removeFromRecommendations(dynamic item) => recommendations.remove(item);
  void removeAtIndexFromRecommendations(int index) =>
      recommendations.removeAt(index);
  void insertAtIndexInRecommendations(int index, dynamic item) =>
      recommendations.insert(index, item);
  void updateRecommendationsAtIndex(int index, Function(dynamic) updateFn) =>
      recommendations[index] = updateFn(recommendations[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (getRecommendations)] action in goldenPath widget.
  ApiCallResponse? apiResult5dd;
  // State field(s) for SwipeableStack widget.
  late CardSwiperController swipeableStackController;

  @override
  void initState(BuildContext context) {
    swipeableStackController = CardSwiperController();
  }

  @override
  void dispose() {}
}
