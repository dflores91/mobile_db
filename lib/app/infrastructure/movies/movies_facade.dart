import 'package:dartz/dartz.dart';
import 'package:mobile_coding_challenge/app/domain/movies/entities/genres_response.dart';
import 'package:mobile_coding_challenge/app/domain/movies/entities/movies_response.dart';

abstract class MoviesFacade {
  Future<Either<MoviesResponse?, String>> getMovies();
  Future<Either<GenresResponse?, String>> getGenres();
  Future<Either<MoviesResponse?, String>> nowPlay();
  Future<Either<MoviesResponse?, String>> popular();
  Future<Either<MoviesResponse?, String>> topRated();
  Future<Either<MoviesResponse?, String>> upcoming();
  Future<Either<MoviesResponse?, String>> search(String query, {int page});
}
