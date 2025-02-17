part of 'root_cubit.dart';

class RootState extends Equatable {
  const RootState({
    this.nowPlayMovies = const [],
    this.popularMovies = const [],
    this.topRatedMovies = const [],
    this.upcomingMovies = const [],
    this.movies = const [],
    this.carouselImages = const [],
    this.genres = const [],
    this.searchMovies = const [],
    this.pageToSearch = 1,
    this.wishlist = const [],
    this.showErrorMessage = false,
    this.errorMessage = '',
  });

  final List<MovieDetail?> movies;
  final List<MovieDetail?> nowPlayMovies;
  final List<MovieDetail?> popularMovies;
  final List<MovieDetail?> topRatedMovies;
  final List<MovieDetail?> upcomingMovies;
  final List<String> carouselImages;
  final List<Genre?> genres;
  final List<MovieDetail?> searchMovies;
  final int pageToSearch;
  final List<MovieDetail> wishlist;
  final bool showErrorMessage;
  final String errorMessage;

  RootState copyWith({
    List<MovieDetail>? movies,
    List<String>? carouselImages,
    List<MovieDetail>? nowPlayMovies,
    List<MovieDetail>? popularMovies,
    List<MovieDetail>? topRatedMovies,
    List<MovieDetail>? upcomingMovies,
    List<Genre>? genres,
    List<MovieDetail?>? searchMovies,
    int? pageToSearch,
    List<MovieDetail>? wishlist,
    bool? showErrorMessage,
    String? errorMessage,
  }) => RootState(
    movies: movies ?? this.movies,
    nowPlayMovies: nowPlayMovies ?? this.nowPlayMovies,
    popularMovies: popularMovies ?? this.popularMovies,
    topRatedMovies: topRatedMovies ?? this.topRatedMovies,
    upcomingMovies: upcomingMovies ?? this.upcomingMovies,
    carouselImages: carouselImages ?? this.carouselImages,
    genres: genres ?? this.genres,
    searchMovies: searchMovies ?? this.searchMovies,
    pageToSearch: pageToSearch ?? this.pageToSearch,
    wishlist: wishlist ?? this.wishlist,
    showErrorMessage: showErrorMessage ?? this.showErrorMessage,
    errorMessage: errorMessage ?? this.errorMessage,
  );

  @override
  List<Object?> get props => [
    movies,
    nowPlayMovies,
    popularMovies,
    topRatedMovies,
    upcomingMovies,
    carouselImages,
    genres,
    searchMovies,
    pageToSearch,
    wishlist,
    showErrorMessage,
    errorMessage,
  ];
}
