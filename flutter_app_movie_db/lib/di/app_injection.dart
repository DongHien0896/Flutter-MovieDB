import 'package:flutter_app_movie_db/data/repository/repository_impl/movie_repository_impl.dart';
import 'package:flutter_app_movie_db/data/source/remote/movie_remote_data_source.dart';

final injection = AppInjection();

class AppInjection {
  MovieRepositoryImpl provideRepository() =>
      MovieRepositoryImpl(provideMovieRemoteDataSource());

  MovieRemoteDataSource provideMovieRemoteDataSource() =>
      MovieRemoteDataSource();
}
