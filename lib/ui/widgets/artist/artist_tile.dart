import 'package:flutter/material.dart';
import 'package:w9_practice_firebase/model/artists/artist.dart';

class ArtistTile extends StatelessWidget {
  final Artist artist;

  const ArtistTile({super.key, required this.artist});

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
            backgroundImage: NetworkImage(artist.imageUrl),
          ),
          title: Text(artist.name),
          subtitle: Text(artist.genre),
        ),
      ),
    );
  }
}