import 'company_search_result_entity.dart';

class CompanySearchResponseEntity {
  final int page;
  final List<CompanySearchResultEntity> results;
  final int totalPages;
  final int totalResults;

  const CompanySearchResponseEntity({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });
}
