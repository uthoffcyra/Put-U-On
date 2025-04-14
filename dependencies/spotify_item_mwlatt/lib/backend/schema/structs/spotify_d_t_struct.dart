// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SpotifyDTStruct extends FFFirebaseStruct {
  SpotifyDTStruct({
    String? code,
    String? accessLevel,
    SpotifyAuthStruct? tokens,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _code = code,
        _accessLevel = accessLevel,
        _tokens = tokens,
        super(firestoreUtilData);

  // "code" field.
  String? _code;
  String get code => _code ?? '';
  set code(String? val) => _code = val;

  bool hasCode() => _code != null;

  // "accessLevel" field.
  String? _accessLevel;
  String get accessLevel => _accessLevel ?? '';
  set accessLevel(String? val) => _accessLevel = val;

  bool hasAccessLevel() => _accessLevel != null;

  // "tokens" field.
  SpotifyAuthStruct? _tokens;
  SpotifyAuthStruct get tokens => _tokens ?? SpotifyAuthStruct();
  set tokens(SpotifyAuthStruct? val) => _tokens = val;

  void updateTokens(Function(SpotifyAuthStruct) updateFn) {
    updateFn(_tokens ??= SpotifyAuthStruct());
  }

  bool hasTokens() => _tokens != null;

  static SpotifyDTStruct fromMap(Map<String, dynamic> data) => SpotifyDTStruct(
        code: data['code'] as String?,
        accessLevel: data['accessLevel'] as String?,
        tokens: data['tokens'] is SpotifyAuthStruct
            ? data['tokens']
            : SpotifyAuthStruct.maybeFromMap(data['tokens']),
      );

  static SpotifyDTStruct? maybeFromMap(dynamic data) => data is Map
      ? SpotifyDTStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'code': _code,
        'accessLevel': _accessLevel,
        'tokens': _tokens?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'code': serializeParam(
          _code,
          ParamType.String,
        ),
        'accessLevel': serializeParam(
          _accessLevel,
          ParamType.String,
        ),
        'tokens': serializeParam(
          _tokens,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static SpotifyDTStruct fromSerializableMap(Map<String, dynamic> data) =>
      SpotifyDTStruct(
        code: deserializeParam(
          data['code'],
          ParamType.String,
          false,
        ),
        accessLevel: deserializeParam(
          data['accessLevel'],
          ParamType.String,
          false,
        ),
        tokens: deserializeStructParam(
          data['tokens'],
          ParamType.DataStruct,
          false,
          structBuilder: SpotifyAuthStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'SpotifyDTStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SpotifyDTStruct &&
        code == other.code &&
        accessLevel == other.accessLevel &&
        tokens == other.tokens;
  }

  @override
  int get hashCode => const ListEquality().hash([code, accessLevel, tokens]);
}

SpotifyDTStruct createSpotifyDTStruct({
  String? code,
  String? accessLevel,
  SpotifyAuthStruct? tokens,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SpotifyDTStruct(
      code: code,
      accessLevel: accessLevel,
      tokens: tokens ?? (clearUnsetFields ? SpotifyAuthStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SpotifyDTStruct? updateSpotifyDTStruct(
  SpotifyDTStruct? spotifyDT, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    spotifyDT
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSpotifyDTStructData(
  Map<String, dynamic> firestoreData,
  SpotifyDTStruct? spotifyDT,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (spotifyDT == null) {
    return;
  }
  if (spotifyDT.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && spotifyDT.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final spotifyDTData = getSpotifyDTFirestoreData(spotifyDT, forFieldValue);
  final nestedData = spotifyDTData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = spotifyDT.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSpotifyDTFirestoreData(
  SpotifyDTStruct? spotifyDT, [
  bool forFieldValue = false,
]) {
  if (spotifyDT == null) {
    return {};
  }
  final firestoreData = mapToFirestore(spotifyDT.toMap());

  // Handle nested data for "tokens" field.
  addSpotifyAuthStructData(
    firestoreData,
    spotifyDT.hasTokens() ? spotifyDT.tokens : null,
    'tokens',
    forFieldValue,
  );

  // Add any Firestore field values
  spotifyDT.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSpotifyDTListFirestoreData(
  List<SpotifyDTStruct>? spotifyDTs,
) =>
    spotifyDTs?.map((e) => getSpotifyDTFirestoreData(e, true)).toList() ?? [];
