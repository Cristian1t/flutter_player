import 'song_model.dart';

class Playlist {
  final String title;
  final List<Song> songs;
  final String imageUrl;

  Playlist({
    required this.title,
    required this.songs,
    required this.imageUrl,
  });

  static List<Playlist> playlists = [
    Playlist(
      title: 'Top 50',
      songs: Song.songs,
      imageUrl: 'https://source.unsplash.com/featured/300x201/?music',
    ),
    Playlist(
      title: 'Rock',
      songs: Song.songs,
      imageUrl: 'https://source.unsplash.com/featured/300x202/?music',
    ),
    Playlist(
      title: 'Pop',
      songs: Song.songs,
      imageUrl: 'https://source.unsplash.com/featured/300x203',
    ),
  ];
}
