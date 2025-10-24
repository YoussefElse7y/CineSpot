// data/models/recommendations_model.dart
import 'package:cine_spot/features/movie/data/models/recommended_movie_model.dart';

import '../../domain/entities/recommendations_entity.dart';

class RecommendationsModel extends RecommendationsEntity {
  const RecommendationsModel({
    required super.page,
    required List<RecommendedMovieModel> super.results,
    required super.totalPages,
    required super.totalResults,
  });

  factory RecommendationsModel.fromJson(Map<String, dynamic> json) {
    final results = (json['results'] as List<dynamic>?)
            ?.map((e) => RecommendedMovieModel.fromJson(e))
            .toList() ??
        [];

    return RecommendationsModel(
      page: json['page'] ?? 1,
      results: results,
      totalPages: json['total_pages'] ?? 0,
      totalResults: json['total_results'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'results': results.map((e) => (e as RecommendedMovieModel).toJson()).toList(),
      'total_pages': totalPages,
      'total_results': totalResults,
    };
  }
}
