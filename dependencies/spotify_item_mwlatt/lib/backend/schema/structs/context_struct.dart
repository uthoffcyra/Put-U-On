// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ContextStruct extends FFFirebaseStruct {
  ContextStruct({
    String? type,
    String? href,
    ExternalUrlsStruct? externalUrls,
    String? uri,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _type = type,
        _href = href,
        _externalUrls = externalUrls,
        _uri = uri,
        super(firestoreUtilData);

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;

  bool hasType() => _type != null;

  // "href" field.
  String? _href;
  String get href => _href ?? '';
  set href(String? val) => _href = val;

  bool hasHref() => _href != null;

  // "external_urls" field.
  ExternalUrlsStruct? _externalUrls;
  ExternalUrlsStruct get externalUrls => _externalUrls ?? ExternalUrlsStruct();
  set externalUrls(ExternalUrlsStruct? val) => _externalUrls = val;

  void updateExternalUrls(Function(ExternalUrlsStruct) updateFn) {
    updateFn(_externalUrls ??= ExternalUrlsStruct());
  }

  bool hasExternalUrls() => _externalUrls != null;

  // "uri" field.
  String? _uri;
  String get uri => _uri ?? '';
  set uri(String? val) => _uri = val;

  bool hasUri() => _uri != null;

  static ContextStruct fromMap(Map<String, dynamic> data) => ContextStruct(
        type: data['type'] as String?,
        href: data['href'] as String?,
        externalUrls: data['external_urls'] is ExternalUrlsStruct
            ? data['external_urls']
            : ExternalUrlsStruct.maybeFromMap(data['external_urls']),
        uri: data['uri'] as String?,
      );

  static ContextStruct? maybeFromMap(dynamic data) =>
      data is Map ? ContextStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'type': _type,
        'href': _href,
        'external_urls': _externalUrls?.toMap(),
        'uri': _uri,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
        'href': serializeParam(
          _href,
          ParamType.String,
        ),
        'external_urls': serializeParam(
          _externalUrls,
          ParamType.DataStruct,
        ),
        'uri': serializeParam(
          _uri,
          ParamType.String,
        ),
      }.withoutNulls;

  static ContextStruct fromSerializableMap(Map<String, dynamic> data) =>
      ContextStruct(
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
        href: deserializeParam(
          data['href'],
          ParamType.String,
          false,
        ),
        externalUrls: deserializeStructParam(
          data['external_urls'],
          ParamType.DataStruct,
          false,
          structBuilder: ExternalUrlsStruct.fromSerializableMap,
        ),
        uri: deserializeParam(
          data['uri'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ContextStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ContextStruct &&
        type == other.type &&
        href == other.href &&
        externalUrls == other.externalUrls &&
        uri == other.uri;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([type, href, externalUrls, uri]);
}

ContextStruct createContextStruct({
  String? type,
  String? href,
  ExternalUrlsStruct? externalUrls,
  String? uri,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ContextStruct(
      type: type,
      href: href,
      externalUrls:
          externalUrls ?? (clearUnsetFields ? ExternalUrlsStruct() : null),
      uri: uri,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ContextStruct? updateContextStruct(
  ContextStruct? context, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    context
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addContextStructData(
  Map<String, dynamic> firestoreData,
  ContextStruct? context,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (context == null) {
    return;
  }
  if (context.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && context.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final contextData = getContextFirestoreData(context, forFieldValue);
  final nestedData = contextData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = context.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getContextFirestoreData(
  ContextStruct? context, [
  bool forFieldValue = false,
]) {
  if (context == null) {
    return {};
  }
  final firestoreData = mapToFirestore(context.toMap());

  // Handle nested data for "external_urls" field.
  addExternalUrlsStructData(
    firestoreData,
    context.hasExternalUrls() ? context.externalUrls : null,
    'external_urls',
    forFieldValue,
  );

  // Add any Firestore field values
  context.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getContextListFirestoreData(
  List<ContextStruct>? contexts,
) =>
    contexts?.map((e) => getContextFirestoreData(e, true)).toList() ?? [];
