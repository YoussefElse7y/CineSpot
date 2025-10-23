import '../../domain/entities/movie_videos_entity.dart';

class MovieVideosModel extends MovieVideosEntity {
  MovieVideosModel({
    required super.id,
    required super.results,
  });

  factory MovieVideosModel.fromJson(Map<String, dynamic> json) {
    return MovieVideosModel(
      id: json['id'],
      results: (json['results'] as List)
          .map((v) => MovieVideoModel.fromJson(v))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'results': results.map((v) {
          if (v is MovieVideoModel) return v.toJson();
          return {};
        }).toList(),
      };
}

class MovieVideoModel extends MovieVideoEntity {
  MovieVideoModel({
    super.iso6391,
    super.iso31661,
    required super.name,
    required super.key,
    required super.site,
    required super.size,
    required super.type,
    super.official,
    super.publishedAt,
    required super.id,
  });

  factory MovieVideoModel.fromJson(Map<String, dynamic> json) {
    return MovieVideoModel(
      iso6391: json['iso_639_1'],
      iso31661: json['iso_3166_1'],
      name: json['name'],
      key: json['key'],
      site: json['site'],
      size: json['size'],
      type: json['type'],
      official: json['official'],
      publishedAt: json['published_at'] != null
          ? DateTime.tryParse(json['published_at'])
          : null,
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() => {
        'iso_639_1': iso6391,
        'iso_3166_1': iso31661,
        'name': name,
        'key': key,
        'site': site,
        'size': size,
        'type': type,
        'official': official,
        'published_at': publishedAt?.toIso8601String(),
        'id': id,
      };
}
