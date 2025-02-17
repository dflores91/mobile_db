import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mobile_coding_challenge/app/domain/api_client/api_client.dart';
import 'package:mobile_coding_challenge/app/domain/api_client/api_request.dart';
import 'package:mobile_coding_challenge/app/domain/api_client/entities/api_error_response.dart';
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
  Future<Either<MoviesResponse?, ApiErrorResponse>> getMovies() async {
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
        return Right(
          ApiErrorResponse(status: 500, message: 'Failed to get movies'),
        );
      }
    } on DioException catch (e) {
      return handleDioException(e);
    }
  }

  @override
  Future<Either<GenresResponse?, ApiErrorResponse>> getGenres() async {
    try {
      final response = await _apiClient.request(
        ApiRequest.get('genre/movie/list?language=${localeUser()}'),
        (json) => json == null ? null : GenresResponse.fromJson(json),
      );

      if (response != null) {
        return Left(response);
      } else {
        return Right(
          ApiErrorResponse(status: 500, message: 'Failed to get movies'),
        );
      }
    } on DioException catch (e) {
      return handleDioException(e);
    }
  }

  @override
  Future<Either<MoviesResponse?, ApiErrorResponse>> nowPlay() async {
    try {
      final response = await _apiClient.request(
        ApiRequest.get('movie/now_playing?language=${localeUser()}-US&page=1'),
        (json) => json == null ? null : MoviesResponse.fromJson(json),
      );

      if (response != null) {
        return Left(response);
      } else {
        return Right(
          ApiErrorResponse(status: 500, message: 'Failed to get movies'),
        );
      }
    } on DioException catch (e) {
      return handleDioException(e);
    }
  }

  @override
  Future<Either<MoviesResponse?, ApiErrorResponse>> popular() async {
    try {
      final response = await _apiClient.request(
        ApiRequest.get('movie/popular?language=${localeUser()}-US&page=1'),
        (json) => json == null ? null : MoviesResponse.fromJson(json),
      );

      if (response != null) {
        return Left(response);
      } else {
        return Right(
          ApiErrorResponse(status: 500, message: 'Failed to get movies'),
        );
      }
    } on DioException catch (e) {
      return handleDioException(e);
    }
  }

  @override
  Future<Either<MoviesResponse?, ApiErrorResponse>> topRated() async {
    try {
      final response = await _apiClient.request(
        ApiRequest.get('movie/top_rated?language=${localeUser()}-US&page=1'),
        (json) => json == null ? null : MoviesResponse.fromJson(json),
      );

      if (response != null) {
        return Left(response);
      } else {
        return Right(
          ApiErrorResponse(status: 500, message: 'Failed to get movies'),
        );
      }
    } on DioException catch (e) {
      return handleDioException(e);
    }
  }

  @override
  Future<Either<MoviesResponse?, ApiErrorResponse>> upcoming() async {
    try {
      final response = await _apiClient.request(
        ApiRequest.get('movie/upcoming?language=${localeUser()}-US&page=1'),
        (json) => json == null ? null : MoviesResponse.fromJson(json),
      );

      if (response != null) {
        return Left(response);
      } else {
        return Right(
          ApiErrorResponse(status: 500, message: 'Failed to get movies'),
        );
      }
    } on DioException catch (e) {
      return handleDioException(e);
    }
  }

  @override
  Future<Either<MoviesResponse?, ApiErrorResponse>> search(
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
        return Right(
          ApiErrorResponse(status: 500, message: 'Failed to get movies'),
        );
      }
    } on DioException catch (e) {
      return handleDioException(e);
    }
  }
}
