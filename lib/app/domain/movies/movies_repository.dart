import 'package:dartz/dartz.dart';
import 'package:mobile_coding_challenge/app/domain/api_client/api_client.dart';
import 'package:mobile_coding_challenge/app/domain/api_client/api_request.dart';
import 'package:mobile_coding_challenge/app/domain/movies/entities/genres_response.dart';
import 'package:mobile_coding_challenge/app/domain/movies/entities/movies_response.dart';
import 'package:mobile_coding_challenge/app/infrastructure/movies/movies_facade.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile_coding_challenge/app/presentation/utils/locale_user.dart';

@Injectable(as: MoviesFacade)
class MoviesRepository implements MoviesFacade {
  MoviesRepository(this._apiClient);

  final ApiClient _apiClient;

  @override
  Future<Either<MoviesResponse?, String>> getMovies() async {
    try {
      final response = await _apiClient.request(
        ApiRequest.get(
          'discover/movie?include_adult=false&include_video=false&language=${localeUser()}-US&page=1&sort_by=popularity.desc',
        ),
        (json) => json == null ? null : MoviesResponse.fromJson(json),
      );

      if (response != null) {
        return Left(response);
      } else {
        return Right('Failed to get movies');
      }
    } catch (e) {
      return Right('Failed to get movies: ${e.toString()}');
    }
  }

  @override
  Future<Either<GenresResponse?, String>> getGenres() async {
    try {
      final response = await _apiClient.request(
        ApiRequest.get('genre/movie/list?language=${localeUser()}'),
        (json) => json == null ? null : GenresResponse.fromJson(json),
      );

      if (response != null) {
        return Left(response);
      } else {
        return Right('Failed to get movies');
      }
    } catch (e) {
      return Right('Failed to get movies: ${e.toString()}');
    }
  }

  @override
  Future<Either<MoviesResponse?, String>> nowPlay() async {
    try {
      final response = await _apiClient.request(
        ApiRequest.get('movie/now_playing?language=${localeUser()}-US&page=1'),
        (json) => json == null ? null : MoviesResponse.fromJson(json),
      );

      if (response != null) {
        return Left(response);
      } else {
        return Right('Failed to get movies');
      }
    } catch (e) {
      return Right('Failed to get movies: ${e.toString()}');
    }
  }

  @override
  Future<Either<MoviesResponse?, String>> popular() async {
    try {
      final response = await _apiClient.request(
        ApiRequest.get('movie/popular?language=${localeUser()}-US&page=1'),
        (json) => json == null ? null : MoviesResponse.fromJson(json),
      );

      if (response != null) {
        return Left(response);
      } else {
        return Right('Failed to get movies');
      }
    } catch (e) {
      return Right('Failed to get movies: ${e.toString()}');
    }
  }

  @override
  Future<Either<MoviesResponse?, String>> topRated() async {
    try {
      final response = await _apiClient.request(
        ApiRequest.get('movie/top_rated?language=${localeUser()}-US&page=1'),
        (json) => json == null ? null : MoviesResponse.fromJson(json),
      );

      if (response != null) {
        return Left(response);
      } else {
        return Right('Failed to get movies');
      }
    } catch (e) {
      return Right('Failed to get movies: ${e.toString()}');
    }
  }

  @override
  Future<Either<MoviesResponse?, String>> upcoming() async {
    try {
      final response = await _apiClient.request(
        ApiRequest.get('movie/upcoming?language=${localeUser()}-US&page=1'),
        (json) => json == null ? null : MoviesResponse.fromJson(json),
      );

      if (response != null) {
        return Left(response);
      } else {
        return Right('Failed to get movies');
      }
    } catch (e) {
      return Right('Failed to get movies: ${e.toString()}');
    }
  }

  @override
  Future<Either<MoviesResponse?, String>> search(
    String query, {
    int page = 1,
  }) async {
    try {
      final response = await _apiClient.request(
        ApiRequest.get(
          'search/movie?include_adult=false&language=${localeUser()}-US&page=$page&query=$query',
        ),
        (json) => json == null ? null : MoviesResponse.fromJson(json),
      );

      if (response != null) {
        return Left(response);
      } else {
        return Right('Failed to get movies');
      }
    } catch (e) {
      return Right('Failed to get movies: ${e.toString()}');
    }
  }
}
