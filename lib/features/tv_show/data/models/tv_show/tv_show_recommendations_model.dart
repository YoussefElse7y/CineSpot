// ignore_for_file: invalid_annotation_target

import 'package:cine_spot/features/tv_show/domain/entities/tv_show_recommendations_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tv_show_recommendations_model.g.dart';

@JsonSerializable(explicitToJson: true)
class TvShowRecommendationsModel extends TvShowRecommendationsEntity {
  const TvShowRecommendationsModel({
    required super.page,
    required super.results,
    @JsonKey(name: 'total_pages') required super.totalPages,
    @JsonKey(name: 'total_results') required super.totalResults,
  });

  /// ✅ Convert Model to Entity
  TvShowRecommendationsEntity toEntity() => TvShowRecommendationsEntity(
        page: page,
        results: results
            .map((item) =>
                (item as TvShowRecommendationItemModel).toEntity()) // map models to entities
            .toList(),
        totalPages: totalPages,
        totalResults: totalResults,
      );

  factory TvShowRecommendationsModel.fromJson(Map<String, dynamic> json) =>
      _$TvShowRecommendationsModelFromJson(json);

  Map<String, dynamic> toJson() => _$TvShowRecommendationsModelToJson(this);
}

@JsonSerializable()
class TvShowRecommendationItemModel extends TvShowRecommendationItemEntity {
  const TvShowRecommendationItemModel({
    required super.adult,
    @JsonKey(name: 'backdrop_path') required super.backdropPath,
    required super.id,
    required super.name,
    @JsonKey(name: 'original_language') required super.originalLanguage,
    @JsonKey(name: 'original_name') required super.originalName,
    required super.overview,
    @JsonKey(name: 'poster_path') required super.posterPath,
    @JsonKey(name: 'media_type') required super.mediaType,
    @JsonKey(name: 'genre_ids') required super.genreIds,
    required super.popularity,
    @JsonKey(name: 'first_air_date') required super.firstAirDate,
    @JsonKey(name: 'vote_average') required super.voteAverage,
    @JsonKey(name: 'vote_count') required super.voteCount,
    @JsonKey(name: 'origin_country') required super.originCountry,
  });

  /// ✅ Convert Model to Entity
  TvShowRecommendationItemEntity toEntity() => TvShowRecommendationItemEntity(
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

  factory TvShowRecommendationItemModel.fromJson(Map<String, dynamic> json) =>
      _$TvShowRecommendationItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$TvShowRecommendationItemModelToJson(this);
}
