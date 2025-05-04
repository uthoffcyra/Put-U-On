// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LikedSongStruct extends FFFirebaseStruct {
  LikedSongStruct({
    List<String>? imgs,
    List<String>? tracks,
    List<String>? artists,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _imgs = imgs,
        _tracks = tracks,
        _artists = artists,
        super(firestoreUtilData);

  // "imgs" field.
  List<String>? _imgs;
  List<String> get imgs => _imgs ?? const [];
  set imgs(List<String>? val) => _imgs = val;

  void updateImgs(Function(List<String>) updateFn) {
    updateFn(_imgs ??= []);
  }

  bool hasImgs() => _imgs != null;

  // "tracks" field.
  List<String>? _tracks;
  List<String> get tracks => _tracks ?? const [];
  set tracks(List<String>? val) => _tracks = val;

  void updateTracks(Function(List<String>) updateFn) {
    updateFn(_tracks ??= []);
  }

  bool hasTracks() => _tracks != null;

  // "artists" field.
  List<String>? _artists;
  List<String> get artists => _artists ?? const [];
  set artists(List<String>? val) => _artists = val;

  void updateArtists(Function(List<String>) updateFn) {
    updateFn(_artists ??= []);
  }

  bool hasArtists() => _artists != null;

  static LikedSongStruct fromMap(Map<String, dynamic> data) => LikedSongStruct(
        imgs: getDataList(data['imgs']),
        tracks: getDataList(data['tracks']),
        artists: getDataList(data['artists']),
      );

  static LikedSongStruct? maybeFromMap(dynamic data) => data is Map
      ? LikedSongStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'imgs': _imgs,
        'tracks': _tracks,
        'artists': _artists,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'imgs': serializeParam(
          _imgs,
          ParamType.String,
          isList: true,
        ),
        'tracks': serializeParam(
          _tracks,
          ParamType.String,
          isList: true,
        ),
        'artists': serializeParam(
          _artists,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static LikedSongStruct fromSerializableMap(Map<String, dynamic> data) =>
      LikedSongStruct(
        imgs: deserializeParam<String>(
          data['imgs'],
          ParamType.String,
          true,
        ),
        tracks: deserializeParam<String>(
          data['tracks'],
          ParamType.String,
          true,
        ),
        artists: deserializeParam<String>(
          data['artists'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'LikedSongStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is LikedSongStruct &&
        listEquality.equals(imgs, other.imgs) &&
        listEquality.equals(tracks, other.tracks) &&
        listEquality.equals(artists, other.artists);
  }

  @override
  int get hashCode => const ListEquality().hash([imgs, tracks, artists]);
}

LikedSongStruct createLikedSongStruct({
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LikedSongStruct(
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LikedSongStruct? updateLikedSongStruct(
  LikedSongStruct? likedSong, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    likedSong
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLikedSongStructData(
  Map<String, dynamic> firestoreData,
  LikedSongStruct? likedSong,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (likedSong == null) {
    return;
  }
  if (likedSong.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && likedSong.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final likedSongData = getLikedSongFirestoreData(likedSong, forFieldValue);
  final nestedData = likedSongData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = likedSong.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLikedSongFirestoreData(
  LikedSongStruct? likedSong, [
  bool forFieldValue = false,
]) {
  if (likedSong == null) {
    return {};
  }
  final firestoreData = mapToFirestore(likedSong.toMap());

  // Add any Firestore field values
  likedSong.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLikedSongListFirestoreData(
  List<LikedSongStruct>? likedSongs,
) =>
    likedSongs?.map((e) => getLikedSongFirestoreData(e, true)).toList() ?? [];
