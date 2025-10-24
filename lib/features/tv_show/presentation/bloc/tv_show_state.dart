// lib/features/tv_show/presentation/bloc/tv_show_state.dart
part of 'tv_show_bloc.dart';

enum TvShowDetailsStatus { initial, loading, loaded, error }
enum TvShowCreditsStatus { initial, loading, loaded, error }
enum TvShowVideosStatus { initial, loading, loaded, error }
enum TvShowRecommendationsStatus { initial, loading, loaded, error }
enum TvShowReviewsStatus { initial, loading, loaded, error }
enum SeasonDetailsStatus { initial, loading, loaded, error }
enum SeasonCreditsStatus { initial, loading, loaded, error }
enum SeasonVideosStatus { initial, loading, loaded, error }
enum EpisodeDetailsStatus { initial, loading, loaded, error }
enum EpisodeCreditsStatus { initial, loading, loaded, error }
enum EpisodeVideosStatus { initial, loading, loaded, error }

@freezed
abstract class TvShowState with _$TvShowState {
  const factory TvShowState({
    // TV Show
    @Default(TvShowDetailsStatus.initial) TvShowDetailsStatus detailsStatus,
    @Default(TvShowCreditsStatus.initial) TvShowCreditsStatus creditsStatus,
    @Default(TvShowVideosStatus.initial) TvShowVideosStatus videosStatus,
    @Default(TvShowRecommendationsStatus.initial) TvShowRecommendationsStatus recommendationsStatus,
    @Default(TvShowReviewsStatus.initial) TvShowReviewsStatus reviewsStatus,
    TvShowDetailsEntity? tvShowDetails,
    TvShowCreditsEntity? tvShowCredits,
    List<TvShowVideoResultEntity>? tvShowVideos,
    TvShowRecommendationsEntity? tvShowRecommendations,
    TvShowReviewEntity? tvShowReviews,
    String? detailsError,
    String? creditsError,
    String? videosError,
    String? recommendationsError,
    String? reviewsError,
    
    // Season
    @Default(SeasonDetailsStatus.initial) SeasonDetailsStatus seasonDetailsStatus,
    @Default(SeasonCreditsStatus.initial) SeasonCreditsStatus seasonCreditsStatus,
    @Default(SeasonVideosStatus.initial) SeasonVideosStatus seasonVideosStatus,
    TvSeasonDetailsEntity? seasonDetails,
    TvSeasonCreditsEntity? seasonCredits,
    List<TvSeasonVideoItemEntity>? seasonVideos,
    String? seasonDetailsError,
    String? seasonCreditsError,
    String? seasonVideosError,
    
    // Episode
    @Default(EpisodeDetailsStatus.initial) EpisodeDetailsStatus episodeDetailsStatus,
    @Default(EpisodeCreditsStatus.initial) EpisodeCreditsStatus episodeCreditsStatus,
    @Default(EpisodeVideosStatus.initial) EpisodeVideosStatus episodeVideosStatus,
    TvEpisodeDetailsEntity? episodeDetails,
    TvEpisodeCreditsEntity? episodeCredits,
    List<TvEpisodeVideoItemEntity>? episodeVideos,
    String? episodeDetailsError,
    String? episodeCreditsError,
    String? episodeVideosError,
  }) = _TvShowState;
}