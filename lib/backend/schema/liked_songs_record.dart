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

  // "cover_art" field.
  String? _coverArt;
  String get coverArt => _coverArt ?? '';
  bool hasCoverArt() => _coverArt != null;

  // "url" field.
  String? _url;
  String get url => _url ?? '';
  bool hasUrl() => _url != null;

  // "explicit" field.
  bool? _explicit;
  bool get explicit => _explicit ?? false;
  bool hasExplicit() => _explicit != null;

  // "added" field.
  DateTime? _added;
  DateTime? get added => _added;
  bool hasAdded() => _added != null;

  // "recommended" field.
  bool? _recommended;
  bool get recommended => _recommended ?? false;
  bool hasRecommended() => _recommended != null;

  void _initializeFields() {
    _songTitle = snapshotData['song_title'] as String?;
    _artist = snapshotData['artist'] as String?;
    _rating = castToType<int>(snapshotData['rating']);
    _user = snapshotData['user'] as DocumentReference?;
    _coverArt = snapshotData['cover_art'] as String?;
    _url = snapshotData['url'] as String?;
    _explicit = snapshotData['explicit'] as bool?;
    _added = snapshotData['added'] as DateTime?;
    _recommended = snapshotData['recommended'] as bool?;
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
  String? coverArt,
  String? url,
  bool? explicit,
  DateTime? added,
  bool? recommended,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'song_title': songTitle,
      'artist': artist,
      'rating': rating,
      'user': user,
      'cover_art': coverArt,
      'url': url,
      'explicit': explicit,
      'added': added,
      'recommended': recommended,
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
        e1?.user == e2?.user &&
        e1?.coverArt == e2?.coverArt &&
        e1?.url == e2?.url &&
        e1?.explicit == e2?.explicit &&
        e1?.added == e2?.added &&
        e1?.recommended == e2?.recommended;
  }

  @override
  int hash(LikedSongsRecord? e) => const ListEquality().hash([
        e?.songTitle,
        e?.artist,
        e?.rating,
        e?.user,
        e?.coverArt,
        e?.url,
        e?.explicit,
        e?.added,
        e?.recommended
      ]);

  @override
  bool isValidKey(Object? o) => o is LikedSongsRecord;
}
