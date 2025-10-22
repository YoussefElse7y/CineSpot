
import 'package:cine_spot/features/explore/domain/entities/multi/search_result_entity.dart';

class SearchResultModel extends SearchResultEntity {
  const SearchResultModel({
    required super.id,
    required super.adult,
    required super.mediaType,
    super.title,
    super.name,
    super.originalTitle,
    super.originalName,
    required super.overview,
    super.posterPath,
    super.backdropPath,
    required super.originalLanguage,
    super.genreIds,
    super.originCountry,
    super.releaseDate,
    super.firstAirDate,
    required super.popularity,
    required super.voteAverage,
    required super.voteCount,
    super.video,
    super.gender,
    super.knownForDepartment,
    super.profilePath,
    List<KnownForModel>? super.knownFor,
  });

  factory SearchResultModel.fromJson(Map<String, dynamic> json) {
    return SearchResultModel(
      id: json['id'],
      adult: json['adult'] ?? false,
      mediaType: json['media_type'] ?? '',
      title: json['title'],
      name: json['name'],
      originalTitle: json['original_title'],
      originalName: json['original_name'],
      overview: json['overview'] ?? '',
      posterPath: json['poster_path'],
      backdropPath: json['backdrop_path'],
      originalLanguage: json['original_language'] ?? '',
      genreIds: (json['genre_ids'] as List?)?.map((e) => e as int).toList(),
      originCountry:
          (json['origin_country'] as List?)?.map((e) => e.toString()).toList(),
      releaseDate: json['release_date'],
      firstAirDate: json['first_air_date'],
      popularity: (json['popularity'] ?? 0).toDouble(),
      voteAverage: (json['vote_average'] ?? 0).toDouble(),
      voteCount: json['vote_count'] ?? 0,
      video: json['video'],
      gender: json['gender'],
      knownForDepartment: json['known_for_department'],
      profilePath: json['profile_path'],
      knownFor: (json['known_for'] as List?)
          ?.map((e) => KnownForModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'adult': adult,
      'media_type': mediaType,
      'title': title,
      'name': name,
      'original_title': originalTitle,
      'original_name': originalName,
      'overview': overview,
      'poster_path': posterPath,
      'backdrop_path': backdropPath,
      'original_language': originalLanguage,
      'genre_ids': genreIds,
      'origin_country': originCountry,
      'release_date': releaseDate,
      'first_air_date': firstAirDate,
      'popularity': popularity,
      'vote_average': voteAverage,
      'vote_count': voteCount,
      'video': video,
      'gender': gender,
      'known_for_department': knownForDepartment,
      'profile_path': profilePath,
      'known_for':
          knownFor?.map((e) => (e as KnownForModel).toJson()).toList(),
    };
  }
}

class KnownForModel extends KnownForEntity {
  const KnownForModel({
    required super.id,
    super.title,
    super.originalTitle,
    required super.overview,
    super.posterPath,
    super.backdropPath,
    required super.mediaType,
    required super.originalLanguage,
    super.genreIds,
    super.releaseDate,
    super.video,
    required super.popularity,
    required super.voteAverage,
    required super.voteCount,
  });

  factory KnownForModel.fromJson(Map<String, dynamic> json) {
    return KnownForModel(
      id: json['id'],
      title: json['title'],
      originalTitle: json['original_title'],
      overview: json['overview'] ?? '',
      posterPath: json['poster_path'],
      backdropPath: json['backdrop_path'],
      mediaType: json['media_type'] ?? '',
      originalLanguage: json['original_language'] ?? '',
      genreIds: (json['genre_ids'] as List?)?.map((e) => e as int).toList(),
      releaseDate: json['release_date'],
      video: json['video'],
      popularity: (json['popularity'] ?? 0).toDouble(),
      voteAverage: (json['vote_average'] ?? 0).toDouble(),
      voteCount: json['vote_count'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'original_title': originalTitle,
      'overview': overview,
      'poster_path': posterPath,
      'backdrop_path': backdropPath,
      'media_type': mediaType,
      'original_language': originalLanguage,
      'genre_ids': genreIds,
      'release_date': releaseDate,
      'video': video,
      'popularity': popularity,
      'vote_average': voteAverage,
      'vote_count': voteCount,
    };
  }
}
