import 'package:flutter_app_movie_db/data/model/movie.dart';
import 'package:flutter_app_movie_db/data/model/movie_response.dart';

abstract class MovieRemote {
  Future<MovieResponse> getNowPlaying(int page);

  Future<Movie> getMovie(int id);
}
