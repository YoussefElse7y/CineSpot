// tv_show_recommendations_model.dart


import 'package:cine_spot/features/tv_show/domain/entities/tv_show_recommendations_entity.dart';

class TvShowRecommendationsModel extends TvShowRecommendationsEntity {
  TvShowRecommendationsModel({
    required int page,
    required List<TvShowRecommendationItemModel> results,
    required int totalPages,
    required int totalResults,
  }) : super(
          page: page,
          results: results,
          totalPages: totalPages,
          totalResults: totalResults,
        );

  factory TvShowRecommendationsModel.fromJson(Map<String, dynamic> json) {
    return TvShowRecommendationsModel(
      page: json['page'] ?? 1,
      results: (json['results'] as List<dynamic>? ?? [])
          .map((e) => TvShowRecommendationItemModel.fromJson(e))
          .toList(),
      totalPages: json['total_pages'] ?? 1,
      totalResults: json['total_results'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'results': results.map((e) => (e as TvShowRecommendationItemModel).toJson()).toList(),
      'total_pages': totalPages,
      'total_results': totalResults,
    };
  }

  TvShowRecommendationsEntity toEntity() {
    return TvShowRecommendationsEntity(
      page: page,
      results: results.map((e) => (e as TvShowRecommendationItemModel).toEntity()).toList(),
      totalPages: totalPages,
      totalResults: totalResults,
    );
  }
}

class TvShowRecommendationItemModel extends TvShowRecommendationItemEntity {
  TvShowRecommendationItemModel({
    required bool adult,
    String? backdropPath,
    required int id,
    required String name,
    required String originalLanguage,
    required String originalName,
    required String overview,
    String? posterPath,
    required String mediaType,
    required List<int> genreIds,
    required double popularity,
    String? firstAirDate,
    required double voteAverage,
    required int voteCount,
    required List<String> originCountry,
  }) : super(
          adult: adult,
          backdropPath: backdropPath,
          id: id,
          name: name,
          originalLanguage: originalLanguage,
          originalName: originalName,
          overview: overview,
          posterPath: posterPath,
          mediaType: mediaType,
          genreIds: genreIds,
          popularity: popularity,
          firstAirDate: firstAirDate,
          voteAverage: voteAverage,
          voteCount: voteCount,
          originCountry: originCountry,
        );

  factory TvShowRecommendationItemModel.fromJson(Map<String, dynamic> json) {
    return TvShowRecommendationItemModel(
      adult: json['adult'] ?? false,
      backdropPath: json['backdrop_path'],
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      originalLanguage: json['original_language'] ?? '',
      originalName: json['original_name'] ?? '',
      overview: json['overview'] ?? '',
      posterPath: json['poster_path'],
      mediaType: json['media_type'] ?? '',
      genreIds: (json['genre_ids'] as List<dynamic>? ?? []).map((e) => e as int).toList(),
      popularity: (json['popularity'] ?? 0).toDouble(),
      firstAirDate: json['first_air_date'],
      voteAverage: (json['vote_average'] ?? 0).toDouble(),
      voteCount: json['vote_count'] ?? 0,
      originCountry: (json['origin_country'] as List<dynamic>? ?? []).map((e) => e as String).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'adult': adult,
      'backdrop_path': backdropPath,
      'id': id,
      'name': name,
      'original_language': originalLanguage,
      'original_name': originalName,
      'overview': overview,
      'poster_path': posterPath,
      'media_type': mediaType,
      'genre_ids': genreIds,
      'popularity': popularity,
      'first_air_date': firstAirDate,
      'vote_average': voteAverage,
      'vote_count': voteCount,
      'origin_country': originCountry,
    };
  }

  TvShowRecommendationItemEntity toEntity() {
    return TvShowRecommendationItemEntity(
      adult: adult,
      backdropPath: backdropPath,
      id: id,
      name: name,
      originalLanguage: originalLanguage,
      originalName: originalName,
      overview: overview,
      posterPath: posterPath,
      mediaType: mediaType,
      genreIds: genreIds,
      popularity: popularity,
      firstAirDate: firstAirDate,
      voteAverage: voteAverage,
      voteCount: voteCount,
      originCountry: originCountry,
    );
  }
}
