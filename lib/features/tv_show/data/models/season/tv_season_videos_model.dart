// ignore_for_file: invalid_annotation_target

import 'package:json_annotation/json_annotation.dart';
import '../../../domain/entities/tv_season_videos_entity.dart';

part 'tv_season_videos_model.g.dart';

@JsonSerializable(explicitToJson: true)
class TvSeasonVideosModel extends TvSeasonVideosEntity {
  const TvSeasonVideosModel({
    required super.id,
    required List<TvSeasonVideoItemModel> super.results,
  });

  factory TvSeasonVideosModel.fromJson(Map<String, dynamic> json) =>
      _$TvSeasonVideosModelFromJson(json);

  Map<String, dynamic> toJson() => _$TvSeasonVideosModelToJson(this);

  /// ✅ Convert model → entity
  TvSeasonVideosEntity toEntity() => TvSeasonVideosEntity(
        id: id,
        results: results.map((e) => e.toEntity()).toList(),
      );
}

@JsonSerializable()
class TvSeasonVideoItemModel extends TvSeasonVideoItemEntity {
  const TvSeasonVideoItemModel({
    @JsonKey(name: 'iso_639_1') 
    required super.iso6391,
    @JsonKey(name: 'iso_3166_1') 
    required super.iso31661,
    required super.name,
    required super.key,
    required super.site,
    required super.size,
    required super.type,
    required super.official,
    @JsonKey(name: 'published_at')
     super.publishedAt,
    required super.id,
  });

  factory TvSeasonVideoItemModel.fromJson(Map<String, dynamic> json) =>
      _$TvSeasonVideoItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$TvSeasonVideoItemModelToJson(this);

  /// ✅ Convert model → entity
  TvSeasonVideoItemEntity toEntity() => TvSeasonVideoItemEntity(
        iso6391: iso6391,
        iso31661: iso31661,
        name: name,
        key: key,
        site: site,
        size: size,
        type: type,
        official: official,
        publishedAt: publishedAt,
        id: id,
      );
}
