import 'package:json_annotation/json_annotation.dart';
import '../../../domain/entities/tv_show_details_entity.dart';

part 'tv_show_details_model.g.dart';

@JsonSerializable(explicitToJson: true)
class TvShowDetailsModel {
  final int id;
  final String name;
  @JsonKey(name: 'original_name')
  final String originalName;
  final String overview;
  final String? tagline;
  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;
  @JsonKey(name: 'poster_path')
  final String? posterPath;
  @JsonKey(name: 'first_air_date')
  final String firstAirDate;
  @JsonKey(name: 'last_air_date')
  final String? lastAirDate;
  @JsonKey(name: 'in_production')
  final bool inProduction;
  @JsonKey(name: 'number_of_seasons')
  final int numberOfSeasons;
  @JsonKey(name: 'number_of_episodes')
  final int numberOfEpisodes;
  @JsonKey(name: 'vote_average')
  final double voteAverage;
  @JsonKey(name: 'vote_count')
  final int voteCount;
  final List<GenreModel> genres;
  final List<SeasonModel> seasons;
  @JsonKey(name: 'created_by')
  final List<CreatedByModel> createdBy;
  final List<NetworkModel> networks;

  TvShowDetailsModel({
    required this.id,
    required this.name,
    required this.originalName,
    required this.overview,
    required this.firstAirDate,
    required this.inProduction,
    required this.numberOfSeasons,
    required this.numberOfEpisodes,
    required this.voteAverage,
    required this.voteCount,
    required this.genres,
    required this.seasons,
    required this.createdBy,
    required this.networks,
    this.tagline,
    this.backdropPath,
    this.posterPath,
    this.lastAirDate,
  });

  factory TvShowDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$TvShowDetailsModelFromJson(json);
  Map<String, dynamic> toJson() => _$TvShowDetailsModelToJson(this);

  TvShowDetailsEntity toEntity() => TvShowDetailsEntity(
        id: id,
        name: name,
        originalName: originalName,
        overview: overview,
        tagline: tagline,
        backdropPath: backdropPath,
        posterPath: posterPath,
        firstAirDate: firstAirDate,
        lastAirDate: lastAirDate,
        inProduction: inProduction,
        numberOfSeasons: numberOfSeasons,
        numberOfEpisodes: numberOfEpisodes,
        voteAverage: voteAverage,
        voteCount: voteCount,
        genres: genres.map((e) => e.toEntity()).toList(),
        seasons: seasons.map((e) => e.toEntity()).toList(),
        createdBy: createdBy.map((e) => e.toEntity()).toList(),
        networks: networks.map((e) => e.toEntity()).toList(),
      );
}

@JsonSerializable()
class GenreModel {
  final int id;
  final String name;

  GenreModel({required this.id, required this.name});

  factory GenreModel.fromJson(Map<String, dynamic> json) =>
      _$GenreModelFromJson(json);
  Map<String, dynamic> toJson() => _$GenreModelToJson(this);

  GenreEntity toEntity() => GenreEntity(id: id, name: name);
}

@JsonSerializable()
class SeasonModel {
  final int id;
  final String name;
  final String? overview;
  @JsonKey(name: 'poster_path')
  final String? posterPath;
  @JsonKey(name: 'air_date')
  final String? airDate;
  @JsonKey(name: 'episode_count')
  final int episodeCount;
  @JsonKey(name: 'season_number')
  final int seasonNumber;
  @JsonKey(name: 'vote_average')
  final double voteAverage;

  SeasonModel({
    required this.id,
    required this.name,
    this.overview,
    this.posterPath,
    this.airDate,
    required this.episodeCount,
    required this.seasonNumber,
    required this.voteAverage,
  });

  factory SeasonModel.fromJson(Map<String, dynamic> json) =>
      _$SeasonModelFromJson(json);
  Map<String, dynamic> toJson() => _$SeasonModelToJson(this);

  SeasonEntity toEntity() => SeasonEntity(
        id: id,
        name: name,
        overview: overview,
        posterPath: posterPath,
        airDate: airDate,
        episodeCount: episodeCount,
        seasonNumber: seasonNumber,
        voteAverage: voteAverage,
      );
}

@JsonSerializable()
class CreatedByModel {
  final int id;
  final String name;
  final int? gender;
  @JsonKey(name: 'profile_path')
  final String? profilePath;

  CreatedByModel({
    required this.id,
    required this.name,
    this.gender,
    this.profilePath,
  });

  factory CreatedByModel.fromJson(Map<String, dynamic> json) =>
      _$CreatedByModelFromJson(json);
  Map<String, dynamic> toJson() => _$CreatedByModelToJson(this);

  CreatedByEntity toEntity() =>
      CreatedByEntity(id: id, name: name, gender: gender, profilePath: profilePath);
}

@JsonSerializable()
class NetworkModel {
  final int id;
  final String name;
  @JsonKey(name: 'logo_path')
  final String? logoPath;
  @JsonKey(name: 'origin_country')
  final String originCountry;

  NetworkModel({
    required this.id,
    required this.name,
    this.logoPath,
    required this.originCountry,
  });

  factory NetworkModel.fromJson(Map<String, dynamic> json) =>
      _$NetworkModelFromJson(json);
  Map<String, dynamic> toJson() => _$NetworkModelToJson(this);

  NetworkEntity toEntity() =>
      NetworkEntity(id: id, name: name, logoPath: logoPath, originCountry: originCountry);
}
