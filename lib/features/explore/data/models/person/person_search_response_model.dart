import 'package:cine_spot/features/explore/data/models/person/person_search_model.dart';

import '../../../domain/entities/person/person_search_response_entity.dart';

class PersonSearchResponseModel extends PersonSearchResponseEntity {
  const PersonSearchResponseModel({
    required super.page,
    required List<PersonSearchModel> super.results,
    required super.totalPages,
    required super.totalResults,
  });

  factory PersonSearchResponseModel.fromJson(Map<String, dynamic> json) {
    return PersonSearchResponseModel(
      page: json['page'] ?? 1,
      results: (json['results'] as List<dynamic>?)
              ?.map((e) => PersonSearchModel.fromJson(e))
              .toList() ??
          [],
      totalPages: json['total_pages'] ?? 1,
      totalResults: json['total_results'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'results': results.map((e) => (e as PersonSearchModel).toJson()).toList(),
      'total_pages': totalPages,
      'total_results': totalResults,
    };
  }
}
