import 'package:cine_spot/features/tv_show/domain/entities/tv_episode_details_entity.dart';


class TvEpisodeDetailsModel {
  final String? airDate;
  final List<CrewMemberModel>? crew;
  final int? episodeNumber;
  final List<GuestStarModel>? guestStars;
  final String? name;
  final String? overview;
  final int? id;
  final String? productionCode;
  final int? runtime;
  final int? seasonNumber;
  final String? stillPath;
  final double? voteAverage;
  final int? voteCount;

  const TvEpisodeDetailsModel({
    this.airDate,
    this.crew,
    this.episodeNumber,
    this.guestStars,
    this.name,
    this.overview,
    this.id,
    this.productionCode,
    this.runtime,
    this.seasonNumber,
    this.stillPath,
    this.voteAverage,
    this.voteCount,
  });

  factory TvEpisodeDetailsModel.fromJson(Map<String, dynamic> json) {
    return TvEpisodeDetailsModel(
      airDate: json['air_date'],
      crew: (json['crew'] as List<dynamic>?)
          ?.map((e) => CrewMemberModel.fromJson(e))
          .toList(),
      episodeNumber: json['episode_number'],
      guestStars: (json['guest_stars'] as List<dynamic>?)
          ?.map((e) => GuestStarModel.fromJson(e))
          .toList(),
      name: json['name'],
      overview: json['overview'],
      id: json['id'],
      productionCode: json['production_code'],
      runtime: json['runtime'],
      seasonNumber: json['season_number'],
      stillPath: json['still_path'],
      voteAverage: (json['vote_average'] != null)
          ? (json['vote_average'] as num).toDouble()
          : null,
      voteCount: json['vote_count'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'air_date': airDate,
      'crew': crew?.map((e) => e.toJson()).toList(),
      'episode_number': episodeNumber,
      'guest_stars': guestStars?.map((e) => e.toJson()).toList(),
      'name': name,
      'overview': overview,
      'id': id,
      'production_code': productionCode,
      'runtime': runtime,
      'season_number': seasonNumber,
      'still_path': stillPath,
      'vote_average': voteAverage,
      'vote_count': voteCount,
    };
  }

  TvEpisodeDetailsEntity toEntity() {
    return TvEpisodeDetailsEntity(
      airDate: airDate,
      crew: crew?.map((e) => e.toEntity()).toList(),
      episodeNumber: episodeNumber,
      guestStars: guestStars?.map((e) => e.toEntity()).toList(),
      name: name,
      overview: overview,
      id: id,
      productionCode: productionCode,
      runtime: runtime,
      seasonNumber: seasonNumber,
      stillPath: stillPath,
      voteAverage: voteAverage,
      voteCount: voteCount,
    );
  }
}

class CrewMemberModel {
  final String? department;
  final String? job;
  final String? creditId;
  final bool? adult;
  final int? gender;
  final int? id;
  final String? knownForDepartment;
  final String? name;
  final String? originalName;
  final double? popularity;
  final String? profilePath;

  const CrewMemberModel({
    this.department,
    this.job,
    this.creditId,
    this.adult,
    this.gender,
    this.id,
    this.knownForDepartment,
    this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
  });

  factory CrewMemberModel.fromJson(Map<String, dynamic> json) {
    return CrewMemberModel(
      department: json['department'],
      job: json['job'],
      creditId: json['credit_id'],
      adult: json['adult'],
      gender: json['gender'],
      id: json['id'],
      knownForDepartment: json['known_for_department'],
      name: json['name'],
      originalName: json['original_name'],
      popularity: (json['popularity'] != null)
          ? (json['popularity'] as num).toDouble()
          : null,
      profilePath: json['profile_path'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'department': department,
      'job': job,
      'credit_id': creditId,
      'adult': adult,
      'gender': gender,
      'id': id,
      'known_for_department': knownForDepartment,
      'name': name,
      'original_name': originalName,
      'popularity': popularity,
      'profile_path': profilePath,
    };
  }

  CrewMemberEntity toEntity() {
    return CrewMemberEntity(
      department: department,
      job: job,
      creditId: creditId,
      adult: adult,
      gender: gender,
      id: id,
      knownForDepartment: knownForDepartment,
      name: name,
      originalName: originalName,
      popularity: popularity,
      profilePath: profilePath,
    );
  }
}

class GuestStarModel {
  final String? character;
  final String? creditId;
  final int? order;
  final bool? adult;
  final int? gender;
  final int? id;
  final String? knownForDepartment;
  final String? name;
  final String? originalName;
  final double? popularity;
  final String? profilePath;

  const GuestStarModel({
    this.character,
    this.creditId,
    this.order,
    this.adult,
    this.gender,
    this.id,
    this.knownForDepartment,
    this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
  });

  factory GuestStarModel.fromJson(Map<String, dynamic> json) {
    return GuestStarModel(
      character: json['character'],
      creditId: json['credit_id'],
      order: json['order'],
      adult: json['adult'],
      gender: json['gender'],
      id: json['id'],
      knownForDepartment: json['known_for_department'],
      name: json['name'],
      originalName: json['original_name'],
      popularity: (json['popularity'] != null)
          ? (json['popularity'] as num).toDouble()
          : null,
      profilePath: json['profile_path'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'character': character,
      'credit_id': creditId,
      'order': order,
      'adult': adult,
      'gender': gender,
      'id': id,
      'known_for_department': knownForDepartment,
      'name': name,
      'original_name': originalName,
      'popularity': popularity,
      'profile_path': profilePath,
    };
  }

  GuestStarEntity toEntity() {
    return GuestStarEntity(
      character: character,
      creditId: creditId,
      order: order,
      adult: adult,
      gender: gender,
      id: id,
      knownForDepartment: knownForDepartment,
      name: name,
      originalName: originalName,
      popularity: popularity,
      profilePath: profilePath,
    );
  }
}
