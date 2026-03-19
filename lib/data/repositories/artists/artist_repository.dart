import 'package:w9_practice_firebase/model/artists/artist.dart';

abstract class ArtistRepository  {
  Future<List<Artist>> fetchArtists();
}