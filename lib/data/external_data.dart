import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:videoteca/model/movie_model.dart';

class ExternalData {
  String _trendings = "movie/popular?language=en-US&page=1";
  String _nowPlaying = "movie/now_playing?language=en-US&page=1";
  String _details = "movie/movie_id?language=en-US";
  String _genres = "genre/movie/list?language=en";
  Dio _http = Dio(BaseOptions(headers: {
    "Content-Type": "application/json",
    "Authorization": dotenv.get("TOKEN"),
  }));
  String _url = dotenv.get("URL");

  getGenres() async {
    Response _response = await _http.get(_url + _genres);
    return _response.data;
  }

  Future<List<Movie>> getTrendings() async {
    print("solicitaste peliculas");

    Map<String, dynamic> _genresList = await getGenres();

    Response _response = await _http.get(_url + _trendings);
    List _movieList = _response.data["results"];

    List<Movie> _trendingsList = [];
    _movieList.forEach((movie) async {
      movie["image"] = dotenv.get("URL_IMAGE") + movie["poster_path"];
      List aux_genre = [];
      for (var element in movie["genre_ids"]) {
        aux_genre.add((_genresList["genres"] as List)
            .firstWhere((genre) => genre["id"] == element)["name"]);
      }
      movie["genre_list"] = aux_genre;
      // Response auxresponse =
      //     await _http.get(movie["image"], options: Options(headers: {}));
      // print(auxresponse);
      _trendingsList.add(Movie.fromJson(movie));
    });

    return _trendingsList;
  }
}
