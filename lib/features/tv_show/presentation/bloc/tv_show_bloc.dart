// lib/features/tv_show/presentation/bloc/tv_show_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/tv_show_details_entity.dart';
import '../../domain/entities/tv_show_credits_entity.dart';
import '../../domain/entities/tv_show_videos_entity.dart';
import '../../domain/entities/tv_show_recommendations_entity.dart';
import '../../domain/entities/tv_show_review_entity.dart';
import '../../domain/entities/tv_season_details_entity.dart';
import '../../domain/entities/tv_season_credits_entity.dart';
import '../../domain/entities/tv_season_videos_entity.dart';
import '../../domain/entities/tv_episode_details_entity.dart';
import '../../domain/entities/tv_episode_credits_entity.dart';
import '../../domain/entities/tv_episode_videos_entity.dart';
import '../../domain/usecases/get_tv_show_details_usecase.dart';
import '../../domain/usecases/get_tv_show_credits_usecase.dart';
import '../../domain/usecases/get_tv_show_videos_usecase.dart';
import '../../domain/usecases/get_tv_show_recommendations_usecase.dart';
import '../../domain/usecases/get_tv_show_reviews_usecase.dart';
import '../../domain/usecases/get_season_details_usecase.dart';
import '../../domain/usecases/get_season_credits_usecase.dart';
import '../../domain/usecases/get_season_videos_usecase.dart';
import '../../domain/usecases/get_episode_details_usecase.dart';
import '../../domain/usecases/get_episode_credits_usecase.dart';
import '../../domain/usecases/get_episode_videos_usecase.dart';

part 'tv_show_bloc.freezed.dart';
part 'tv_show_event.dart';
part 'tv_show_state.dart';

class TvShowBloc extends Bloc<TvShowEvent, TvShowState> {
  final GetTvShowDetailsUseCase getTvShowDetailsUseCase;
  final GetTvShowCreditsUseCase getTvShowCreditsUseCase;
  final GetTvShowVideosUseCase getTvShowVideosUseCase;
  final GetTvShowRecommendationsUseCase getTvShowRecommendationsUseCase;
  final GetTvShowReviewsUseCase getTvShowReviewsUseCase;
  final GetSeasonDetailsUseCase getSeasonDetailsUseCase;
  final GetSeasonCreditsUseCase getSeasonCreditsUseCase;
  final GetSeasonVideosUseCase getSeasonVideosUseCase;
  final GetEpisodeDetailsUseCase getEpisodeDetailsUseCase;
  final GetEpisodeCreditsUseCase getEpisodeCreditsUseCase;
  final GetEpisodeVideosUseCase getEpisodeVideosUseCase;

  TvShowBloc({
    required this.getTvShowDetailsUseCase,
    required this.getTvShowCreditsUseCase,
    required this.getTvShowVideosUseCase,
    required this.getTvShowRecommendationsUseCase,
    required this.getTvShowReviewsUseCase,
    required this.getSeasonDetailsUseCase,
    required this.getSeasonCreditsUseCase,
    required this.getSeasonVideosUseCase,
    required this.getEpisodeDetailsUseCase,
    required this.getEpisodeCreditsUseCase,
    required this.getEpisodeVideosUseCase,
  }) : super(const TvShowState()) {
    on<TvShowEvent>((event, emit) async {
      await event.when(
        loadTvShowDetails: (seriesId, language) =>
            _onLoadTvShowDetails(seriesId, language, emit),
        loadTvShowCredits: (seriesId, language) =>
            _onLoadTvShowCredits(seriesId, language, emit),
        loadTvShowVideos: (seriesId, language) =>
            _onLoadTvShowVideos(seriesId, language, emit),
        loadTvShowRecommendations: (seriesId, language, page) =>
            _onLoadTvShowRecommendations(seriesId, language, page, emit),
        loadTvShowReviews: (seriesId, language, page) =>
            _onLoadTvShowReviews(seriesId, language, page, emit),
        loadSeasonDetails: (seriesId, seasonNumber, language) =>
            _onLoadSeasonDetails(seriesId, seasonNumber, language, emit),
        loadSeasonCredits: (seriesId, seasonNumber, language) =>
            _onLoadSeasonCredits(seriesId, seasonNumber, language, emit),
        loadSeasonVideos: (seriesId, seasonNumber, language) =>
            _onLoadSeasonVideos(seriesId, seasonNumber, language, emit),
        loadEpisodeDetails: (seriesId, seasonNumber, episodeNumber, language) =>
            _onLoadEpisodeDetails(seriesId, seasonNumber, episodeNumber, language, emit),
        loadEpisodeCredits: (seriesId, seasonNumber, episodeNumber, language) =>
            _onLoadEpisodeCredits(seriesId, seasonNumber, episodeNumber, language, emit),
        loadEpisodeVideos: (seriesId, seasonNumber, episodeNumber, language) =>
            _onLoadEpisodeVideos(seriesId, seasonNumber, episodeNumber, language, emit),
        resetTvShow: () => _onResetTvShow(emit),
      );
    });
  }

  Future<void> _onLoadTvShowDetails(
    int seriesId,
    String? language,
    Emitter<TvShowState> emit,
  ) async {
    emit(state.copyWith(detailsStatus: TvShowDetailsStatus.loading));
    
    final result = await getTvShowDetailsUseCase(seriesId, language: language);
    
    result.fold(
      (failure) => emit(state.copyWith(
        detailsStatus: TvShowDetailsStatus.error,
        detailsError: failure.toString(),
      )),
      (details) => emit(state.copyWith(
        detailsStatus: TvShowDetailsStatus.loaded,
        tvShowDetails: details,
      )),
    );
  }

  Future<void> _onLoadTvShowCredits(
    int seriesId,
    String? language,
    Emitter<TvShowState> emit,
  ) async {
    emit(state.copyWith(creditsStatus: TvShowCreditsStatus.loading));
    
    final result = await getTvShowCreditsUseCase(seriesId, language: language);
    
    result.fold(
      (failure) => emit(state.copyWith(
        creditsStatus: TvShowCreditsStatus.error,
        creditsError: failure.toString(),
      )),
      (credits) => emit(state.copyWith(
        creditsStatus: TvShowCreditsStatus.loaded,
        tvShowCredits: credits,
      )),
    );
  }

  Future<void> _onLoadTvShowVideos(
    int seriesId,
    String? language,
    Emitter<TvShowState> emit,
  ) async {
    emit(state.copyWith(videosStatus: TvShowVideosStatus.loading));
    
    final result = await getTvShowVideosUseCase(seriesId, language: language);
    
    result.fold(
      (failure) => emit(state.copyWith(
        videosStatus: TvShowVideosStatus.error,
        videosError: failure.toString(),
      )),
      (videos) => emit(state.copyWith(
        videosStatus: TvShowVideosStatus.loaded,
        tvShowVideos: videos,
      )),
    );
  }

  Future<void> _onLoadTvShowRecommendations(
    int seriesId,
    String? language,
    int? page,
    Emitter<TvShowState> emit,
  ) async {
    emit(state.copyWith(recommendationsStatus: TvShowRecommendationsStatus.loading));
    
    final result = await getTvShowRecommendationsUseCase(
      seriesId,
      language: language,
      page: page ?? 1,
    );
    
    result.fold(
      (failure) => emit(state.copyWith(
        recommendationsStatus: TvShowRecommendationsStatus.error,
        recommendationsError: failure.toString(),
      )),
      (recommendations) => emit(state.copyWith(
        recommendationsStatus: TvShowRecommendationsStatus.loaded,
        tvShowRecommendations: recommendations,
      )),
    );
  }

  Future<void> _onLoadTvShowReviews(
    int seriesId,
    String? language,
    int? page,
    Emitter<TvShowState> emit,
  ) async {
    emit(state.copyWith(reviewsStatus: TvShowReviewsStatus.loading));
    
    final result = await getTvShowReviewsUseCase(
      seriesId,
      language: language,
      page: page ?? 1,
    );
    
    result.fold(
      (failure) => emit(state.copyWith(
        reviewsStatus: TvShowReviewsStatus.error,
        reviewsError: failure.toString(),
      )),
      (reviews) => emit(state.copyWith(
        reviewsStatus: TvShowReviewsStatus.loaded,
        tvShowReviews: reviews,
      )),
    );
  }

  Future<void> _onLoadSeasonDetails(
    int seriesId,
    int seasonNumber,
    String? language,
    Emitter<TvShowState> emit,
  ) async {
    emit(state.copyWith(seasonDetailsStatus: SeasonDetailsStatus.loading));
    
    final result = await getSeasonDetailsUseCase(
      seriesId,
      seasonNumber,
      language: language,
    );
    
    result.fold(
      (failure) => emit(state.copyWith(
        seasonDetailsStatus: SeasonDetailsStatus.error,
        seasonDetailsError: failure.toString(),
      )),
      (details) => emit(state.copyWith(
        seasonDetailsStatus: SeasonDetailsStatus.loaded,
        seasonDetails: details,
      )),
    );
  }

  Future<void> _onLoadSeasonCredits(
    int seriesId,
    int seasonNumber,
    String? language,
    Emitter<TvShowState> emit,
  ) async {
    emit(state.copyWith(seasonCreditsStatus: SeasonCreditsStatus.loading));
    
    final result = await getSeasonCreditsUseCase(
      seriesId,
      seasonNumber,
      language: language,
    );
    
    result.fold(
      (failure) => emit(state.copyWith(
        seasonCreditsStatus: SeasonCreditsStatus.error,
        seasonCreditsError: failure.toString(),
      )),
      (credits) => emit(state.copyWith(
        seasonCreditsStatus: SeasonCreditsStatus.loaded,
        seasonCredits: credits,
      )),
    );
  }

  Future<void> _onLoadSeasonVideos(
    int seriesId,
    int seasonNumber,
    String? language,
    Emitter<TvShowState> emit,
  ) async {
    emit(state.copyWith(seasonVideosStatus: SeasonVideosStatus.loading));
    
    final result = await getSeasonVideosUseCase(
      seriesId,
      seasonNumber,
      language: language,
    );
    
    result.fold(
      (failure) => emit(state.copyWith(
        seasonVideosStatus: SeasonVideosStatus.error,
        seasonVideosError: failure.toString(),
      )),
      (videos) => emit(state.copyWith(
        seasonVideosStatus: SeasonVideosStatus.loaded,
        seasonVideos: videos,
      )),
    );
  }

  Future<void> _onLoadEpisodeDetails(
    int seriesId,
    int seasonNumber,
    int episodeNumber,
    String? language,
    Emitter<TvShowState> emit,
  ) async {
    emit(state.copyWith(episodeDetailsStatus: EpisodeDetailsStatus.loading));
    
    final result = await getEpisodeDetailsUseCase(
      seriesId,
      seasonNumber,
      episodeNumber,
      language: language,
    );
    
    result.fold(
      (failure) => emit(state.copyWith(
        episodeDetailsStatus: EpisodeDetailsStatus.error,
        episodeDetailsError: failure.toString(),
      )),
      (details) => emit(state.copyWith(
        episodeDetailsStatus: EpisodeDetailsStatus.loaded,
        episodeDetails: details,
      )),
    );
  }

  Future<void> _onLoadEpisodeCredits(
    int seriesId,
    int seasonNumber,
    int episodeNumber,
    String? language,
    Emitter<TvShowState> emit,
  ) async {
    emit(state.copyWith(episodeCreditsStatus: EpisodeCreditsStatus.loading));
    
    final result = await getEpisodeCreditsUseCase(
      seriesId,
      seasonNumber,
      episodeNumber,
      language: language,
    );
    
    result.fold(
      (failure) => emit(state.copyWith(
        episodeCreditsStatus: EpisodeCreditsStatus.error,
        episodeCreditsError: failure.toString(),
      )),
      (credits) => emit(state.copyWith(
        episodeCreditsStatus: EpisodeCreditsStatus.loaded,
        episodeCredits: credits,
      )),
    );
  }

  Future<void> _onLoadEpisodeVideos(
    int seriesId,
    int seasonNumber,
    int episodeNumber,
    String? language,
    Emitter<TvShowState> emit,
  ) async {
    emit(state.copyWith(episodeVideosStatus: EpisodeVideosStatus.loading));
    
    final result = await getEpisodeVideosUseCase(
      seriesId,
      seasonNumber,
      episodeNumber,
      language: language,
    );
    
    result.fold(
      (failure) => emit(state.copyWith(
        episodeVideosStatus: EpisodeVideosStatus.error,
        episodeVideosError: failure.toString(),
      )),
      (videos) => emit(state.copyWith(
        episodeVideosStatus: EpisodeVideosStatus.loaded,
        episodeVideos: videos,
      )),
    );
  }

  Future<void> _onResetTvShow(Emitter<TvShowState> emit) async {
    emit(const TvShowState());
  }
}