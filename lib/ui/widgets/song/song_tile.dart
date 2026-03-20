import 'package:flutter/material.dart';
import 'package:w9_practice_firebase/model/song_with_artist/song_with_artist.dart';

class SongTile extends StatelessWidget {
  const SongTile({
    super.key,
    required this.songWithArtist,
    required this.isPlaying,
    required this.onTap,
  });

  final SongWithArtist songWithArtist;
  final bool isPlaying;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)
        ),
        child: ListTile(
          leading: CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(songWithArtist.song.imageUrl),
          ),
          onTap: onTap,
          title: Text(songWithArtist.song.title),
          subtitle: Row(
            spacing: 20,
            children: [
              Text('${songWithArtist.song.formatDuration(songWithArtist.song.duration)} mins'),
              Text('${songWithArtist.artist.name} - ${songWithArtist.artist.genre}')
            ],
          ),
          trailing: Text(
            isPlaying ? "Playing" : "",
            style: TextStyle(color: Colors.amber),
          ),
        ),
      ),
    );
  }
}
