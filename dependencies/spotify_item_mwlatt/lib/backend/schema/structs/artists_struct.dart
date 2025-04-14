// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ArtistsStruct extends FFFirebaseStruct {
  ArtistsStruct({
    ExternalUrlsStruct? externalUrls,
    String? href,
    String? id,
    String? name,
    String? type,
    String? uri,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _externalUrls = externalUrls,
        _href = href,
        _id = id,
        _name = name,
        _type = type,
        _uri = uri,
        super(firestoreUtilData);

  // "external_urls" field.
  ExternalUrlsStruct? _externalUrls;
  ExternalUrlsStruct get externalUrls => _externalUrls ?? ExternalUrlsStruct();
  set externalUrls(ExternalUrlsStruct? val) => _externalUrls = val;

  void updateExternalUrls(Function(ExternalUrlsStruct) updateFn) {
    updateFn(_externalUrls ??= ExternalUrlsStruct());
  }

  bool hasExternalUrls() => _externalUrls != null;

  // "href" field.
  String? _href;
  String get href => _href ?? '';
  set href(String? val) => _href = val;

  bool hasHref() => _href != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;

  bool hasType() => _type != null;

  // "uri" field.
  String? _uri;
  String get uri => _uri ?? '';
  set uri(String? val) => _uri = val;

  bool hasUri() => _uri != null;

  static ArtistsStruct fromMap(Map<String, dynamic> data) => ArtistsStruct(
        externalUrls: data['external_urls'] is ExternalUrlsStruct
            ? data['external_urls']
            : ExternalUrlsStruct.maybeFromMap(data['external_urls']),
        href: data['href'] as String?,
        id: data['id'] as String?,
        name: data['name'] as String?,
        type: data['type'] as String?,
        uri: data['uri'] as String?,
      );

  static ArtistsStruct? maybeFromMap(dynamic data) =>
      data is Map ? ArtistsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'external_urls': _externalUrls?.toMap(),
        'href': _href,
        'id': _id,
        'name': _name,
        'type': _type,
        'uri': _uri,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'external_urls': serializeParam(
          _externalUrls,
          ParamType.DataStruct,
        ),
        'href': serializeParam(
          _href,
          ParamType.String,
        ),
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
        'uri': serializeParam(
          _uri,
          ParamType.String,
        ),
      }.withoutNulls;

  static ArtistsStruct fromSerializableMap(Map<String, dynamic> data) =>
      ArtistsStruct(
        externalUrls: deserializeStructParam(
          data['external_urls'],
          ParamType.DataStruct,
          false,
          structBuilder: ExternalUrlsStruct.fromSerializableMap,
        ),
        href: deserializeParam(
          data['href'],
          ParamType.String,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
        uri: deserializeParam(
          data['uri'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ArtistsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ArtistsStruct &&
        externalUrls == other.externalUrls &&
        href == other.href &&
        id == other.id &&
        name == other.name &&
        type == other.type &&
        uri == other.uri;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([externalUrls, href, id, name, type, uri]);
}

ArtistsStruct createArtistsStruct({
  ExternalUrlsStruct? externalUrls,
  String? href,
  String? id,
  String? name,
  String? type,
  String? uri,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ArtistsStruct(
      externalUrls:
          externalUrls ?? (clearUnsetFields ? ExternalUrlsStruct() : null),
      href: href,
      id: id,
      name: name,
      type: type,
      uri: uri,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ArtistsStruct? updateArtistsStruct(
  ArtistsStruct? artists, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    artists
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addArtistsStructData(
  Map<String, dynamic> firestoreData,
  ArtistsStruct? artists,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (artists == null) {
    return;
  }
  if (artists.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && artists.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final artistsData = getArtistsFirestoreData(artists, forFieldValue);
  final nestedData = artistsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = artists.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getArtistsFirestoreData(
  ArtistsStruct? artists, [
  bool forFieldValue = false,
]) {
  if (artists == null) {
    return {};
  }
  final firestoreData = mapToFirestore(artists.toMap());

  // Handle nested data for "external_urls" field.
  addExternalUrlsStructData(
    firestoreData,
    artists.hasExternalUrls() ? artists.externalUrls : null,
    'external_urls',
    forFieldValue,
  );

  // Add any Firestore field values
  artists.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getArtistsListFirestoreData(
  List<ArtistsStruct>? artistss,
) =>
    artistss?.map((e) => getArtistsFirestoreData(e, true)).toList() ?? [];
