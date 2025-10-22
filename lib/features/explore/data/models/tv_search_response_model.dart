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
    required bool adult,
    String? backdropPath,
    required List<int> genreIds,
    required int id,
    required List<String> originCountry,
    required String originalLanguage,
    required String originalName,
    required String overview,
    required double popularity,
    String? posterPath,
    required String firstAirDate,
    required String name,
    required double voteAverage,
    required int voteCount,
  }) : super(
          adult: adult,
          backdropPath: backdropPath,
          genreIds: genreIds,
          id: id,
          originCountry: originCountry,
          originalLanguage: originalLanguage,
          originalName: originalName,
          overview: overview,
          popularity: popularity,
          posterPath: posterPath,
          firstAirDate: firstAirDate,
          name: name,
          voteAverage: voteAverage,
          voteCount: voteCount,
        );

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
