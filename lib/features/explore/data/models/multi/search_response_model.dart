import 'package:cine_spot/features/explore/domain/entities/multi/search_response_entity.dart';

import 'search_result_model.dart';

class SearchResponseModel extends SearchResponseEntity {
  const SearchResponseModel({
    required super.page,
    required List<SearchResultModel> super.results,
    required super.totalPages,
    required super.totalResults,
  });

  factory SearchResponseModel.fromJson(Map<String, dynamic> json) {
    return SearchResponseModel(
      page: json['page'] ?? 1,
      results: (json['results'] as List?)
              ?.map((e) => SearchResultModel.fromJson(e))
              .toList() ??
          [],
      totalPages: json['total_pages'] ?? 0,
      totalResults: json['total_results'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'results': results.map((e) => (e as SearchResultModel).toJson()).toList(),
      'total_pages': totalPages,
      'total_results': totalResults,
    };
  }
}
