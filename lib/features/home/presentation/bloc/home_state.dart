part of 'home_bloc.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    @Default(false) bool isLoadingTopMovies,
    @Default(false) bool isLoadingNowPlaying,
    @Default(false) bool isLoadingTrendingTvShows,
    MoviesResponseEntity? topMovies,
    List<NowPlayingMovieEntity>? nowPlayingMovies,
    List<TrendingTvShowEntity>? trendingTvShows,
    String? errorMessage,
  }) = _HomeState;

  factory HomeState.initial() => const HomeState();
}
