part of 'home_bloc.dart';

@freezed
abstract class HomeEvent with _$HomeEvent {
  const factory HomeEvent.getTopTenMovies(String language) = _GetTopTenMovies;
  const factory HomeEvent.getNowPlayingMovies(String language, int page) = _GetNowPlayingMovies;
  const factory HomeEvent.getTrendingTvShows(String language) = _GetTrendingTvShows;
}
