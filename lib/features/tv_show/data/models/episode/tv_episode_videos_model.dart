import 'package:cine_spot/features/tv_show/domain/entities/tv_episode_videos_entity.dart';


class TvEpisodeVideosModel {
  final int id;
  final List<TvEpisodeVideoItemModel> results;

  const TvEpisodeVideosModel({
    required this.id,
    required this.results,
  });

  factory TvEpisodeVideosModel.fromJson(Map<String, dynamic> json) {
    return TvEpisodeVideosModel(
      id: json['id'] ?? 0,
      results: (json['results'] as List<dynamic>?)
              ?.map((e) => TvEpisodeVideoItemModel.fromJson(e))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'results': results.map((e) => e.toJson()).toList(),
    };
  }

  TvEpisodeVideosEntity toEntity() {
    return TvEpisodeVideosEntity(
      id: id,
      results: results.map((e) => e.toEntity()).toList(),
    );
  }
}

class TvEpisodeVideoItemModel {
  final String iso6391;
  final String iso31661;
  final String name;
  final String key;
  final String site;
  final int size;
  final String type;
  final bool official;
  final String publishedAt;
  final String id;

  const TvEpisodeVideoItemModel({
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

  factory TvEpisodeVideoItemModel.fromJson(Map<String, dynamic> json) {
    return TvEpisodeVideoItemModel(
      iso6391: json['iso_639_1'] ?? '',
      iso31661: json['iso_3166_1'] ?? '',
      name: json['name'] ?? '',
      key: json['key'] ?? '',
      site: json['site'] ?? '',
      size: json['size'] ?? 0,
      type: json['type'] ?? '',
      official: json['official'] ?? false,
      publishedAt: json['published_at'] ?? '',
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

  TvEpisodeVideoItemEntity toEntity() {
    return TvEpisodeVideoItemEntity(
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
