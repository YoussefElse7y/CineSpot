part of 'movie_bloc.dart';

enum MovieDetailsStatus { initial, loading, loaded, error }
enum MovieCreditsStatus { initial, loading, loaded, error }
enum MovieVideosStatus { initial, loading, loaded, error }
enum MovieSimilarStatus { initial, loading, loaded, error }
enum MovieRecommendationsStatus { initial, loading, loaded, error }
enum MovieReviewsStatus { initial, loading, loaded, error }
enum MovieWatchProvidersStatus { initial, loading, loaded, error } // ✅ NEW


@freezed
abstract class MovieState with _$MovieState {
  const factory MovieState({
    @Default(MovieDetailsStatus.initial) MovieDetailsStatus detailsStatus,
    @Default(MovieCreditsStatus.initial) MovieCreditsStatus creditsStatus,
    @Default(MovieVideosStatus.initial) MovieVideosStatus videosStatus,
    @Default(MovieSimilarStatus.initial) MovieSimilarStatus similarStatus,
    @Default(MovieRecommendationsStatus.initial) MovieRecommendationsStatus recommendationsStatus,
    @Default(MovieReviewsStatus.initial) MovieReviewsStatus reviewsStatus,
    @Default(MovieWatchProvidersStatus.initial) MovieWatchProvidersStatus watchProvidersStatus, // ✅ NEW
  
    MovieDetailsEntity? movieDetails,
    CreditsEntity? credits,
    MovieVideosEntity? videos,
    SimilarMoviesResponseEntity? similarMovies,
    RecommendationsEntity? recommendations,
    List<MovieReviewEntity>? reviews,
    MovieWatchProvidersEntity? watchProviders, // ✅ NEW
    String? detailsError,
    String? creditsError,
    String? videosError,
    String? similarError,
    String? recommendationsError,
    String? reviewsError,
    String? watchProvidersError, // ✅ NEW
  }) = _MovieState;
}
