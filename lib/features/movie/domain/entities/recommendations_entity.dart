
import 'package:cine_spot/features/movie/domain/entities/recommended_movie_entity.dart';

class RecommendationsEntity {
  final int page;
  final List<RecommendedMovieEntity> results;
  final int totalPages;
  final int totalResults;

  const RecommendationsEntity({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });
}
