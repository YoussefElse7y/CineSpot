// tv_season_videos_model.dart

import 'package:cine_spot/features/tv_show/domain/entities/tv_season_videos_entity.dart';


class TvSeasonVideosModel extends TvSeasonVideosEntity {
  const TvSeasonVideosModel({
    required int id,
    required List<TvSeasonVideoItemModel> results,
  }) : super(id: id, results: results);

  factory TvSeasonVideosModel.fromJson(Map<String, dynamic> json) {
    return TvSeasonVideosModel(
      id: json['id'] ?? 0,
      results: (json['results'] as List<dynamic>? ?? [])
          .map((e) => TvSeasonVideoItemModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'results': results.map((e) => (e as TvSeasonVideoItemModel).toJson()).toList(),
    };
  }

  TvSeasonVideosEntity toEntity() {
    return TvSeasonVideosEntity(
      id: id,
      results: results.map((e) => (e as TvSeasonVideoItemModel).toEntity()).toList(),
    );
  }
}

class TvSeasonVideoItemModel extends TvSeasonVideoItemEntity {
  const TvSeasonVideoItemModel({
    required super.iso6391,
    required super.iso31661,
    required super.name,
    required super.key,
    required super.site,
    required super.size,
    required super.type,
    required super.official,
    super.publishedAt,
    required super.id,
  });

  factory TvSeasonVideoItemModel.fromJson(Map<String, dynamic> json) {
    return TvSeasonVideoItemModel(
      iso6391: json['iso_639_1'] ?? '',
      iso31661: json['iso_3166_1'] ?? '',
      name: json['name'] ?? '',
      key: json['key'] ?? '',
      site: json['site'] ?? '',
      size: json['size'] ?? 0,
      type: json['type'] ?? '',
      official: json['official'] ?? false,
      publishedAt: json['published_at'],
      id: json['id'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'iso_639_1': iso6391,
      'iso_3166_1': iso31661,
      'name': name,
      'key': key,
      'site': site,
      'size': size,
      'type': type,
      'official': official,
      'published_at': publishedAt,
      'id': id,
    };
  }

  TvSeasonVideoItemEntity toEntity() {
    return TvSeasonVideoItemEntity(
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
}
