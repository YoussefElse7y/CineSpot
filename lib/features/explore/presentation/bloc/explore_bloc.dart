import 'package:cine_spot/features/explore/domain/usecases/multi_search_result.dart';
import 'package:cine_spot/features/explore/domain/usecases/movie_search_result.dart';
import 'package:cine_spot/features/explore/domain/usecases/tv_search_result.dart';
import 'package:cine_spot/features/explore/domain/usecases/person_search_result.dart';
import 'package:cine_spot/features/explore/domain/usecases/company_search_result.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'explore_event.dart';
import 'explore_state.dart';

class ExploreBloc extends Bloc<ExploreEvent, ExploreState> {
  final MultiSearchResultUseCase multiSearchResultUseCase;
  final MovieSearchResult movieSearchResult;
  final TvSearchResultUseCase tvSearchResultUseCase;
  final PersonSearchResultUseCase personSearchResultUseCase;
  final CompanySearchResultUseCase companySearchResultUseCase;

  ExploreBloc({
    required this.multiSearchResultUseCase,
    required this.movieSearchResult,
    required this.tvSearchResultUseCase,
    required this.personSearchResultUseCase,
    required this.companySearchResultUseCase,
  }) : super(const ExploreState.initial()) {
    on<SearchMultiEvent>(_onSearchMulti);
    on<SearchMoviesEvent>(_onSearchMovies);
    on<SearchTvShowsEvent>(_onSearchTvShows);
    on<SearchPersonEvent>(_onSearchPerson);
    on<SearchCompanyEvent>(_onSearchCompany);
    on<ClearSearchEvent>(_onClearSearch);
  }

  Future<void> _onSearchMulti(
    SearchMultiEvent event,
    Emitter<ExploreState> emit,
  ) async {
    if (event.query.isEmpty) {
      emit(const ExploreState.initial());
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
      (searchResponse) => emit(
        ExploreState.multiSearchLoaded(searchResponse: searchResponse),
      ),
    );
  }

  Future<void> _onSearchMovies(
    SearchMoviesEvent event,
    Emitter<ExploreState> emit,
  ) async {
    if (event.query.isEmpty) {
      emit(const ExploreState.initial());
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
      emit(const ExploreState.initial());
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
      (tvSearchResponse) => emit(
        ExploreState.tvShowSearchLoaded(tvSearchResponse: tvSearchResponse),
      ),
    );
  }

  Future<void> _onSearchPerson(
    SearchPersonEvent event,
    Emitter<ExploreState> emit,
  ) async {
    if (event.query.isEmpty) {
      emit(const ExploreState.initial());
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
      emit(const ExploreState.initial());
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
    emit(const ExploreState.initial());
  }
}