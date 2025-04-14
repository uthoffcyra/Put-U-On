// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TrackStruct extends FFFirebaseStruct {
  TrackStruct({
    AlbumStruct? album,
    List<ArtistsStruct>? artists,
    List<String>? availableMarkets,
    int? discNumber,
    int? durationMs,
    bool? explicit,
    ExternalIdsStruct? externalIds,
    ExternalUrlsStruct? externalUrls,
    String? href,
    String? id,
    bool? isLocal,
    String? name,
    int? popularity,
    String? previewUrl,
    int? trackNumber,
    String? type,
    String? uri,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _album = album,
        _artists = artists,
        _availableMarkets = availableMarkets,
        _discNumber = discNumber,
        _durationMs = durationMs,
        _explicit = explicit,
        _externalIds = externalIds,
        _externalUrls = externalUrls,
        _href = href,
        _id = id,
        _isLocal = isLocal,
        _name = name,
        _popularity = popularity,
        _previewUrl = previewUrl,
        _trackNumber = trackNumber,
        _type = type,
        _uri = uri,
        super(firestoreUtilData);

  // "album" field.
  AlbumStruct? _album;
  AlbumStruct get album => _album ?? AlbumStruct();
  set album(AlbumStruct? val) => _album = val;

  void updateAlbum(Function(AlbumStruct) updateFn) {
    updateFn(_album ??= AlbumStruct());
  }

  bool hasAlbum() => _album != null;

  // "artists" field.
  List<ArtistsStruct>? _artists;
  List<ArtistsStruct> get artists => _artists ?? const [];
  set artists(List<ArtistsStruct>? val) => _artists = val;

  void updateArtists(Function(List<ArtistsStruct>) updateFn) {
    updateFn(_artists ??= []);
  }

  bool hasArtists() => _artists != null;

  // "available_markets" field.
  List<String>? _availableMarkets;
  List<String> get availableMarkets => _availableMarkets ?? const [];
  set availableMarkets(List<String>? val) => _availableMarkets = val;

  void updateAvailableMarkets(Function(List<String>) updateFn) {
    updateFn(_availableMarkets ??= []);
  }

  bool hasAvailableMarkets() => _availableMarkets != null;

  // "disc_number" field.
  int? _discNumber;
  int get discNumber => _discNumber ?? 0;
  set discNumber(int? val) => _discNumber = val;

  void incrementDiscNumber(int amount) => discNumber = discNumber + amount;

  bool hasDiscNumber() => _discNumber != null;

  // "duration_ms" field.
  int? _durationMs;
  int get durationMs => _durationMs ?? 0;
  set durationMs(int? val) => _durationMs = val;

  void incrementDurationMs(int amount) => durationMs = durationMs + amount;

  bool hasDurationMs() => _durationMs != null;

  // "explicit" field.
  bool? _explicit;
  bool get explicit => _explicit ?? false;
  set explicit(bool? val) => _explicit = val;

  bool hasExplicit() => _explicit != null;

  // "external_ids" field.
  ExternalIdsStruct? _externalIds;
  ExternalIdsStruct get externalIds => _externalIds ?? ExternalIdsStruct();
  set externalIds(ExternalIdsStruct? val) => _externalIds = val;

  void updateExternalIds(Function(ExternalIdsStruct) updateFn) {
    updateFn(_externalIds ??= ExternalIdsStruct());
  }

  bool hasExternalIds() => _externalIds != null;

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

  // "is_local" field.
  bool? _isLocal;
  bool get isLocal => _isLocal ?? false;
  set isLocal(bool? val) => _isLocal = val;

  bool hasIsLocal() => _isLocal != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "popularity" field.
  int? _popularity;
  int get popularity => _popularity ?? 0;
  set popularity(int? val) => _popularity = val;

  void incrementPopularity(int amount) => popularity = popularity + amount;

  bool hasPopularity() => _popularity != null;

  // "preview_url" field.
  String? _previewUrl;
  String get previewUrl => _previewUrl ?? '';
  set previewUrl(String? val) => _previewUrl = val;

  bool hasPreviewUrl() => _previewUrl != null;

  // "track_number" field.
  int? _trackNumber;
  int get trackNumber => _trackNumber ?? 0;
  set trackNumber(int? val) => _trackNumber = val;

  void incrementTrackNumber(int amount) => trackNumber = trackNumber + amount;

  bool hasTrackNumber() => _trackNumber != null;

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

  static TrackStruct fromMap(Map<String, dynamic> data) => TrackStruct(
        album: data['album'] is AlbumStruct
            ? data['album']
            : AlbumStruct.maybeFromMap(data['album']),
        artists: getStructList(
          data['artists'],
          ArtistsStruct.fromMap,
        ),
        availableMarkets: getDataList(data['available_markets']),
        discNumber: castToType<int>(data['disc_number']),
        durationMs: castToType<int>(data['duration_ms']),
        explicit: data['explicit'] as bool?,
        externalIds: data['external_ids'] is ExternalIdsStruct
            ? data['external_ids']
            : ExternalIdsStruct.maybeFromMap(data['external_ids']),
        externalUrls: data['external_urls'] is ExternalUrlsStruct
            ? data['external_urls']
            : ExternalUrlsStruct.maybeFromMap(data['external_urls']),
        href: data['href'] as String?,
        id: data['id'] as String?,
        isLocal: data['is_local'] as bool?,
        name: data['name'] as String?,
        popularity: castToType<int>(data['popularity']),
        previewUrl: data['preview_url'] as String?,
        trackNumber: castToType<int>(data['track_number']),
        type: data['type'] as String?,
        uri: data['uri'] as String?,
      );

  static TrackStruct? maybeFromMap(dynamic data) =>
      data is Map ? TrackStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'album': _album?.toMap(),
        'artists': _artists?.map((e) => e.toMap()).toList(),
        'available_markets': _availableMarkets,
        'disc_number': _discNumber,
        'duration_ms': _durationMs,
        'explicit': _explicit,
        'external_ids': _externalIds?.toMap(),
        'external_urls': _externalUrls?.toMap(),
        'href': _href,
        'id': _id,
        'is_local': _isLocal,
        'name': _name,
        'popularity': _popularity,
        'preview_url': _previewUrl,
        'track_number': _trackNumber,
        'type': _type,
        'uri': _uri,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'album': serializeParam(
          _album,
          ParamType.DataStruct,
        ),
        'artists': serializeParam(
          _artists,
          ParamType.DataStruct,
          isList: true,
        ),
        'available_markets': serializeParam(
          _availableMarkets,
          ParamType.String,
          isList: true,
        ),
        'disc_number': serializeParam(
          _discNumber,
          ParamType.int,
        ),
        'duration_ms': serializeParam(
          _durationMs,
          ParamType.int,
        ),
        'explicit': serializeParam(
          _explicit,
          ParamType.bool,
        ),
        'external_ids': serializeParam(
          _externalIds,
          ParamType.DataStruct,
        ),
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
        'is_local': serializeParam(
          _isLocal,
          ParamType.bool,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'popularity': serializeParam(
          _popularity,
          ParamType.int,
        ),
        'preview_url': serializeParam(
          _previewUrl,
          ParamType.String,
        ),
        'track_number': serializeParam(
          _trackNumber,
          ParamType.int,
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

  static TrackStruct fromSerializableMap(Map<String, dynamic> data) =>
      TrackStruct(
        album: deserializeStructParam(
          data['album'],
          ParamType.DataStruct,
          false,
          structBuilder: AlbumStruct.fromSerializableMap,
        ),
        artists: deserializeStructParam<ArtistsStruct>(
          data['artists'],
          ParamType.DataStruct,
          true,
          structBuilder: ArtistsStruct.fromSerializableMap,
        ),
        availableMarkets: deserializeParam<String>(
          data['available_markets'],
          ParamType.String,
          true,
        ),
        discNumber: deserializeParam(
          data['disc_number'],
          ParamType.int,
          false,
        ),
        durationMs: deserializeParam(
          data['duration_ms'],
          ParamType.int,
          false,
        ),
        explicit: deserializeParam(
          data['explicit'],
          ParamType.bool,
          false,
        ),
        externalIds: deserializeStructParam(
          data['external_ids'],
          ParamType.DataStruct,
          false,
          structBuilder: ExternalIdsStruct.fromSerializableMap,
        ),
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
        isLocal: deserializeParam(
          data['is_local'],
          ParamType.bool,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        popularity: deserializeParam(
          data['popularity'],
          ParamType.int,
          false,
        ),
        previewUrl: deserializeParam(
          data['preview_url'],
          ParamType.String,
          false,
        ),
        trackNumber: deserializeParam(
          data['track_number'],
          ParamType.int,
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
  String toString() => 'TrackStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is TrackStruct &&
        album == other.album &&
        listEquality.equals(artists, other.artists) &&
        listEquality.equals(availableMarkets, other.availableMarkets) &&
        discNumber == other.discNumber &&
        durationMs == other.durationMs &&
        explicit == other.explicit &&
        externalIds == other.externalIds &&
        externalUrls == other.externalUrls &&
        href == other.href &&
        id == other.id &&
        isLocal == other.isLocal &&
        name == other.name &&
        popularity == other.popularity &&
        previewUrl == other.previewUrl &&
        trackNumber == other.trackNumber &&
        type == other.type &&
        uri == other.uri;
  }

  @override
  int get hashCode => const ListEquality().hash([
        album,
        artists,
        availableMarkets,
        discNumber,
        durationMs,
        explicit,
        externalIds,
        externalUrls,
        href,
        id,
        isLocal,
        name,
        popularity,
        previewUrl,
        trackNumber,
        type,
        uri
      ]);
}

TrackStruct createTrackStruct({
  AlbumStruct? album,
  int? discNumber,
  int? durationMs,
  bool? explicit,
  ExternalIdsStruct? externalIds,
  ExternalUrlsStruct? externalUrls,
  String? href,
  String? id,
  bool? isLocal,
  String? name,
  int? popularity,
  String? previewUrl,
  int? trackNumber,
  String? type,
  String? uri,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TrackStruct(
      album: album ?? (clearUnsetFields ? AlbumStruct() : null),
      discNumber: discNumber,
      durationMs: durationMs,
      explicit: explicit,
      externalIds:
          externalIds ?? (clearUnsetFields ? ExternalIdsStruct() : null),
      externalUrls:
          externalUrls ?? (clearUnsetFields ? ExternalUrlsStruct() : null),
      href: href,
      id: id,
      isLocal: isLocal,
      name: name,
      popularity: popularity,
      previewUrl: previewUrl,
      trackNumber: trackNumber,
      type: type,
      uri: uri,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TrackStruct? updateTrackStruct(
  TrackStruct? track, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    track
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTrackStructData(
  Map<String, dynamic> firestoreData,
  TrackStruct? track,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (track == null) {
    return;
  }
  if (track.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && track.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final trackData = getTrackFirestoreData(track, forFieldValue);
  final nestedData = trackData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = track.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTrackFirestoreData(
  TrackStruct? track, [
  bool forFieldValue = false,
]) {
  if (track == null) {
    return {};
  }
  final firestoreData = mapToFirestore(track.toMap());

  // Handle nested data for "album" field.
  addAlbumStructData(
    firestoreData,
    track.hasAlbum() ? track.album : null,
    'album',
    forFieldValue,
  );

  // Handle nested data for "external_ids" field.
  addExternalIdsStructData(
    firestoreData,
    track.hasExternalIds() ? track.externalIds : null,
    'external_ids',
    forFieldValue,
  );

  // Handle nested data for "external_urls" field.
  addExternalUrlsStructData(
    firestoreData,
    track.hasExternalUrls() ? track.externalUrls : null,
    'external_urls',
    forFieldValue,
  );

  // Add any Firestore field values
  track.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTrackListFirestoreData(
  List<TrackStruct>? tracks,
) =>
    tracks?.map((e) => getTrackFirestoreData(e, true)).toList() ?? [];
