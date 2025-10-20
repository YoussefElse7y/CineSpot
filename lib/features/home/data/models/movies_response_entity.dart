import '../../domain/entities/movies_response_entity.dart';
import 'movie_model.dart';

class MoviesResponseModel extends MoviesResponseEntity {
  const MoviesResponseModel({
    required super.page,
    required super.results,
    required super.totalPages,
    required super.totalResults,
  });

  factory MoviesResponseModel.fromJson(Map<String, dynamic> json) {
    return MoviesResponseModel(
      page: json['page'] ?? 1,
      results: (json['results'] as List<dynamic>?)
              ?.map((e) => MovieModel.fromJson(e))
              .toList() ??
          [],
      totalPages: json['total_pages'] ?? 0,
      totalResults: json['total_results'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'results': results.map((e) => (e as MovieModel).toJson()).toList(),
      'total_pages': totalPages,
      'total_results': totalResults,
    };
  }
}
