class listMovie {
  final int id;
  final String image;
  final String title;

  listMovie({required this.id, required this.image, required this.title});

  factory listMovie.fromJson(Map<String, dynamic> json) {
    return listMovie(
<<<<<<< HEAD
        id: json['id'], image: json['poster_path'], title: json['title']);
=======
        id: json['id'],
        image: json['poster_path'],
        title: json['title']
    );
>>>>>>> 32ee78af82b7670d5d2a7475f6319dafc9b8f3c0
  }
}
