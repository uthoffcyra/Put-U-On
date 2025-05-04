import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'login_sign_up_widget.dart' show LoginSignUpWidget;
import 'package:flutter/material.dart';

class LoginSignUpModel extends FlutterFlowModel<LoginSignUpWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // State field(s) for SignUpEmailField widget.
  FocusNode? signUpEmailFieldFocusNode;
  TextEditingController? signUpEmailFieldTextController;
  String? Function(BuildContext, String?)?
      signUpEmailFieldTextControllerValidator;
  // State field(s) for SignUpPasswordField widget.
  FocusNode? signUpPasswordFieldFocusNode;
  TextEditingController? signUpPasswordFieldTextController;
  late bool signUpPasswordFieldVisibility;
  String? Function(BuildContext, String?)?
      signUpPasswordFieldTextControllerValidator;
  // State field(s) for SignUpConfirmField widget.
  FocusNode? signUpConfirmFieldFocusNode;
  TextEditingController? signUpConfirmFieldTextController;
  late bool signUpConfirmFieldVisibility;
  String? Function(BuildContext, String?)?
      signUpConfirmFieldTextControllerValidator;
  // State field(s) for LoginEmailField widget.
  FocusNode? loginEmailFieldFocusNode;
  TextEditingController? loginEmailFieldTextController;
  String? Function(BuildContext, String?)?
      loginEmailFieldTextControllerValidator;
  // State field(s) for LoginPasswordField widget.
  FocusNode? loginPasswordFieldFocusNode;
  TextEditingController? loginPasswordFieldTextController;
  late bool loginPasswordFieldVisibility;
  String? Function(BuildContext, String?)?
      loginPasswordFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {
    signUpPasswordFieldVisibility = false;
    signUpConfirmFieldVisibility = false;
    loginPasswordFieldVisibility = false;
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    signUpEmailFieldFocusNode?.dispose();
    signUpEmailFieldTextController?.dispose();

    signUpPasswordFieldFocusNode?.dispose();
    signUpPasswordFieldTextController?.dispose();

    signUpConfirmFieldFocusNode?.dispose();
    signUpConfirmFieldTextController?.dispose();

    loginEmailFieldFocusNode?.dispose();
    loginEmailFieldTextController?.dispose();

    loginPasswordFieldFocusNode?.dispose();
    loginPasswordFieldTextController?.dispose();
  }
}
