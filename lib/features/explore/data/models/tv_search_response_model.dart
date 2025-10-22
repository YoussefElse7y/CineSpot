import '../../domain/entities/tv_search_response_entity.dart';

class TvSearchResponseModel extends TvSearchResponseEntity {
  const TvSearchResponseModel({
    required super.page,
    required List<TvModel> super.results,
    required super.totalPages,
    required super.totalResults,
  });

  factory TvSearchResponseModel.fromJson(Map<String, dynamic> json) {
    return TvSearchResponseModel(
      page: json['page'] ?? 1,
      results: (json['results'] as List<dynamic>?)
              ?.map((item) => TvModel.fromJson(item))
              .toList() ??
          [],
      totalPages: json['total_pages'] ?? 0,
      totalResults: json['total_results'] ?? 0,
    );
  }
}

class TvModel extends TvEntity {
  const TvModel({
    required super.adult,
    super.backdropPath,
    required super.genreIds,
    required super.id,
    required super.originCountry,
    required super.originalLanguage,
    required super.originalName,
    required super.overview,
    required super.popularity,
    super.posterPath,
    required super.firstAirDate,
    required super.name,
    required super.voteAverage,
    required super.voteCount,
  });

  factory TvModel.fromJson(Map<String, dynamic> json) {
    return TvModel(
      adult: json['adult'] ?? false,
      backdropPath: json['backdrop_path'],
      genreIds: (json['genre_ids'] as List<dynamic>?)
              ?.map((e) => e as int)
              .toList() ??
          [],
      id: json['id'] ?? 0,
      originCountry: (json['origin_country'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      originalLanguage: json['original_language'] ?? '',
      originalName: json['original_name'] ?? '',
      overview: json['overview'] ?? '',
      popularity: (json['popularity'] is int)
          ? (json['popularity'] as int).toDouble()
          : (json['popularity'] ?? 0.0),
      posterPath: json['poster_path'],
      firstAirDate: json['first_air_date'] ?? '',
      name: json['name'] ?? '',
      voteAverage: (json['vote_average'] is int)
          ? (json['vote_average'] as int).toDouble()
          : (json['vote_average'] ?? 0.0),
      voteCount: json['vote_count'] ?? 0,
    );
  }
}
