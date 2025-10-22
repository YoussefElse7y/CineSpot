import 'package:cine_spot/features/explore/domain/entities/person/person_search_entity.dart';

class PersonSearchModel extends PersonSearchEntity {
  const PersonSearchModel({
    required super.id,
    required super.name,
    required super.originalName,
    required super.adult,
    required super.gender,
    required super.knownForDepartment,
    required super.popularity,
    super.profilePath,
    required super.knownFor,
  });

  factory PersonSearchModel.fromJson(Map<String, dynamic> json) {
    return PersonSearchModel(
      id: json['id'],
      name: json['name'] ?? '',
      originalName: json['original_name'] ?? '',
      adult: json['adult'] ?? false,
      gender: json['gender'] ?? 0,
      knownForDepartment: json['known_for_department'] ?? '',
      popularity: (json['popularity'] ?? 0).toDouble(),
      profilePath: json['profile_path'],
      knownFor:
          (json['known_for'] as List<dynamic>?)
              ?.map((e) => KnownForModel.fromJson(e))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'original_name': originalName,
    'adult': adult,
    'gender': gender,
    'known_for_department': knownForDepartment,
    'popularity': popularity,
    'profile_path': profilePath,
    'known_for': knownFor.map((e) => (e as KnownForModel).toJson()).toList(),
  };
}

class KnownForModel extends KnownForEntity {
  const KnownForModel({
    required super.id,
    required super.title,
    required super.originalTitle,
    required super.overview,
    super.posterPath,
    super.backdropPath,
    required super.originalLanguage,
    required super.genreIds,
    required super.mediaType,
    required super.popularity,
    super.releaseDate,
    required super.video,
    required super.voteAverage,
    required super.voteCount,
  });

  factory KnownForModel.fromJson(Map<String, dynamic> json) {
    return KnownForModel(
      id: json['id'],
      title: json['title'] ?? '',
      originalTitle: json['original_title'] ?? '',
      overview: json['overview'] ?? '',
      posterPath: json['poster_path'],
      backdropPath: json['backdrop_path'],
      originalLanguage: json['original_language'] ?? '',
      genreIds:
          (json['genre_ids'] as List<dynamic>?)
              ?.map((e) => e as int)
              .toList() ??
          [],
      mediaType: json['media_type'] ?? '',
      popularity: (json['popularity'] ?? 0).toDouble(),
      releaseDate: json['release_date'],
      video: json['video'] ?? false,
      voteAverage: (json['vote_average'] ?? 0).toDouble(),
      voteCount: json['vote_count'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'original_title': originalTitle,
    'overview': overview,
    'poster_path': posterPath,
    'backdrop_path': backdropPath,
    'original_language': originalLanguage,
    'genre_ids': genreIds,
    'media_type': mediaType,
    'popularity': popularity,
    'release_date': releaseDate,
    'video': video,
    'vote_average': voteAverage,
    'vote_count': voteCount,
  };
}
