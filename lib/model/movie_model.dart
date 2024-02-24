class Movie {
  late String name;
  late String image;
  late String description;
  late double score;
  late String duration;
  late String tags;
  late String release;

  Movie({
    required this.name,
    required this.image,
    required this.description,
    required this.score,
    required this.duration,
    required this.tags,
    required this.release,
  });

  Movie.fromJson(Map<String, dynamic> json) {
    int hours = ((json['runtime'] / 60) as double).toInt();
    String gender = "";

    int i = 0;
    for (Map auxGender in json["genres"]) {
      i++;
      gender += "${auxGender["name"]}";
      if (i < auxGender.entries.length) gender += "/";
    }

    name = json["title"];
    image = json["image"];
    description = json["overview"];
    score = json["vote_average"];
    duration = "$hours h ${json['runtime'] % 60}min";
    tags = gender;
    release = json["release_date"];
  }
}
