
import 'package:cine_spot/features/home/domain/entities/now_playing_movie_entity.dart';

class NowPlayingMovieModel extends NowPlayingMovieEntity {
  const NowPlayingMovieModel({
    required super.id,
    required super.title,
    required super.originalTitle,
    required super.overview,
    required super.posterPath,
    required super.backdropPath,
    required super.originalLanguage,
    required super.releaseDate,
    required super.popularity,
    required super.voteAverage,
    required super.voteCount,
    required super.adult,
    required super.video,
    required super.genreIds,
  });

  factory NowPlayingMovieModel.fromJson(Map<String, dynamic> json) {
    return NowPlayingMovieModel(
      id: json['id'],
      title: json['title'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      posterPath: json['poster_path'],
      backdropPath: json['backdrop_path'],
      originalLanguage: json['original_language'],
      releaseDate: json['release_date'],
      popularity: (json['popularity'] as num).toDouble(),
      voteAverage: (json['vote_average'] as num).toDouble(),
      voteCount: json['vote_count'],
      adult: json['adult'],
      video: json['video'],
      genreIds: List<int>.from(json['genre_ids']),
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
      'original_language': originalLanguage,
      'release_date': releaseDate,
      'popularity': popularity,
      'vote_average': voteAverage,
      'vote_count': voteCount,
      'adult': adult,
      'video': video,
      'genre_ids': genreIds,
    };
  }
}
