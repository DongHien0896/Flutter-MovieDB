import 'dart:convert';

import 'package:flutter_app_movie_db/data/model/movie.dart';
import 'package:flutter_app_movie_db/data/model/movie_response.dart';
import 'package:http/http.dart' as http;

import 'movie_remote.dart';

class MovieRemoteDataSource implements MovieRemote {
  static const String API_KEY = "3956f50a726a2f785334c24759b97dc6";
  static const String BASE_URL = "api.themoviedb.org";
  static const String NOW_PLAYING_PATH = "/3/movie/now_playing";
  static const String SEARCH_PATH = "/3/search/movie";
  static const String MOVIE_PATH = "/3/movie/";
  static const String PAGE_PARAM = "page";
  static const String QUERY_PARAM = "query";
  static const String API_KEY_PARAM = "api_key";
  static const String OPTION_PARAM = "append_to_response";

  static MovieRemoteDataSource _instance;

  MovieRemoteDataSource._internal();

  factory MovieRemoteDataSource() {
    if (_instance == null) {
      _instance = MovieRemoteDataSource._internal();
    }
    return _instance;
  }

  @override
  Future<Movie> getMovie(int id) async {
    var url = Uri.https(BASE_URL, MOVIE_PATH + '$id',
        {API_KEY_PARAM: API_KEY, OPTION_PARAM: 'videos, credits'});
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return Movie.fromJson(json.decode(response.body));
    } else {
      throw Exception('Load movie failed');
    }
  }

  @override
  Future<MovieResponse> getNowPlaying(int page) async {
    var url = Uri.https(BASE_URL, NOW_PLAYING_PATH,
        {API_KEY_PARAM: API_KEY, PAGE_PARAM: page.toString()});
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return MovieResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Load movie failed');
    }
  }
}
