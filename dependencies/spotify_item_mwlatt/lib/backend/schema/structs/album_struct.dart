// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AlbumStruct extends FFFirebaseStruct {
  AlbumStruct({
    String? albumType,
    List<ArtistsStruct>? artists,
    List<String>? availableMarkets,
    ExternalUrlsStruct? externalUrls,
    String? href,
    String? id,
    List<ImagesStruct>? images,
    String? name,
    String? releaseDate,
    String? releaseDatePrecision,
    int? totalTracks,
    String? type,
    String? uri,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _albumType = albumType,
        _artists = artists,
        _availableMarkets = availableMarkets,
        _externalUrls = externalUrls,
        _href = href,
        _id = id,
        _images = images,
        _name = name,
        _releaseDate = releaseDate,
        _releaseDatePrecision = releaseDatePrecision,
        _totalTracks = totalTracks,
        _type = type,
        _uri = uri,
        super(firestoreUtilData);

  // "album_type" field.
  String? _albumType;
  String get albumType => _albumType ?? '';
  set albumType(String? val) => _albumType = val;

  bool hasAlbumType() => _albumType != null;

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

  // "images" field.
  List<ImagesStruct>? _images;
  List<ImagesStruct> get images => _images ?? const [];
  set images(List<ImagesStruct>? val) => _images = val;

  void updateImages(Function(List<ImagesStruct>) updateFn) {
    updateFn(_images ??= []);
  }

  bool hasImages() => _images != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "release_date" field.
  String? _releaseDate;
  String get releaseDate => _releaseDate ?? '';
  set releaseDate(String? val) => _releaseDate = val;

  bool hasReleaseDate() => _releaseDate != null;

  // "release_date_precision" field.
  String? _releaseDatePrecision;
  String get releaseDatePrecision => _releaseDatePrecision ?? '';
  set releaseDatePrecision(String? val) => _releaseDatePrecision = val;

  bool hasReleaseDatePrecision() => _releaseDatePrecision != null;

  // "total_tracks" field.
  int? _totalTracks;
  int get totalTracks => _totalTracks ?? 0;
  set totalTracks(int? val) => _totalTracks = val;

  void incrementTotalTracks(int amount) => totalTracks = totalTracks + amount;

  bool hasTotalTracks() => _totalTracks != null;

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

  static AlbumStruct fromMap(Map<String, dynamic> data) => AlbumStruct(
        albumType: data['album_type'] as String?,
        artists: getStructList(
          data['artists'],
          ArtistsStruct.fromMap,
        ),
        availableMarkets: getDataList(data['available_markets']),
        externalUrls: data['external_urls'] is ExternalUrlsStruct
            ? data['external_urls']
            : ExternalUrlsStruct.maybeFromMap(data['external_urls']),
        href: data['href'] as String?,
        id: data['id'] as String?,
        images: getStructList(
          data['images'],
          ImagesStruct.fromMap,
        ),
        name: data['name'] as String?,
        releaseDate: data['release_date'] as String?,
        releaseDatePrecision: data['release_date_precision'] as String?,
        totalTracks: castToType<int>(data['total_tracks']),
        type: data['type'] as String?,
        uri: data['uri'] as String?,
      );

  static AlbumStruct? maybeFromMap(dynamic data) =>
      data is Map ? AlbumStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'album_type': _albumType,
        'artists': _artists?.map((e) => e.toMap()).toList(),
        'available_markets': _availableMarkets,
        'external_urls': _externalUrls?.toMap(),
        'href': _href,
        'id': _id,
        'images': _images?.map((e) => e.toMap()).toList(),
        'name': _name,
        'release_date': _releaseDate,
        'release_date_precision': _releaseDatePrecision,
        'total_tracks': _totalTracks,
        'type': _type,
        'uri': _uri,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'album_type': serializeParam(
          _albumType,
          ParamType.String,
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
        'images': serializeParam(
          _images,
          ParamType.DataStruct,
          isList: true,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'release_date': serializeParam(
          _releaseDate,
          ParamType.String,
        ),
        'release_date_precision': serializeParam(
          _releaseDatePrecision,
          ParamType.String,
        ),
        'total_tracks': serializeParam(
          _totalTracks,
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

  static AlbumStruct fromSerializableMap(Map<String, dynamic> data) =>
      AlbumStruct(
        albumType: deserializeParam(
          data['album_type'],
          ParamType.String,
          false,
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
        images: deserializeStructParam<ImagesStruct>(
          data['images'],
          ParamType.DataStruct,
          true,
          structBuilder: ImagesStruct.fromSerializableMap,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        releaseDate: deserializeParam(
          data['release_date'],
          ParamType.String,
          false,
        ),
        releaseDatePrecision: deserializeParam(
          data['release_date_precision'],
          ParamType.String,
          false,
        ),
        totalTracks: deserializeParam(
          data['total_tracks'],
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
  String toString() => 'AlbumStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is AlbumStruct &&
        albumType == other.albumType &&
        listEquality.equals(artists, other.artists) &&
        listEquality.equals(availableMarkets, other.availableMarkets) &&
        externalUrls == other.externalUrls &&
        href == other.href &&
        id == other.id &&
        listEquality.equals(images, other.images) &&
        name == other.name &&
        releaseDate == other.releaseDate &&
        releaseDatePrecision == other.releaseDatePrecision &&
        totalTracks == other.totalTracks &&
        type == other.type &&
        uri == other.uri;
  }

  @override
  int get hashCode => const ListEquality().hash([
        albumType,
        artists,
        availableMarkets,
        externalUrls,
        href,
        id,
        images,
        name,
        releaseDate,
        releaseDatePrecision,
        totalTracks,
        type,
        uri
      ]);
}

AlbumStruct createAlbumStruct({
  String? albumType,
  ExternalUrlsStruct? externalUrls,
  String? href,
  String? id,
  String? name,
  String? releaseDate,
  String? releaseDatePrecision,
  int? totalTracks,
  String? type,
  String? uri,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AlbumStruct(
      albumType: albumType,
      externalUrls:
          externalUrls ?? (clearUnsetFields ? ExternalUrlsStruct() : null),
      href: href,
      id: id,
      name: name,
      releaseDate: releaseDate,
      releaseDatePrecision: releaseDatePrecision,
      totalTracks: totalTracks,
      type: type,
      uri: uri,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AlbumStruct? updateAlbumStruct(
  AlbumStruct? album, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    album
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAlbumStructData(
  Map<String, dynamic> firestoreData,
  AlbumStruct? album,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (album == null) {
    return;
  }
  if (album.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && album.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final albumData = getAlbumFirestoreData(album, forFieldValue);
  final nestedData = albumData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = album.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAlbumFirestoreData(
  AlbumStruct? album, [
  bool forFieldValue = false,
]) {
  if (album == null) {
    return {};
  }
  final firestoreData = mapToFirestore(album.toMap());

  // Handle nested data for "external_urls" field.
  addExternalUrlsStructData(
    firestoreData,
    album.hasExternalUrls() ? album.externalUrls : null,
    'external_urls',
    forFieldValue,
  );

  // Add any Firestore field values
  album.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAlbumListFirestoreData(
  List<AlbumStruct>? albums,
) =>
    albums?.map((e) => getAlbumFirestoreData(e, true)).toList() ?? [];
