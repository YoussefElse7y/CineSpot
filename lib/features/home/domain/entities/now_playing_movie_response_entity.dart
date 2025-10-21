import 'package:cine_spot/features/home/domain/entities/now_playing_movie_entity.dart';

class NowPlayingMoviesResponseEntity {
    final DatesEntity dates;
  final int page;
  final List<NowPlayingMovieEntity> results;
  final int totalPages;
  final int totalResults;

  const NowPlayingMoviesResponseEntity({
    required this.dates,
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });
}

class DatesEntity {
  final String maximum;
  final String minimum;

  const DatesEntity({
    required this.maximum,
    required this.minimum,
  });
}