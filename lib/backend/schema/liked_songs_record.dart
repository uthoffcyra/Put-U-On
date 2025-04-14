import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LikedSongsRecord extends FirestoreRecord {
  LikedSongsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "song_title" field.
  String? _songTitle;
  String get songTitle => _songTitle ?? '';
  bool hasSongTitle() => _songTitle != null;

  // "artist" field.
  String? _artist;
  String get artist => _artist ?? '';
  bool hasArtist() => _artist != null;

  // "rating" field.
  int? _rating;
  int get rating => _rating ?? 0;
  bool hasRating() => _rating != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  void _initializeFields() {
    _songTitle = snapshotData['song_title'] as String?;
    _artist = snapshotData['artist'] as String?;
    _rating = castToType<int>(snapshotData['rating']);
    _user = snapshotData['user'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('liked_songs');

  static Stream<LikedSongsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LikedSongsRecord.fromSnapshot(s));

  static Future<LikedSongsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LikedSongsRecord.fromSnapshot(s));

  static LikedSongsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LikedSongsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LikedSongsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LikedSongsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LikedSongsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LikedSongsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLikedSongsRecordData({
  String? songTitle,
  String? artist,
  int? rating,
  DocumentReference? user,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'song_title': songTitle,
      'artist': artist,
      'rating': rating,
      'user': user,
    }.withoutNulls,
  );

  return firestoreData;
}

class LikedSongsRecordDocumentEquality implements Equality<LikedSongsRecord> {
  const LikedSongsRecordDocumentEquality();

  @override
  bool equals(LikedSongsRecord? e1, LikedSongsRecord? e2) {
    return e1?.songTitle == e2?.songTitle &&
        e1?.artist == e2?.artist &&
        e1?.rating == e2?.rating &&
        e1?.user == e2?.user;
  }

  @override
  int hash(LikedSongsRecord? e) =>
      const ListEquality().hash([e?.songTitle, e?.artist, e?.rating, e?.user]);

  @override
  bool isValidKey(Object? o) => o is LikedSongsRecord;
}
