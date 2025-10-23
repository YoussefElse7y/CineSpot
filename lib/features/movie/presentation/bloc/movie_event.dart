part of 'movie_bloc.dart';

@freezed
abstract class MovieEvent with _$MovieEvent {
  const factory MovieEvent.loadMovieDetails(int movieId, {String? language}) = LoadMovieDetails;
  const factory MovieEvent.loadCredits(int movieId, {String? language}) = LoadCredits;
  const factory MovieEvent.loadVideos(int movieId, {String? language}) = LoadVideos;
  const factory MovieEvent.loadSimilarMovies(int movieId, {String? language, int? page}) = LoadSimilarMovies;
  const factory MovieEvent.loadRecommendations(int movieId, {String? language, int? page}) = LoadRecommendations;
  const factory MovieEvent.loadReviews(int movieId, {String? language, int? page}) = LoadReviews;
  const factory MovieEvent.resetMovie() = ResetMovie;
}