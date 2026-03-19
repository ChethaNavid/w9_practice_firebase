import 'dart:convert';

import 'package:w9_practice_firebase/data/dtos/artist_dto.dart';
import 'package:w9_practice_firebase/data/repositories/artists/artist_repository.dart';
import 'package:w9_practice_firebase/model/artists/artist.dart';
import 'package:http/http.dart' as http;

class ArtistRepositoryFirebase extends ArtistRepository{
  final Uri artistsUri = Uri.https('w9-database-f4f07-default-rtdb.asia-southeast1.firebasedatabase.app', '/artists.json');
  @override
  Future<List<Artist>> fetchArtists() async {
    final http.Response response = await http.get(artistsUri);

    if (response.statusCode == 200) {
      // 1 - Send the retrieved list of songs
      Map<String, dynamic> artistJson = json.decode(response.body);
      return artistJson.entries.map((entry) {
        return ArtistDto.fromJson(entry.key, entry.value);
      }).toList();
    } else {
      // 2- Throw expcetion if any issue
      throw Exception('Failed to load posts');
    }
  }

}