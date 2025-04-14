import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'tagselection_widget.dart' show TagselectionWidget;
import 'package:flutter/material.dart';

class TagselectionModel extends FlutterFlowModel<TagselectionWidget> {
  ///  Local state fields for this page.

  List<String> spotifyTags = [
    'Rock',
    'Pop',
    'Jazz',
    'Rap',
    'Metal',
    'Folk',
    'Electronic',
    'Country',
    'Hip-Hop',
    'Classical',
    'Musical',
    'Ambient',
    'Indie',
    'Blues',
    'Gospel'
  ];
  void addToSpotifyTags(String item) => spotifyTags.add(item);
  void removeFromSpotifyTags(String item) => spotifyTags.remove(item);
  void removeAtIndexFromSpotifyTags(int index) => spotifyTags.removeAt(index);
  void insertAtIndexInSpotifyTags(int index, String item) =>
      spotifyTags.insert(index, item);
  void updateSpotifyTagsAtIndex(int index, Function(String) updateFn) =>
      spotifyTags[index] = updateFn(spotifyTags[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for CheckboxListTile widget.
  Map<String, bool> checkboxListTileValueMap = {};
  List<String> get checkboxListTileCheckedItems =>
      checkboxListTileValueMap.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
