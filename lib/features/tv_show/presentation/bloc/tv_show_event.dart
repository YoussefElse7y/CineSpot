// lib/features/tv_show/presentation/bloc/tv_show_event.dart
part of 'tv_show_bloc.dart';

@freezed
abstract class TvShowEvent with _$TvShowEvent {
  // TV Show Events
  const factory TvShowEvent.loadTvShowDetails(int seriesId, {String? language}) = LoadTvShowDetails;
  const factory TvShowEvent.loadTvShowCredits(int seriesId, {String? language}) = LoadTvShowCredits;
  const factory TvShowEvent.loadTvShowVideos(int seriesId, {String? language}) = LoadTvShowVideos;
  const factory TvShowEvent.loadTvShowRecommendations(int seriesId, {String? language, int? page}) = LoadTvShowRecommendations;
  const factory TvShowEvent.loadTvShowReviews(int seriesId, {String? language, int? page}) = LoadTvShowReviews;
  
  // Season Events
  const factory TvShowEvent.loadSeasonDetails(int seriesId, int seasonNumber, {String? language}) = LoadSeasonDetails;
  const factory TvShowEvent.loadSeasonCredits(int seriesId, int seasonNumber, {String? language}) = LoadSeasonCredits;
  const factory TvShowEvent.loadSeasonVideos(int seriesId, int seasonNumber, {String? language}) = LoadSeasonVideos;
  
  // Episode Events
  const factory TvShowEvent.loadEpisodeDetails(int seriesId, int seasonNumber, int episodeNumber, {String? language}) = LoadEpisodeDetails;
  const factory TvShowEvent.loadEpisodeCredits(int seriesId, int seasonNumber, int episodeNumber, {String? language}) = LoadEpisodeCredits;
  const factory TvShowEvent.loadEpisodeVideos(int seriesId, int seasonNumber, int episodeNumber, {String? language}) = LoadEpisodeVideos;
  
  const factory TvShowEvent.resetTvShow() = ResetTvShow;
}