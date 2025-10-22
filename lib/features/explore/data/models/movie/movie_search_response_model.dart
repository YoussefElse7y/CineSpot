import 'package:cine_spot/features/explore/domain/entities/movie/movie_search_response_entity.dart';

import 'movie_search_result_model.dart';

class MovieSearchResponseModel extends MovieSearchResponseEntity {
  const MovieSearchResponseModel({
    required super.page,
    required List<MovieSearchResultModel> super.results,
    required super.totalPages,
    required super.totalResults,
  });

  factory MovieSearchResponseModel.fromJson(Map<String, dynamic> json) {
    return MovieSearchResponseModel(
      page: json['page'] ?? 1,
      results: (json['results'] as List?)
              ?.map((e) => MovieSearchResultModel.fromJson(e))
              .toList() ??
          [],
      totalPages: json['total_pages'] ?? 0,
      totalResults: json['total_results'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'results': results.map((e) => (e as MovieSearchResultModel).toJson()).toList(),
      'total_pages': totalPages,
      'total_results': totalResults,
    };
  }
}
