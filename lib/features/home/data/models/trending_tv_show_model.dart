import 'package:cine_spot/features/home/domain/entities/trending_tv_show_entity.dart';

class TrendingTvShowModel extends TrendingTvShowEntity {
  const TrendingTvShowModel({
    required super.id,
    required super.name,
    required super.originalName,
    required super.overview,
    super.backdropPath,
    super.posterPath,
    required super.originalLanguage,
    required super.mediaType,
    required super.genreIds,
    required super.originCountry,
    required super.popularity,
    required super.voteAverage,
    required super.voteCount,
    required super.adult,
    required super.firstAirDate,
  });

  factory TrendingTvShowModel.fromJson(Map<String, dynamic> json) {
    return TrendingTvShowModel(
      id: json['id'],
      name: json['name'] ?? '',
      originalName: json['original_name'] ?? '',
      overview: json['overview'] ?? '',
      backdropPath: json['backdrop_path'],
      posterPath: json['poster_path'],
      originalLanguage: json['original_language'] ?? '',
      mediaType: json['media_type'] ?? '',
      genreIds: List<int>.from(json['genre_ids'] ?? []),
      originCountry: List<String>.from(json['origin_country'] ?? []),
      popularity: (json['popularity'] ?? 0).toDouble(),
      voteAverage: (json['vote_average'] ?? 0).toDouble(),
      voteCount: json['vote_count'] ?? 0,
      adult: json['adult'] ?? false,
      firstAirDate: json['first_air_date'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'original_name': originalName,
      'overview': overview,
      'backdrop_path': backdropPath,
      'poster_path': posterPath,
      'original_language': originalLanguage,
      'media_type': mediaType,
      'genre_ids': genreIds,
      'origin_country': originCountry,
      'popularity': popularity,
      'vote_average': voteAverage,
      'vote_count': voteCount,
      'adult': adult,
      'first_air_date': firstAirDate,
    };
  }
}
