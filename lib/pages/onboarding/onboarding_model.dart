import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'onboarding_widget.dart' show OnboardingWidget;
import 'package:flutter/material.dart';

class OnboardingModel extends FlutterFlowModel<OnboardingWidget> {
  ///  Local state fields for this page.

  DateTime? birthdayInput;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for usernameInput widget.
  FocusNode? usernameInputFocusNode;
  TextEditingController? usernameInputTextController;
  String? Function(BuildContext, String?)? usernameInputTextControllerValidator;
  String? _usernameInputTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Username... is required';
    }

    if (!RegExp(kTextValidatorUsernameRegex).hasMatch(val)) {
      return 'Must start with a letter and can only contain letters, digits and - or _.';
    }
    return null;
  }

  // State field(s) for nameInput widget.
  FocusNode? nameInputFocusNode;
  TextEditingController? nameInputTextController;
  String? Function(BuildContext, String?)? nameInputTextControllerValidator;
  String? _nameInputTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Name... is required';
    }

    if (val.length > 24) {
      return 'Maximum 24 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for locationInput widget.
  FocusNode? locationInputFocusNode;
  TextEditingController? locationInputTextController;
  String? Function(BuildContext, String?)? locationInputTextControllerValidator;
  String? _locationInputTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Location (nearest city)... is required';
    }

    if (val.length > 32) {
      return 'Maximum 32 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  DateTime? datePicked;

  @override
  void initState(BuildContext context) {
    usernameInputTextControllerValidator =
        _usernameInputTextControllerValidator;
    nameInputTextControllerValidator = _nameInputTextControllerValidator;
    locationInputTextControllerValidator =
        _locationInputTextControllerValidator;
  }

  @override
  void dispose() {
    usernameInputFocusNode?.dispose();
    usernameInputTextController?.dispose();

    nameInputFocusNode?.dispose();
    nameInputTextController?.dispose();

    locationInputFocusNode?.dispose();
    locationInputTextController?.dispose();
  }
}
