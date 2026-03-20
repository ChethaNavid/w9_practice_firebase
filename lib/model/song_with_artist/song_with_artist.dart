import 'package:w9_practice_firebase/model/artists/artist.dart';
import 'package:w9_practice_firebase/model/songs/song.dart';

class SongWithArtist {
  final Song song;
  final Artist artist;

  SongWithArtist({required this.song, required this.artist});
}