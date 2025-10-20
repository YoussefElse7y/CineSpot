part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.topMoviesLoading() = _TopMoviesLoading;
  const factory HomeState.topMoviesLoaded(MoviesResponseEntity movies) = _TopMoviesLoaded;
  const factory HomeState.topMoviesError(String message) = _TopMoviesError;
}
