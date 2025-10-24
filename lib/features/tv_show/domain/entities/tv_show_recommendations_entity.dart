import 'package:equatable/equatable.dart';

class TvShowRecommendationsEntity extends Equatable {
  final int page;
  final List<dynamic> results;
  final int totalPages;
  final int totalResults;

  const TvShowRecommendationsEntity({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  @override
  List<Object?> get props => [page, results, totalPages, totalResults];
}

class TvShowRecommendationItemEntity extends Equatable {
  final bool adult;
  final String? backdropPath;
  final int id;
  final String name;
  final String originalLanguage;
  final String originalName;
  final String overview;
  final String? posterPath;
  final String mediaType;
  final List<int> genreIds;
  final double popularity;
  final String? firstAirDate;
  final double voteAverage;
  final int voteCount;
  final List<String> originCountry;

  const TvShowRecommendationItemEntity({
    required this.adult,
    this.backdropPath,
    required this.id,
    required this.name,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    this.posterPath,
    required this.mediaType,
    required this.genreIds,
    required this.popularity,
    this.firstAirDate,
    required this.voteAverage,
    required this.voteCount,
    required this.originCountry,
  });

  @override
  List<Object?> get props => [
        adult,
        backdropPath,
        id,
        name,
        originalLanguage,
        originalName,
        overview,
        posterPath,
        mediaType,
        genreIds,
        popularity,
        firstAirDate,
        voteAverage,
        voteCount,
        originCountry,
      ];
}
