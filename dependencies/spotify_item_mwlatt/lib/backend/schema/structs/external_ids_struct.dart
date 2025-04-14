// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ExternalIdsStruct extends FFFirebaseStruct {
  ExternalIdsStruct({
    String? isrc,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _isrc = isrc,
        super(firestoreUtilData);

  // "isrc" field.
  String? _isrc;
  String get isrc => _isrc ?? '';
  set isrc(String? val) => _isrc = val;

  bool hasIsrc() => _isrc != null;

  static ExternalIdsStruct fromMap(Map<String, dynamic> data) =>
      ExternalIdsStruct(
        isrc: data['isrc'] as String?,
      );

  static ExternalIdsStruct? maybeFromMap(dynamic data) => data is Map
      ? ExternalIdsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'isrc': _isrc,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'isrc': serializeParam(
          _isrc,
          ParamType.String,
        ),
      }.withoutNulls;

  static ExternalIdsStruct fromSerializableMap(Map<String, dynamic> data) =>
      ExternalIdsStruct(
        isrc: deserializeParam(
          data['isrc'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ExternalIdsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ExternalIdsStruct && isrc == other.isrc;
  }

  @override
  int get hashCode => const ListEquality().hash([isrc]);
}

ExternalIdsStruct createExternalIdsStruct({
  String? isrc,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ExternalIdsStruct(
      isrc: isrc,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ExternalIdsStruct? updateExternalIdsStruct(
  ExternalIdsStruct? externalIds, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    externalIds
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addExternalIdsStructData(
  Map<String, dynamic> firestoreData,
  ExternalIdsStruct? externalIds,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (externalIds == null) {
    return;
  }
  if (externalIds.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && externalIds.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final externalIdsData =
      getExternalIdsFirestoreData(externalIds, forFieldValue);
  final nestedData =
      externalIdsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = externalIds.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getExternalIdsFirestoreData(
  ExternalIdsStruct? externalIds, [
  bool forFieldValue = false,
]) {
  if (externalIds == null) {
    return {};
  }
  final firestoreData = mapToFirestore(externalIds.toMap());

  // Add any Firestore field values
  externalIds.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getExternalIdsListFirestoreData(
  List<ExternalIdsStruct>? externalIdss,
) =>
    externalIdss?.map((e) => getExternalIdsFirestoreData(e, true)).toList() ??
    [];
