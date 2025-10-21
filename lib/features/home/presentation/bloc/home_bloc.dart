import 'package:cine_spot/features/home/domain/entities/movies_response_entity.dart';
import 'package:cine_spot/features/home/domain/entities/now_playing_movie_entity.dart';
import 'package:cine_spot/features/home/domain/entities/trending_tv_show_entity.dart';
import 'package:cine_spot/features/home/domain/usecases/get_playing_now_movies.dart';
import 'package:cine_spot/features/home/domain/usecases/get_top_ten_movies_tihs_week.dart';
import 'package:cine_spot/features/home/domain/usecases/get_trending_tv_shows.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetTopTenMoviesTihsWeekUseCase _getTopTenMoviesTihsWeekUseCase;
  final GetPlayingNowMoviesUseCase _getPlayingNowMoviesUseCase;
  final GetTrendingTvShowsUseCase _getTrendingTvShowsUseCase;

  HomeBloc(
    this._getTopTenMoviesTihsWeekUseCase,
    this._getPlayingNowMoviesUseCase,
    this._getTrendingTvShowsUseCase,
  ) : super(HomeState.initial()) {
    on<_GetTopTenMovies>(_onGetTopTenMovies);
    on<_GetNowPlayingMovies>(_onGetNowPlayingMovies);
    on<_GetTrendingTvShows>(_onGetTrendingTvShows);
  }

   Future<void> _onGetTrendingTvShows(
    _GetTrendingTvShows event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(isLoadingTrendingTvShows: true));
    final result = await _getTrendingTvShowsUseCase(event.language);
    result.fold(
      (failure) {
        emit(state.copyWith(
          isLoadingTopMovies: false,
          isLoadingNowPlaying: false,
          errorMessage: failure.message,
        ));
      },
      (moviesResponse) {
        emit(state.copyWith(
          isLoadingTopMovies: false,
          isLoadingNowPlaying: false,
          trendingTvShows: moviesResponse.results,
        ));
      },
    );
  }
  

  Future<void> _onGetTopTenMovies(
    _GetTopTenMovies event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(isLoadingTopMovies: true));

    final result = await _getTopTenMoviesTihsWeekUseCase(event.language);
    result.fold(
      (failure) {
        emit(state.copyWith(
          isLoadingTopMovies: false,
          isLoadingTrendingTvShows: false,
          errorMessage: failure.message,
        ));
      },
      (moviesResponse) {
        emit(state.copyWith(
          isLoadingTopMovies: false,
          isLoadingTrendingTvShows: false,
          topMovies: moviesResponse,
        ));
      },
    );
  }

  Future<void> _onGetNowPlayingMovies(
    _GetNowPlayingMovies event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(isLoadingNowPlaying: true));

    final result =
        await _getPlayingNowMoviesUseCase(event.language, event.page);
    result.fold(
      (failure) {
        emit(state.copyWith(
          isLoadingNowPlaying: false,
          isLoadingTrendingTvShows: false,
          errorMessage: failure.message,
        ));
      },
      (moviesResponse) {
        emit(state.copyWith(
          isLoadingNowPlaying: false,
          isLoadingTrendingTvShows: false,
          nowPlayingMovies: moviesResponse.results,
        ));
      },
    );
  }
}
