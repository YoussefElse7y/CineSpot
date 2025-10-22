import 'movie_search_result_entity.dart';

class MovieSearchResponseEntity {
  final int page;
  final List<MovieSearchResultEntity> results;
  final int totalPages;
  final int totalResults;

  const MovieSearchResponseEntity({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });
}
