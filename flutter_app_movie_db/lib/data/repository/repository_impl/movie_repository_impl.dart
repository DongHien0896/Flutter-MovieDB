import 'package:flutter_app_movie_db/data/model/movie.dart';
import 'package:flutter_app_movie_db/data/model/movie_response.dart';
import 'package:flutter_app_movie_db/data/repository/movie_repository.dart';
import 'package:flutter_app_movie_db/data/source/remote/movie_remote.dart';
import 'package:flutter_app_movie_db/data/source/remote/movie_remote_data_source.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemote remote;
  static MovieRepositoryImpl _instance;

  factory MovieRepositoryImpl(MovieRemoteDataSource remote) {
    if (_instance == null) {
      _instance = MovieRepositoryImpl._internal(remote: remote);
    }
    return _instance;
  }

  MovieRepositoryImpl._internal({this.remote});

  @override
  Future<Movie> getMovie(int id) => remote.getMovie(id);

  @override
  Future<MovieResponse> getNowPlaying(int page) => remote.getNowPlaying(page);
}
