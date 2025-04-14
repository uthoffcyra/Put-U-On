// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SpotifySongsStruct extends FFFirebaseStruct {
  SpotifySongsStruct({
    List<ItemsStruct>? items,
    String? next,
    CursorsStruct? cursors,
    int? limit,
    String? href,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _items = items,
        _next = next,
        _cursors = cursors,
        _limit = limit,
        _href = href,
        super(firestoreUtilData);

  // "items" field.
  List<ItemsStruct>? _items;
  List<ItemsStruct> get items => _items ?? const [];
  set items(List<ItemsStruct>? val) => _items = val;

  void updateItems(Function(List<ItemsStruct>) updateFn) {
    updateFn(_items ??= []);
  }

  bool hasItems() => _items != null;

  // "next" field.
  String? _next;
  String get next => _next ?? '';
  set next(String? val) => _next = val;

  bool hasNext() => _next != null;

  // "cursors" field.
  CursorsStruct? _cursors;
  CursorsStruct get cursors => _cursors ?? CursorsStruct();
  set cursors(CursorsStruct? val) => _cursors = val;

  void updateCursors(Function(CursorsStruct) updateFn) {
    updateFn(_cursors ??= CursorsStruct());
  }

  bool hasCursors() => _cursors != null;

  // "limit" field.
  int? _limit;
  int get limit => _limit ?? 0;
  set limit(int? val) => _limit = val;

  void incrementLimit(int amount) => limit = limit + amount;

  bool hasLimit() => _limit != null;

  // "href" field.
  String? _href;
  String get href => _href ?? '';
  set href(String? val) => _href = val;

  bool hasHref() => _href != null;

  static SpotifySongsStruct fromMap(Map<String, dynamic> data) =>
      SpotifySongsStruct(
        items: getStructList(
          data['items'],
          ItemsStruct.fromMap,
        ),
        next: data['next'] as String?,
        cursors: data['cursors'] is CursorsStruct
            ? data['cursors']
            : CursorsStruct.maybeFromMap(data['cursors']),
        limit: castToType<int>(data['limit']),
        href: data['href'] as String?,
      );

  static SpotifySongsStruct? maybeFromMap(dynamic data) => data is Map
      ? SpotifySongsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'items': _items?.map((e) => e.toMap()).toList(),
        'next': _next,
        'cursors': _cursors?.toMap(),
        'limit': _limit,
        'href': _href,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'items': serializeParam(
          _items,
          ParamType.DataStruct,
          isList: true,
        ),
        'next': serializeParam(
          _next,
          ParamType.String,
        ),
        'cursors': serializeParam(
          _cursors,
          ParamType.DataStruct,
        ),
        'limit': serializeParam(
          _limit,
          ParamType.int,
        ),
        'href': serializeParam(
          _href,
          ParamType.String,
        ),
      }.withoutNulls;

  static SpotifySongsStruct fromSerializableMap(Map<String, dynamic> data) =>
      SpotifySongsStruct(
        items: deserializeStructParam<ItemsStruct>(
          data['items'],
          ParamType.DataStruct,
          true,
          structBuilder: ItemsStruct.fromSerializableMap,
        ),
        next: deserializeParam(
          data['next'],
          ParamType.String,
          false,
        ),
        cursors: deserializeStructParam(
          data['cursors'],
          ParamType.DataStruct,
          false,
          structBuilder: CursorsStruct.fromSerializableMap,
        ),
        limit: deserializeParam(
          data['limit'],
          ParamType.int,
          false,
        ),
        href: deserializeParam(
          data['href'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'SpotifySongsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is SpotifySongsStruct &&
        listEquality.equals(items, other.items) &&
        next == other.next &&
        cursors == other.cursors &&
        limit == other.limit &&
        href == other.href;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([items, next, cursors, limit, href]);
}

SpotifySongsStruct createSpotifySongsStruct({
  String? next,
  CursorsStruct? cursors,
  int? limit,
  String? href,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SpotifySongsStruct(
      next: next,
      cursors: cursors ?? (clearUnsetFields ? CursorsStruct() : null),
      limit: limit,
      href: href,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SpotifySongsStruct? updateSpotifySongsStruct(
  SpotifySongsStruct? spotifySongs, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    spotifySongs
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSpotifySongsStructData(
  Map<String, dynamic> firestoreData,
  SpotifySongsStruct? spotifySongs,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (spotifySongs == null) {
    return;
  }
  if (spotifySongs.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && spotifySongs.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final spotifySongsData =
      getSpotifySongsFirestoreData(spotifySongs, forFieldValue);
  final nestedData =
      spotifySongsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = spotifySongs.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSpotifySongsFirestoreData(
  SpotifySongsStruct? spotifySongs, [
  bool forFieldValue = false,
]) {
  if (spotifySongs == null) {
    return {};
  }
  final firestoreData = mapToFirestore(spotifySongs.toMap());

  // Handle nested data for "cursors" field.
  addCursorsStructData(
    firestoreData,
    spotifySongs.hasCursors() ? spotifySongs.cursors : null,
    'cursors',
    forFieldValue,
  );

  // Add any Firestore field values
  spotifySongs.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSpotifySongsListFirestoreData(
  List<SpotifySongsStruct>? spotifySongss,
) =>
    spotifySongss?.map((e) => getSpotifySongsFirestoreData(e, true)).toList() ??
    [];
