// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SpotifyAuthStruct extends FFFirebaseStruct {
  SpotifyAuthStruct({
    String? accessToken,
    String? tokenType,
    int? expiresIn,
    String? refreshToken,
    String? scope,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _accessToken = accessToken,
        _tokenType = tokenType,
        _expiresIn = expiresIn,
        _refreshToken = refreshToken,
        _scope = scope,
        super(firestoreUtilData);

  // "access_token" field.
  String? _accessToken;
  String get accessToken => _accessToken ?? '';
  set accessToken(String? val) => _accessToken = val;

  bool hasAccessToken() => _accessToken != null;

  // "token_type" field.
  String? _tokenType;
  String get tokenType => _tokenType ?? '';
  set tokenType(String? val) => _tokenType = val;

  bool hasTokenType() => _tokenType != null;

  // "expires_in" field.
  int? _expiresIn;
  int get expiresIn => _expiresIn ?? 0;
  set expiresIn(int? val) => _expiresIn = val;

  void incrementExpiresIn(int amount) => expiresIn = expiresIn + amount;

  bool hasExpiresIn() => _expiresIn != null;

  // "refresh_token" field.
  String? _refreshToken;
  String get refreshToken => _refreshToken ?? '';
  set refreshToken(String? val) => _refreshToken = val;

  bool hasRefreshToken() => _refreshToken != null;

  // "scope" field.
  String? _scope;
  String get scope => _scope ?? '';
  set scope(String? val) => _scope = val;

  bool hasScope() => _scope != null;

  static SpotifyAuthStruct fromMap(Map<String, dynamic> data) =>
      SpotifyAuthStruct(
        accessToken: data['access_token'] as String?,
        tokenType: data['token_type'] as String?,
        expiresIn: castToType<int>(data['expires_in']),
        refreshToken: data['refresh_token'] as String?,
        scope: data['scope'] as String?,
      );

  static SpotifyAuthStruct? maybeFromMap(dynamic data) => data is Map
      ? SpotifyAuthStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'access_token': _accessToken,
        'token_type': _tokenType,
        'expires_in': _expiresIn,
        'refresh_token': _refreshToken,
        'scope': _scope,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'access_token': serializeParam(
          _accessToken,
          ParamType.String,
        ),
        'token_type': serializeParam(
          _tokenType,
          ParamType.String,
        ),
        'expires_in': serializeParam(
          _expiresIn,
          ParamType.int,
        ),
        'refresh_token': serializeParam(
          _refreshToken,
          ParamType.String,
        ),
        'scope': serializeParam(
          _scope,
          ParamType.String,
        ),
      }.withoutNulls;

  static SpotifyAuthStruct fromSerializableMap(Map<String, dynamic> data) =>
      SpotifyAuthStruct(
        accessToken: deserializeParam(
          data['access_token'],
          ParamType.String,
          false,
        ),
        tokenType: deserializeParam(
          data['token_type'],
          ParamType.String,
          false,
        ),
        expiresIn: deserializeParam(
          data['expires_in'],
          ParamType.int,
          false,
        ),
        refreshToken: deserializeParam(
          data['refresh_token'],
          ParamType.String,
          false,
        ),
        scope: deserializeParam(
          data['scope'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'SpotifyAuthStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SpotifyAuthStruct &&
        accessToken == other.accessToken &&
        tokenType == other.tokenType &&
        expiresIn == other.expiresIn &&
        refreshToken == other.refreshToken &&
        scope == other.scope;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([accessToken, tokenType, expiresIn, refreshToken, scope]);
}

SpotifyAuthStruct createSpotifyAuthStruct({
  String? accessToken,
  String? tokenType,
  int? expiresIn,
  String? refreshToken,
  String? scope,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SpotifyAuthStruct(
      accessToken: accessToken,
      tokenType: tokenType,
      expiresIn: expiresIn,
      refreshToken: refreshToken,
      scope: scope,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SpotifyAuthStruct? updateSpotifyAuthStruct(
  SpotifyAuthStruct? spotifyAuth, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    spotifyAuth
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSpotifyAuthStructData(
  Map<String, dynamic> firestoreData,
  SpotifyAuthStruct? spotifyAuth,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (spotifyAuth == null) {
    return;
  }
  if (spotifyAuth.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && spotifyAuth.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final spotifyAuthData =
      getSpotifyAuthFirestoreData(spotifyAuth, forFieldValue);
  final nestedData =
      spotifyAuthData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = spotifyAuth.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSpotifyAuthFirestoreData(
  SpotifyAuthStruct? spotifyAuth, [
  bool forFieldValue = false,
]) {
  if (spotifyAuth == null) {
    return {};
  }
  final firestoreData = mapToFirestore(spotifyAuth.toMap());

  // Add any Firestore field values
  spotifyAuth.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSpotifyAuthListFirestoreData(
  List<SpotifyAuthStruct>? spotifyAuths,
) =>
    spotifyAuths?.map((e) => getSpotifyAuthFirestoreData(e, true)).toList() ??
    [];
