class Movie {
  late String name;
  late String image;
  late String description;
  late double score;
  late List<dynamic> tags;

  Movie({
    required this.name,
    required this.image,
    required this.description,
    required this.score,
    required this.tags,
  });

  Movie.fromJson(Map<String, dynamic> json) {
    name = json["title"];
    image = json["image"];
    description = json["overview"];
    score = json["vote_average"];
    tags = json["genre_list"];
  }
}
