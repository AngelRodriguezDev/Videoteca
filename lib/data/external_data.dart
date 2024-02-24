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

  Future<List<Movie>> getTrendings() async {
    List<Movie> _trendingsList = [];
    Response _response = await _http.get(_url + _trendings);
    List _movieList = _response.data["results"];

    for (var movie in _movieList) {
      var auxMovie = await getDescription(movie["id"]);
      auxMovie["image"] = dotenv.get("URL_IMAGE") + movie["poster_path"];
      _trendingsList.add(Movie.fromJson(auxMovie));
    }

    return _trendingsList;
  }

  Future<List<Movie>> getNowPlaying() async {
    List<Movie> _nowPlayingList = [];
    Response _response = await _http.get(_url + _nowPlaying);
    List _movieList = _response.data["results"];

    for (var movie in _movieList) {
      var auxMovie = await getDescription(movie["id"]);
      auxMovie["image"] = dotenv.get("URL_IMAGE") + movie["poster_path"];
      _nowPlayingList.add(Movie.fromJson(auxMovie));
    }

    return _nowPlayingList;
  }

  getDescription(int movie_id) async {
    Response _response = await _http.get(_url +
        "/movie/$movie_id?append_to_response=watch%2Fproviders&language=en-US");
    return _response.data;
  }
}
