import 'package:cine_spot/features/explore/domain/entities/company/company_search_response_entity.dart';

import 'company_search_result_model.dart';

class CompanySearchResponseModel extends CompanySearchResponseEntity {
  const CompanySearchResponseModel({
    required super.page,
    required List<CompanySearchResultModel> super.results,
    required super.totalPages,
    required super.totalResults,
  });

  factory CompanySearchResponseModel.fromJson(Map<String, dynamic> json) {
    return CompanySearchResponseModel(
      page: json['page'] ?? 1,
      results: (json['results'] as List?)
              ?.map((e) => CompanySearchResultModel.fromJson(e))
              .toList() ??
          [],
      totalPages: json['total_pages'] ?? 0,
      totalResults: json['total_results'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'results': results.map((e) => (e as CompanySearchResultModel).toJson()).toList(),
      'total_pages': totalPages,
      'total_results': totalResults,
    };
  }
}
