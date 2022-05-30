class listMovie {
  final int id;
  final String image;
  final String title;

  listMovie({required this.id, required this.image, required this.title});

  factory listMovie.fromJson(Map<String, dynamic> json) {
    return listMovie(
        id: json['id'],
        image: json['poster_path'],
        title: json['title']
    );
  }
}
