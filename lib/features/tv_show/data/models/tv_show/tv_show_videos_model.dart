// tv_show_videos_model.dart


import 'package:cine_spot/features/tv_show/domain/entities/tv_show_videos_entity.dart';

class TvShowVideosModel extends TvShowVideosEntity {
  TvShowVideosModel({
    required int id,
    required List<TvShowVideoResultModel> results,
  }) : super(
          id: id,
          results: results,
        );

  factory TvShowVideosModel.fromJson(Map<String, dynamic> json) {
    return TvShowVideosModel(
      id: json['id'] ?? 0,
      results: (json['results'] as List<dynamic>? ?? [])
          .map((e) => TvShowVideoResultModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'results': results.map((e) => (e as TvShowVideoResultModel).toJson()).toList(),
    };
  }

  TvShowVideosEntity toEntity() {
    return TvShowVideosEntity(
      id: id,
      results: results.map((e) => (e as TvShowVideoResultModel).toEntity()).toList(),
    );
  }
}

class TvShowVideoResultModel extends TvShowVideoResultEntity {
  TvShowVideoResultModel({
    required String iso6391,
    required String iso31661,
    required String name,
    required String key,
    required String site,
    required int size,
    required String type,
    required bool official,
    required String publishedAt,
    required String id,
  }) : super(
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

  factory TvShowVideoResultModel.fromJson(Map<String, dynamic> json) {
    return TvShowVideoResultModel(
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

  TvShowVideoResultEntity toEntity() {
    return TvShowVideoResultEntity(
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
