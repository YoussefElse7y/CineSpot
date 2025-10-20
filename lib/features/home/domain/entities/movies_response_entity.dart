import 'movie_entity.dart';

class MoviesResponseEntity {
  final int page;
  final List<MovieEntity> results;
  final int totalPages;
  final int totalResults;

  const MoviesResponseEntity({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });
}
