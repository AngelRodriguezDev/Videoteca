import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:videoteca/model/movie_model.dart';

class ExternalData {
  String _trendings = "movie/popular?language=en-US&page=1";
  String _nowPlaying = "movie/now_playing?language=en-US&page=1";
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

  Future<List<Movie>> searchMovie(String query) async {
    List<Movie> _searchList = [];
    String auxUrl =
        "${_url}search/movie?query=$query&include_adult=false&language=en-US&page=1";
    Response _response = await _http.get(auxUrl);

    for (var movie in _response.data["results"]) {
      var auxMovie = await getDescription(movie["id"]);
      if (movie["poster_path"] != null) {
        auxMovie["image"] = dotenv.get("URL_IMAGE") + movie["poster_path"];
      } else {
        auxMovie["image"] =
            "https://img.ksl.com/slc/2924/292400/29240085.jpeg?filter=ksl/1600x900";
      }

      _searchList.add(Movie.fromJson(auxMovie));
    }

    return _searchList;
  }

  getDescription(int movie_id) async {
    Response _response = await _http.get(_url +
        "/movie/$movie_id?append_to_response=watch%2Fproviders&language=en-US");
    return _response.data;
  }
}
