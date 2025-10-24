import 'package:json_annotation/json_annotation.dart';
import '../../../domain/entities/tv_show_videos_entity.dart';

part 'tv_show_videos_model.g.dart';

@JsonSerializable(explicitToJson: true)
class TvShowVideosModel {
  final int id;
  final List<TvShowVideoResultModel> results;

  TvShowVideosModel({
    required this.id,
    required this.results,
  });

  factory TvShowVideosModel.fromJson(Map<String, dynamic> json) =>
      _$TvShowVideosModelFromJson(json);

  Map<String, dynamic> toJson() => _$TvShowVideosModelToJson(this);

  TvShowVideosEntity toEntity() => TvShowVideosEntity(
        id: id,
        results: results.map((r) => r.toEntity()).toList(),
      );
}

@JsonSerializable()
class TvShowVideoResultModel {
  @JsonKey(name: 'iso_639_1')
  final String iso6391;

  @JsonKey(name: 'iso_3166_1')
  final String iso31661;

  final String name;
  final String key;
  final String site;
  final int size;
  final String type;
  final bool official;

  @JsonKey(name: 'published_at')
  final String publishedAt;

  final String id;

  TvShowVideoResultModel({
    required this.iso6391,
    required this.iso31661,
    required this.name,
    required this.key,
    required this.site,
    required this.size,
    required this.type,
    required this.official,
    required this.publishedAt,
    required this.id,
  });

  factory TvShowVideoResultModel.fromJson(Map<String, dynamic> json) =>
      _$TvShowVideoResultModelFromJson(json);

  Map<String, dynamic> toJson() => _$TvShowVideoResultModelToJson(this);

  TvShowVideoResultEntity toEntity() => TvShowVideoResultEntity(
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
