import 'package:flutter/material.dart';
import 'package:w9_practice_firebase/data/repositories/artists/artist_repository.dart';
import 'package:w9_practice_firebase/model/artists/artist.dart';
import 'package:w9_practice_firebase/ui/utils/async_value.dart';

class ArtistViewModel extends ChangeNotifier {
  final ArtistRepository artistRepository;

  ArtistViewModel({required this.artistRepository}) {
    _init();
  }

  AsyncValue<List<Artist>> artistsValue = AsyncValue.loading();

  bool _isDisposed = false;

  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }

  void _init() async {
    fetchArtists();
  }

  void fetchArtists() async {
    // 1- Loading state
    artistsValue = AsyncValue.loading();
    if (!_isDisposed) notifyListeners();

    try {
      // 2- Fetch is successfull
      List<Artist> songs = await artistRepository.fetchArtists();

      if (_isDisposed) return;

      artistsValue = AsyncValue.success(songs);
    } catch (e) {
      // 3- Fetch is unsucessfull
      artistsValue = AsyncValue.error(e);
    }
    if (!_isDisposed) notifyListeners();
  }
}
