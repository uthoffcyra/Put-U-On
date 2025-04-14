import '/components/app_bar_title/app_bar_title_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'home_widget.dart' show HomeWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  State fields for stateful widgets in this page.

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
