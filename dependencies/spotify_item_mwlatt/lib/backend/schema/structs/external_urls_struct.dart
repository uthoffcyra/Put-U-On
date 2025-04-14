// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ExternalUrlsStruct extends FFFirebaseStruct {
  ExternalUrlsStruct({
    String? spotify,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _spotify = spotify,
        super(firestoreUtilData);

  // "spotify" field.
  String? _spotify;
  String get spotify => _spotify ?? '';
  set spotify(String? val) => _spotify = val;

  bool hasSpotify() => _spotify != null;

  static ExternalUrlsStruct fromMap(Map<String, dynamic> data) =>
      ExternalUrlsStruct(
        spotify: data['spotify'] as String?,
      );

  static ExternalUrlsStruct? maybeFromMap(dynamic data) => data is Map
      ? ExternalUrlsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'spotify': _spotify,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'spotify': serializeParam(
          _spotify,
          ParamType.String,
        ),
      }.withoutNulls;

  static ExternalUrlsStruct fromSerializableMap(Map<String, dynamic> data) =>
      ExternalUrlsStruct(
        spotify: deserializeParam(
          data['spotify'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ExternalUrlsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ExternalUrlsStruct && spotify == other.spotify;
  }

  @override
  int get hashCode => const ListEquality().hash([spotify]);
}

ExternalUrlsStruct createExternalUrlsStruct({
  String? spotify,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ExternalUrlsStruct(
      spotify: spotify,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ExternalUrlsStruct? updateExternalUrlsStruct(
  ExternalUrlsStruct? externalUrls, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    externalUrls
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addExternalUrlsStructData(
  Map<String, dynamic> firestoreData,
  ExternalUrlsStruct? externalUrls,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (externalUrls == null) {
    return;
  }
  if (externalUrls.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && externalUrls.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final externalUrlsData =
      getExternalUrlsFirestoreData(externalUrls, forFieldValue);
  final nestedData =
      externalUrlsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = externalUrls.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getExternalUrlsFirestoreData(
  ExternalUrlsStruct? externalUrls, [
  bool forFieldValue = false,
]) {
  if (externalUrls == null) {
    return {};
  }
  final firestoreData = mapToFirestore(externalUrls.toMap());

  // Add any Firestore field values
  externalUrls.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getExternalUrlsListFirestoreData(
  List<ExternalUrlsStruct>? externalUrlss,
) =>
    externalUrlss?.map((e) => getExternalUrlsFirestoreData(e, true)).toList() ??
    [];
