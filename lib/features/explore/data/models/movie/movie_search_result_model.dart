
import 'package:cine_spot/features/explore/domain/entities/movie/movie_search_result_entity.dart';

class MovieSearchResultModel extends MovieSearchResultEntity {
  const MovieSearchResultModel({
    required super.id,
    required super.title,
    required super.originalTitle,
    required super.originalLanguage,
    super.posterPath,
    super.backdropPath,
    required super.overview,
    required super.releaseDate,
    required super.voteAverage,
    required super.voteCount,
    required super.popularity,
    required super.adult,
    required super.video,
    required super.genreIds,
  });

  factory MovieSearchResultModel.fromJson(Map<String, dynamic> json) {
    return MovieSearchResultModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      originalTitle: json['original_title'] ?? '',
      originalLanguage: json['original_language'] ?? '',
      posterPath: json['poster_path'],
      backdropPath: json['backdrop_path'],
      overview: json['overview'] ?? '',
      releaseDate: json['release_date'] ?? '',
      voteAverage: (json['vote_average'] ?? 0).toDouble(),
      voteCount: json['vote_count'] ?? 0,
      popularity: (json['popularity'] ?? 0).toDouble(),
      adult: json['adult'] ?? false,
      video: json['video'] ?? false,
      genreIds: List<int>.from(json['genre_ids'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'original_title': originalTitle,
      'original_language': originalLanguage,
      'poster_path': posterPath,
      'backdrop_path': backdropPath,
      'overview': overview,
      'release_date': releaseDate,
      'vote_average': voteAverage,
      'vote_count': voteCount,
      'popularity': popularity,
      'adult': adult,
      'video': video,
      'genre_ids': genreIds,
    };
  }
}
