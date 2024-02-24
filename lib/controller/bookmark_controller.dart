import 'package:flutter/material.dart';
import 'package:videoteca/data/external_data.dart';
import 'package:videoteca/model/movie_model.dart';

class BookmarkController with ChangeNotifier {
  late List<Movie> _trendingList = [];
  late List<Movie> _nowPlayingList = [];
  late List<Movie> _searchList = [];
  bool _isSearching = false;

  get trendingList => _trendingList;
  get nowPlayingList => _nowPlayingList;
  get searchList => _searchList;
  get isSearching => _isSearching;

  setTrendingList() async {
    _trendingList = await ExternalData().getTrendings();

    notifyListeners();
  }

  setNowPlayingList() async {
    _nowPlayingList = await ExternalData().getNowPlaying();

    notifyListeners();
  }

  setSearch(String query) async {
    print("soy una query --------------" + query);
    query.isEmpty ? _isSearching = false : _isSearching = true;
    _searchList = await ExternalData().searchMovie(query);

    notifyListeners();
  }
}
