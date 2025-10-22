import 'package:freezed_annotation/freezed_annotation.dart';

part 'explore_event.freezed.dart';

@freezed
class ExploreEvent with _$ExploreEvent {
  const factory ExploreEvent.searchMulti({
    required String query,
    String? language,
    int? page,
  }) = SearchMultiEvent;

  const factory ExploreEvent.searchMovies({
    required String query,
    String? language,
    int? page,
    String? primaryReleaseYear,
    String? region,
    String? year,
  }) = SearchMoviesEvent;

  const factory ExploreEvent.searchTvShows({
    required String query,
    String? language,
    int? page,
    String? firstAirDateYear,
    int? year,
  }) = SearchTvShowsEvent;

  const factory ExploreEvent.searchPerson({
    required String query,
    String? language,
    int? page,
  }) = SearchPersonEvent;

  const factory ExploreEvent.searchCompany({
    required String query,
    int? page,
  }) = SearchCompanyEvent;

  const factory ExploreEvent.clearSearch() = ClearSearchEvent;
}