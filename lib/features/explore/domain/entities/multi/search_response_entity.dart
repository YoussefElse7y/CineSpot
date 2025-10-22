import 'search_result_entity.dart';

class SearchResponseEntity {
  final int page;
  final List<SearchResultEntity> results;
  final int totalPages;
  final int totalResults;

  const SearchResponseEntity({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });
}
