part of 'movie_bloc.dart';

enum MovieDetailsStatus { initial, loading, loaded, error }
enum MovieCreditsStatus { initial, loading, loaded, error }
enum MovieVideosStatus { initial, loading, loaded, error }
enum MovieSimilarStatus { initial, loading, loaded, error }
enum MovieRecommendationsStatus { initial, loading, loaded, error }
enum MovieReviewsStatus { initial, loading, loaded, error }

@freezed
abstract class MovieState with _$MovieState {
  const factory MovieState({
    @Default(MovieDetailsStatus.initial) MovieDetailsStatus detailsStatus,
    @Default(MovieCreditsStatus.initial) MovieCreditsStatus creditsStatus,
    @Default(MovieVideosStatus.initial) MovieVideosStatus videosStatus,
    @Default(MovieSimilarStatus.initial) MovieSimilarStatus similarStatus,
    @Default(MovieRecommendationsStatus.initial) MovieRecommendationsStatus recommendationsStatus,
    @Default(MovieReviewsStatus.initial) MovieReviewsStatus reviewsStatus,
    MovieDetailsEntity? movieDetails,
    CreditsEntity? credits,
    MovieVideosEntity? videos,
    SimilarMoviesResponseEntity? similarMovies,
    RecommendationsEntity? recommendations,
    List<MovieReviewEntity>? reviews,
    String? detailsError,
    String? creditsError,
    String? videosError,
    String? similarError,
    String? recommendationsError,
    String? reviewsError,
  }) = _MovieState;
}
