// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CursorsStruct extends FFFirebaseStruct {
  CursorsStruct({
    String? after,
    String? before,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _after = after,
        _before = before,
        super(firestoreUtilData);

  // "after" field.
  String? _after;
  String get after => _after ?? '';
  set after(String? val) => _after = val;

  bool hasAfter() => _after != null;

  // "before" field.
  String? _before;
  String get before => _before ?? '';
  set before(String? val) => _before = val;

  bool hasBefore() => _before != null;

  static CursorsStruct fromMap(Map<String, dynamic> data) => CursorsStruct(
        after: data['after'] as String?,
        before: data['before'] as String?,
      );

  static CursorsStruct? maybeFromMap(dynamic data) =>
      data is Map ? CursorsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'after': _after,
        'before': _before,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'after': serializeParam(
          _after,
          ParamType.String,
        ),
        'before': serializeParam(
          _before,
          ParamType.String,
        ),
      }.withoutNulls;

  static CursorsStruct fromSerializableMap(Map<String, dynamic> data) =>
      CursorsStruct(
        after: deserializeParam(
          data['after'],
          ParamType.String,
          false,
        ),
        before: deserializeParam(
          data['before'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CursorsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CursorsStruct &&
        after == other.after &&
        before == other.before;
  }

  @override
  int get hashCode => const ListEquality().hash([after, before]);
}

CursorsStruct createCursorsStruct({
  String? after,
  String? before,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CursorsStruct(
      after: after,
      before: before,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CursorsStruct? updateCursorsStruct(
  CursorsStruct? cursors, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    cursors
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCursorsStructData(
  Map<String, dynamic> firestoreData,
  CursorsStruct? cursors,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (cursors == null) {
    return;
  }
  if (cursors.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && cursors.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final cursorsData = getCursorsFirestoreData(cursors, forFieldValue);
  final nestedData = cursorsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = cursors.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCursorsFirestoreData(
  CursorsStruct? cursors, [
  bool forFieldValue = false,
]) {
  if (cursors == null) {
    return {};
  }
  final firestoreData = mapToFirestore(cursors.toMap());

  // Add any Firestore field values
  cursors.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCursorsListFirestoreData(
  List<CursorsStruct>? cursorss,
) =>
    cursorss?.map((e) => getCursorsFirestoreData(e, true)).toList() ?? [];
