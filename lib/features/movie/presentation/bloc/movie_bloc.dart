import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/movie_details_entity.dart';
import '../../domain/entities/credits_entity.dart';
import '../../domain/entities/movie_videos_entity.dart';
import '../../domain/entities/similar_movies_response_entity.dart';
import '../../domain/entities/recommendations_entity.dart';
import '../../domain/entities/movie_review_entity.dart';
import '../../domain/usecases/get_movie_details.dart';
import '../../domain/usecases/get_credits_usecase.dart';
import '../../domain/usecases/get_movie_videos_usecase.dart';
import '../../domain/usecases/get_similar_movies_usecase.dart';
import '../../domain/usecases/get_recommendations_usecase.dart';
import '../../domain/usecases/get_movie_reviews_usecase.dart';

part 'movie_bloc.freezed.dart';
part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetCreditsUseCase getCreditsUseCase;
  final GetMovieVideosUseCase getMovieVideosUseCase;
  final GetSimilarMoviesUseCase getSimilarMoviesUseCase;
  final GetRecommendationsUseCase getRecommendationsUseCase;
  final GetMovieReviewsUseCase getMovieReviewsUseCase;

  MovieBloc({
    required this.getMovieDetailsUseCase,
    required this.getCreditsUseCase,
    required this.getMovieVideosUseCase,
    required this.getSimilarMoviesUseCase,
    required this.getRecommendationsUseCase,
    required this.getMovieReviewsUseCase,
  }) : super(const MovieState()) {
    on<MovieEvent>((event, emit) async {
      await event.when(
        loadMovieDetails: (movieId, language) =>
            _onLoadMovieDetails(movieId, language, emit),
        loadCredits: (movieId, language) =>
            _onLoadCredits(movieId, language, emit),
        loadVideos: (movieId, language) =>
            _onLoadVideos(movieId, language, emit),
        loadSimilarMovies: (movieId, language, page) =>
            _onLoadSimilarMovies(movieId, language, page, emit),
        loadRecommendations: (movieId, language, page) =>
            _onLoadRecommendations(movieId, language, page, emit),
        loadReviews: (movieId, language, page) =>
            _onLoadReviews(movieId, language, page, emit),
        resetMovie: () => _onResetMovie(emit),
      );
    });
  }

  Future<void> _onLoadMovieDetails(
    int movieId,
    String? language,
    Emitter<MovieState> emit,
  ) async {
    emit(state.copyWith(detailsStatus: MovieDetailsStatus.loading));
    
    final result = await getMovieDetailsUseCase.execute(movieId, language: language);
    
    result.fold(
      (failure) => emit(state.copyWith(
        detailsStatus: MovieDetailsStatus.error,
        detailsError: failure.toString(),
      )),
      (details) => emit(state.copyWith(
        detailsStatus: MovieDetailsStatus.loaded,
        movieDetails: details,
      )),
    );
  }

  Future<void> _onLoadCredits(
    int movieId,
    String? language,
    Emitter<MovieState> emit,
  ) async {
    emit(state.copyWith(creditsStatus: MovieCreditsStatus.loading));
    
    final result = await getCreditsUseCase.execute(movieId, language: language);
    
    result.fold(
      (failure) => emit(state.copyWith(
        creditsStatus: MovieCreditsStatus.error,
        creditsError: failure.toString(),
      )),
      (credits) => emit(state.copyWith(
        creditsStatus: MovieCreditsStatus.loaded,
        credits: credits,
      )),
    );
  }

  Future<void> _onLoadVideos(
    int movieId,
    String? language,
    Emitter<MovieState> emit,
  ) async {
    emit(state.copyWith(videosStatus: MovieVideosStatus.loading));
    
    final result = await getMovieVideosUseCase.execute(movieId, language: language);
    
    result.fold(
      (failure) => emit(state.copyWith(
        videosStatus: MovieVideosStatus.error,
        videosError: failure.toString(),
      )),
      (videos) => emit(state.copyWith(
        videosStatus: MovieVideosStatus.loaded,
        videos: videos,
      )),
    );
  }

  Future<void> _onLoadSimilarMovies(
    int movieId,
    String? language,
    int? page,
    Emitter<MovieState> emit,
  ) async {
    emit(state.copyWith(similarStatus: MovieSimilarStatus.loading));
    
    final result = await getSimilarMoviesUseCase.execute(
      movieId,
      language: language,
      page: page,
    );
    
    result.fold(
      (failure) => emit(state.copyWith(
        similarStatus: MovieSimilarStatus.error,
        similarError: failure.toString(),
      )),
      (similar) => emit(state.copyWith(
        similarStatus: MovieSimilarStatus.loaded,
        similarMovies: similar,
      )),
    );
  }

  Future<void> _onLoadRecommendations(
    int movieId,
    String? language,
    int? page,
    Emitter<MovieState> emit,
  ) async {
    emit(state.copyWith(recommendationsStatus: MovieRecommendationsStatus.loading));
    
    final result = await getRecommendationsUseCase.execute(
      movieId,
      language: language,
      page: page,
    );
    
    result.fold(
      (failure) => emit(state.copyWith(
        recommendationsStatus: MovieRecommendationsStatus.error,
        recommendationsError: failure.toString(),
      )),
      (recommendations) => emit(state.copyWith(
        recommendationsStatus: MovieRecommendationsStatus.loaded,
        recommendations: recommendations,
      )),
    );
  }

  Future<void> _onLoadReviews(
    int movieId,
    String? language,
    int? page,
    Emitter<MovieState> emit,
  ) async {
    emit(state.copyWith(reviewsStatus: MovieReviewsStatus.loading));
    
    final result = await getMovieReviewsUseCase.execute(
      movieId,
      language: language,
      page: page,
    );
    
    result.fold(
      (failure) => emit(state.copyWith(
        reviewsStatus: MovieReviewsStatus.error,
        reviewsError: failure.toString(),
      )),
      (reviews) => emit(state.copyWith(
        reviewsStatus: MovieReviewsStatus.loaded,
        reviews: reviews,
      )),
    );
  }

  Future<void> _onResetMovie(Emitter<MovieState> emit) async {
    emit(const MovieState());
  }
}