import 'package:dartz/dartz.dart';
import 'package:mobile_coding_challenge/app/domain/api_client/entities/api_error_response.dart';
import 'package:mobile_coding_challenge/app/domain/movies/entities/genres_response.dart';
import 'package:mobile_coding_challenge/app/domain/movies/entities/movies_response.dart';

abstract class MoviesFacade {
  Future<Either<MoviesResponse?, ApiErrorResponse>> getMovies();
  Future<Either<GenresResponse?, ApiErrorResponse>> getGenres();
  Future<Either<MoviesResponse?, ApiErrorResponse>> nowPlay();
  Future<Either<MoviesResponse?, ApiErrorResponse>> popular();
  Future<Either<MoviesResponse?, ApiErrorResponse>> topRated();
  Future<Either<MoviesResponse?, ApiErrorResponse>> upcoming();
  Future<Either<MoviesResponse?, ApiErrorResponse>> search(
    String query, {
    int page,
  });
}
