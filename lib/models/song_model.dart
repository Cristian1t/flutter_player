class Song {
  final String title;
  final String description;
  final String url;
  final String coverUrl;

  Song({
    required this.title,
    required this.description,
    required this.url,
    required this.coverUrl,
  });

  static List<Song> songs = [
    Song(
        title: 'Glass',
        description: 'Glass',
        url: 'assets/music/glass.mp3',
        coverUrl: 'assets/images/glass.jpg'),
    Song(
        title: 'Illusions',
        description: 'Illusions',
        url: 'assets/music/illusions.mp3',
        coverUrl: 'assets/images/illusions.jpg'),
    Song(
        title: 'Lemon',
        description: 'Lemon',
        url: 'assets/music/lemon.mp3',
        coverUrl: 'assets/images/lemon.jpg'),
  ];
}
