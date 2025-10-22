import 'package:cine_spot/features/explore/domain/usecases/multi_search_result.dart';
import 'package:cine_spot/features/explore/domain/usecases/movie_search_result.dart';
import 'package:cine_spot/features/explore/domain/usecases/tv_search_result.dart';
import 'package:cine_spot/features/explore/domain/usecases/person_search_result.dart';
import 'package:cine_spot/features/explore/domain/usecases/company_search_result.dart';
import 'package:cine_spot/features/home/domain/usecases/get_trending_tv_shows.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'explore_event.dart';
import 'explore_state.dart';

class ExploreBloc extends Bloc<ExploreEvent, ExploreState> {
  final MultiSearchResultUseCase multiSearchResultUseCase;
  final MovieSearchResult movieSearchResult;
  final TvSearchResultUseCase tvSearchResultUseCase;
  final PersonSearchResultUseCase personSearchResultUseCase;
  final CompanySearchResultUseCase companySearchResultUseCase;
  final GetTrendingTvShowsUseCase getTrendingTvShowsUseCase;

  ExploreBloc({
    required this.multiSearchResultUseCase,
    required this.movieSearchResult,
    required this.tvSearchResultUseCase,
    required this.personSearchResultUseCase,
    required this.companySearchResultUseCase,
    required this.getTrendingTvShowsUseCase,
  }) : super(const ExploreState.loading()) {
    // Register event handlers
    on<TrendingEvent>(_onTrending);
    on<SearchMultiEvent>(_onSearchMulti);
    on<SearchMoviesEvent>(_onSearchMovies);
    on<SearchTvShowsEvent>(_onSearchTvShows);
    on<SearchPersonEvent>(_onSearchPerson);
    on<SearchCompanyEvent>(_onSearchCompany);
    on<ClearSearchEvent>(_onClearSearch);

    // 🔥 Automatically fetch trending shows when bloc starts
    add(const TrendingEvent());
  }

  // ----------------- HANDLERS -----------------

  Future<void> _onTrending(
    TrendingEvent event,
    Emitter<ExploreState> emit,
  ) async {
    emit(const ExploreState.loading());

    final result = await getTrendingTvShowsUseCase.call(event.language??'en-US');

    result.fold(
      (failure) => emit(ExploreState.error(message: failure.message)),
      (trendingTv) => emit(ExploreState.initial(trendingTv: trendingTv)),
    );
  }

  Future<void> _onSearchMulti(
    SearchMultiEvent event,
    Emitter<ExploreState> emit,
  ) async {
    if (event.query.isEmpty) {
      add(const TrendingEvent()); // Return to trending if query is empty
      return;
    }

    emit(const ExploreState.loading());

    final result = await multiSearchResultUseCase(
      event.query,
      language: event.language,
      page: event.page,
    );

    result.fold(
      (failure) => emit(ExploreState.error(message: failure.message)),
      (searchResponse) =>
          emit(ExploreState.multiSearchLoaded(searchResponse: searchResponse)),
    );
  }

  Future<void> _onSearchMovies(
    SearchMoviesEvent event,
    Emitter<ExploreState> emit,
  ) async {
    if (event.query.isEmpty) {
      add(const TrendingEvent());
      return;
    }

    emit(const ExploreState.loading());

    final result = await movieSearchResult(
      event.query,
      language: event.language,
      page: event.page,
      primaryReleaseYear: event.primaryReleaseYear,
      region: event.region,
      year: event.year,
    );

    result.fold(
      (failure) => emit(ExploreState.error(message: failure.message)),
      (movieSearchResponse) => emit(
        ExploreState.movieSearchLoaded(movieSearchResponse: movieSearchResponse),
      ),
    );
  }

  Future<void> _onSearchTvShows(
    SearchTvShowsEvent event,
    Emitter<ExploreState> emit,
  ) async {
    if (event.query.isEmpty) {
      add(const TrendingEvent());
      return;
    }

    emit(const ExploreState.loading());

    final result = await tvSearchResultUseCase(
      event.query,
      language: event.language,
      page: event.page,
      firstAirDateYear: event.firstAirDateYear,
      year: event.year,
    );

    result.fold(
      (failure) => emit(ExploreState.error(message: failure.message)),
      (tvSearchResponse) =>
          emit(ExploreState.tvShowSearchLoaded(tvSearchResponse: tvSearchResponse)),
    );
  }

  Future<void> _onSearchPerson(
    SearchPersonEvent event,
    Emitter<ExploreState> emit,
  ) async {
    if (event.query.isEmpty) {
      add(const TrendingEvent());
      return;
    }

    emit(const ExploreState.loading());

    final result = await personSearchResultUseCase(
      event.query,
      language: event.language,
      page: event.page,
    );

    result.fold(
      (failure) => emit(ExploreState.error(message: failure.message)),
      (personSearchResponse) => emit(
        ExploreState.personSearchLoaded(personSearchResponse: personSearchResponse),
      ),
    );
  }

  Future<void> _onSearchCompany(
    SearchCompanyEvent event,
    Emitter<ExploreState> emit,
  ) async {
    if (event.query.isEmpty) {
      add(const TrendingEvent());
      return;
    }

    emit(const ExploreState.loading());

    final result = await companySearchResultUseCase(
      event.query,
      page: event.page,
    );

    result.fold(
      (failure) => emit(ExploreState.error(message: failure.message)),
      (companySearchResponse) => emit(
        ExploreState.companySearchLoaded(companySearchResponse: companySearchResponse),
      ),
    );
  }

  void _onClearSearch(
    ClearSearchEvent event,
    Emitter<ExploreState> emit,
  ) {
    // Instead of just initial, load trending again
    add(const TrendingEvent());
  }
}
