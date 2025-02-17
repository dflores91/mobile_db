import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile_coding_challenge/app/application/config/injectable.dart';
import 'package:mobile_coding_challenge/app/domain/app_storage/app_storage.dart';
import 'package:mobile_coding_challenge/app/domain/flavors/flavors_config.dart';
import 'package:mobile_coding_challenge/app/domain/movies/entities/genres_response.dart';
import 'package:mobile_coding_challenge/app/domain/movies/entities/movies_response.dart';
import 'package:mobile_coding_challenge/app/infrastructure/movies/movies_facade.dart';

part 'root_state.dart';

@injectable
class RootCubit extends Cubit<RootState> {
  RootCubit(this._moviesFacade, this._appStorage) : super(const RootState());

  final MoviesFacade _moviesFacade;
  final AppStorage _appStorage;

  String get urlImage => getIt.get<FlavorConfig>().urlImage;

  Future<void> getMovies() async {
    final urlImage = getIt.get<FlavorConfig>().urlImage;
    final response = await _moviesFacade.getMovies();
    response.fold(
      (MoviesResponse? movies) {
        if (movies != null) {
          final carouselImages =
              movies.results!.map((e) {
                return urlImage + (e.posterPath ?? '');
              }).toList();
          emit(
            state.copyWith(
              movies: movies.results,
              carouselImages: carouselImages,
            ),
          );
        }
      },
      (String r) {
        log('error: $r');
      },
    );
  }

  Future<void> getPlayNowMovies() async {
    final response = await _moviesFacade.nowPlay();
    response.fold(
      (MoviesResponse? movies) {
        if (movies != null) {
          emit(state.copyWith(nowPlayMovies: movies.results));
        }
      },
      (String r) {
        log('error: $r');
      },
    );
  }

  Future<void> getPopularMovies() async {
    final response = await _moviesFacade.popular();
    response.fold(
      (MoviesResponse? movies) {
        if (movies != null) {
          emit(state.copyWith(popularMovies: movies.results));
        }
      },
      (String r) {
        log('error: $r');
      },
    );
  }

  Future<void> getTopRatedMovies() async {
    final response = await _moviesFacade.topRated();
    response.fold(
      (MoviesResponse? movies) {
        if (movies != null) {
          emit(state.copyWith(topRatedMovies: movies.results));
        }
      },
      (String r) {
        log('error: $r');
      },
    );
  }

  Future<void> getUpcomingMovies() async {
    final response = await _moviesFacade.upcoming();
    response.fold(
      (MoviesResponse? movies) {
        if (movies != null) {
          emit(state.copyWith(upcomingMovies: movies.results));
        }
      },
      (String r) {
        log('error: $r');
      },
    );
  }

  Future<void> getGenres() async {
    final response = await _moviesFacade.getGenres();
    response.fold(
      (GenresResponse? generes) {
        if (generes != null) {
          emit(state.copyWith(genres: generes.genres));
        }
      },
      (String r) {
        log('error: $r');
      },
    );
  }

  void searchMovies(String query) async {
    final response = await _moviesFacade.search(
      query,
      page: state.pageToSearch,
    );
    response.fold(
      (MoviesResponse? movies) {
        if (movies != null) {
          emit(state.copyWith(searchMovies: movies.results));
        }
      },
      (String r) {
        log('error: $r');
      },
    );
  }

  void searchMoviesNextPage(String query) async {
    final response = await _moviesFacade.search(
      query,
      page: state.pageToSearch + 1,
    );
    response.fold(
      (MoviesResponse? movies) {
        if (movies != null) {
          emit(
            state.copyWith(
              searchMovies: [...state.searchMovies, ...?movies.results],
              pageToSearch: movies.page,
            ),
          );
        }
      },
      (String r) {
        log('error: $r');
      },
    );
  }

  void clearSearch() {
    emit(state.copyWith(searchMovies: [], pageToSearch: 1));
  }

  void getWishlist() {
    final wishlist = _appStorage.getValue<MoviesResponse?>(
      Keys.appUserWishlist,
      (String? json) =>
          json != null ? MoviesResponse.fromJson(jsonDecode(json)) : null,
    );
    emit(state.copyWith(wishlist: wishlist?.results));
  }

  void addToWishlist(MovieDetail movie) {
    List<MovieDetail> wishlist = List.from(state.wishlist);
    wishlist.add(movie);
    _appStorage.setValue(
      Keys.appUserWishlist,
      jsonEncode(MoviesResponse(results: wishlist).toJson()),
    );
    emit(state.copyWith(wishlist: wishlist));
  }

  void removeFromWishlist(MovieDetail movie) {
    List<MovieDetail> wishlist = List.from(state.wishlist);
    wishlist.remove(movie);
    _appStorage.setValue(
      Keys.appUserWishlist,
      jsonEncode(MoviesResponse(results: wishlist).toJson()),
    );
    emit(state.copyWith(wishlist: wishlist));
  }

  void clearWishlist() {
    _appStorage.clear();
    emit(state.copyWith(wishlist: []));
  }

  bool isFavoriteMovie(MovieDetail movie) {
    return state.wishlist.contains(movie);
  }
}
