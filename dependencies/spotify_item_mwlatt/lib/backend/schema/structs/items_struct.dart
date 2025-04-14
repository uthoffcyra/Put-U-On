// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ItemsStruct extends FFFirebaseStruct {
  ItemsStruct({
    TrackStruct? track,
    String? playedAt,
    ContextStruct? context,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _track = track,
        _playedAt = playedAt,
        _context = context,
        super(firestoreUtilData);

  // "track" field.
  TrackStruct? _track;
  TrackStruct get track => _track ?? TrackStruct();
  set track(TrackStruct? val) => _track = val;

  void updateTrack(Function(TrackStruct) updateFn) {
    updateFn(_track ??= TrackStruct());
  }

  bool hasTrack() => _track != null;

  // "played_at" field.
  String? _playedAt;
  String get playedAt => _playedAt ?? '';
  set playedAt(String? val) => _playedAt = val;

  bool hasPlayedAt() => _playedAt != null;

  // "context" field.
  ContextStruct? _context;
  ContextStruct get context => _context ?? ContextStruct();
  set context(ContextStruct? val) => _context = val;

  void updateContext(Function(ContextStruct) updateFn) {
    updateFn(_context ??= ContextStruct());
  }

  bool hasContext() => _context != null;

  static ItemsStruct fromMap(Map<String, dynamic> data) => ItemsStruct(
        track: data['track'] is TrackStruct
            ? data['track']
            : TrackStruct.maybeFromMap(data['track']),
        playedAt: data['played_at'] as String?,
        context: data['context'] is ContextStruct
            ? data['context']
            : ContextStruct.maybeFromMap(data['context']),
      );

  static ItemsStruct? maybeFromMap(dynamic data) =>
      data is Map ? ItemsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'track': _track?.toMap(),
        'played_at': _playedAt,
        'context': _context?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'track': serializeParam(
          _track,
          ParamType.DataStruct,
        ),
        'played_at': serializeParam(
          _playedAt,
          ParamType.String,
        ),
        'context': serializeParam(
          _context,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static ItemsStruct fromSerializableMap(Map<String, dynamic> data) =>
      ItemsStruct(
        track: deserializeStructParam(
          data['track'],
          ParamType.DataStruct,
          false,
          structBuilder: TrackStruct.fromSerializableMap,
        ),
        playedAt: deserializeParam(
          data['played_at'],
          ParamType.String,
          false,
        ),
        context: deserializeStructParam(
          data['context'],
          ParamType.DataStruct,
          false,
          structBuilder: ContextStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'ItemsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ItemsStruct &&
        track == other.track &&
        playedAt == other.playedAt &&
        context == other.context;
  }

  @override
  int get hashCode => const ListEquality().hash([track, playedAt, context]);
}

ItemsStruct createItemsStruct({
  TrackStruct? track,
  String? playedAt,
  ContextStruct? context,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ItemsStruct(
      track: track ?? (clearUnsetFields ? TrackStruct() : null),
      playedAt: playedAt,
      context: context ?? (clearUnsetFields ? ContextStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ItemsStruct? updateItemsStruct(
  ItemsStruct? items, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    items
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addItemsStructData(
  Map<String, dynamic> firestoreData,
  ItemsStruct? items,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (items == null) {
    return;
  }
  if (items.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && items.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final itemsData = getItemsFirestoreData(items, forFieldValue);
  final nestedData = itemsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = items.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getItemsFirestoreData(
  ItemsStruct? items, [
  bool forFieldValue = false,
]) {
  if (items == null) {
    return {};
  }
  final firestoreData = mapToFirestore(items.toMap());

  // Handle nested data for "track" field.
  addTrackStructData(
    firestoreData,
    items.hasTrack() ? items.track : null,
    'track',
    forFieldValue,
  );

  // Handle nested data for "context" field.
  addContextStructData(
    firestoreData,
    items.hasContext() ? items.context : null,
    'context',
    forFieldValue,
  );

  // Add any Firestore field values
  items.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getItemsListFirestoreData(
  List<ItemsStruct>? itemss,
) =>
    itemss?.map((e) => getItemsFirestoreData(e, true)).toList() ?? [];
