// ignore_for_file: invalid_annotation_target

import 'package:json_annotation/json_annotation.dart';
import '../../../domain/entities/tv_episode_videos_entity.dart';

part 'tv_episode_videos_model.g.dart';

@JsonSerializable(explicitToJson: true)
class TvEpisodeVideosModel extends TvEpisodeVideosEntity {
  const TvEpisodeVideosModel({
    required super.id,
    @JsonKey(name: 'results') required List<TvEpisodeVideoItemModel> super.results,
  });

  factory TvEpisodeVideosModel.fromJson(Map<String, dynamic> json) =>
      _$TvEpisodeVideosModelFromJson(json);

  Map<String, dynamic> toJson() => _$TvEpisodeVideosModelToJson(this);

  /// ✅ Convert Model → Entity
  TvEpisodeVideosEntity toEntity() => TvEpisodeVideosEntity(
        id: id,
        results: results.map((video) => video.toEntity()).toList(),
      );
}

@JsonSerializable()
class TvEpisodeVideoItemModel extends TvEpisodeVideoItemEntity {
  const TvEpisodeVideoItemModel({
    @JsonKey(name: 'iso_639_1') required super.iso6391,
    @JsonKey(name: 'iso_3166_1') required super.iso31661,
    required super.name,
    required super.key,
    required super.site,
    required super.size,
    required super.type,
    required super.official,
    @JsonKey(name: 'published_at') required super.publishedAt,
    required super.id,
  });

  factory TvEpisodeVideoItemModel.fromJson(Map<String, dynamic> json) =>
      _$TvEpisodeVideoItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$TvEpisodeVideoItemModelToJson(this);

  /// ✅ Convert Model → Entity
  TvEpisodeVideoItemEntity toEntity() => TvEpisodeVideoItemEntity(
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
