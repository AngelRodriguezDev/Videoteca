import 'package:flutter/material.dart';
import 'package:videoteca/data/external_data.dart';
import 'package:videoteca/model/movie_model.dart';

class BookmarkController with ChangeNotifier {
  late List<Movie> _trendingList = [];
  late List<Movie> _nowPlayingList = [];

  get trendingList => _trendingList;
  get nowPlayingList => _nowPlayingList;

  setTrendingList() async {
    _trendingList = await ExternalData().getTrendings();

    notifyListeners();
  }

  setNowPlayingList() async {
    _nowPlayingList = await ExternalData().getNowPlaying();

    notifyListeners();
  }
}
