// tv_season_credits_model.dart


import 'package:cine_spot/features/tv_show/domain/entities/tv_season_credits_entity.dart';

class TvSeasonCreditsModel extends TvSeasonCreditsEntity {
  TvSeasonCreditsModel({
    required List<TvSeasonCastModel> cast,
    required List<TvSeasonCrewModel> crew,
    required int id,
  }) : super(
          cast: cast,
          crew: crew,
          id: id,
        );

  factory TvSeasonCreditsModel.fromJson(Map<String, dynamic> json) {
    return TvSeasonCreditsModel(
      cast: (json['cast'] as List<dynamic>)
          .map((e) => TvSeasonCastModel.fromJson(e))
          .toList(),
      crew: (json['crew'] as List<dynamic>)
          .map((e) => TvSeasonCrewModel.fromJson(e))
          .toList(),
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cast': cast.map((e) => (e as TvSeasonCastModel).toJson()).toList(),
      'crew': crew.map((e) => (e as TvSeasonCrewModel).toJson()).toList(),
      'id': id,
    };
  }

  TvSeasonCreditsEntity toEntity() {
    return TvSeasonCreditsEntity(
      cast: cast.map((e) => ( e as TvSeasonCastModel).toEntity()).toList(),
      crew: crew.map((e) => (e as TvSeasonCrewModel).toEntity()).toList(),
      id: id,
    );
  }
}

class TvSeasonCastModel extends TvSeasonCastEntity {
  const TvSeasonCastModel({
    required bool adult,
    required int gender,
    required int id,
    required String knownForDepartment,
    required String name,
    required String originalName,
    required double popularity,
    String? profilePath,
    required String character,
    required String creditId,
    required int order,
  }) : super(
          adult: adult,
          gender: gender,
          id: id,
          knownForDepartment: knownForDepartment,
          name: name,
          originalName: originalName,
          popularity: popularity,
          profilePath: profilePath,
          character: character,
          creditId: creditId,
          order: order,
        );

  factory TvSeasonCastModel.fromJson(Map<String, dynamic> json) {
    return TvSeasonCastModel(
      adult: json['adult'] ?? false,
      gender: json['gender'] ?? 0,
      id: json['id'],
      knownForDepartment: json['known_for_department'] ?? '',
      name: json['name'] ?? '',
      originalName: json['original_name'] ?? '',
      popularity: (json['popularity'] ?? 0).toDouble(),
      profilePath: json['profile_path'],
      character: json['character'] ?? '',
      creditId: json['credit_id'] ?? '',
      order: json['order'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'adult': adult,
      'gender': gender,
      'id': id,
      'known_for_department': knownForDepartment,
      'name': name,
      'original_name': originalName,
      'popularity': popularity,
      'profile_path': profilePath,
      'character': character,
      'credit_id': creditId,
      'order': order,
    };
  }

  TvSeasonCastEntity toEntity() {
    return TvSeasonCastEntity(
      adult: adult,
      gender: gender,
      id: id,
      knownForDepartment: knownForDepartment,
      name: name,
      originalName: originalName,
      popularity: popularity,
      profilePath: profilePath,
      character: character,
      creditId: creditId,
      order: order,
    );
  }
}

class TvSeasonCrewModel extends TvSeasonCrewEntity {
  const TvSeasonCrewModel({
    required bool adult,
    required int gender,
    required int id,
    required String knownForDepartment,
    required String name,
    required String originalName,
    required double popularity,
    String? profilePath,
    required String creditId,
    required String department,
    required String job,
  }) : super(
          adult: adult,
          gender: gender,
          id: id,
          knownForDepartment: knownForDepartment,
          name: name,
          originalName: originalName,
          popularity: popularity,
          profilePath: profilePath,
          creditId: creditId,
          department: department,
          job: job,
        );

  factory TvSeasonCrewModel.fromJson(Map<String, dynamic> json) {
    return TvSeasonCrewModel(
      adult: json['adult'] ?? false,
      gender: json['gender'] ?? 0,
      id: json['id'],
      knownForDepartment: json['known_for_department'] ?? '',
      name: json['name'] ?? '',
      originalName: json['original_name'] ?? '',
      popularity: (json['popularity'] ?? 0).toDouble(),
      profilePath: json['profile_path'],
      creditId: json['credit_id'] ?? '',
      department: json['department'] ?? '',
      job: json['job'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'adult': adult,
      'gender': gender,
      'id': id,
      'known_for_department': knownForDepartment,
      'name': name,
      'original_name': originalName,
      'popularity': popularity,
      'profile_path': profilePath,
      'credit_id': creditId,
      'department': department,
      'job': job,
    };
  }

  TvSeasonCrewEntity toEntity() {
    return TvSeasonCrewEntity(
      adult: adult,
      gender: gender,
      id: id,
      knownForDepartment: knownForDepartment,
      name: name,
      originalName: originalName,
      popularity: popularity,
      profilePath: profilePath,
      creditId: creditId,
      department: department,
      job: job,
    );
  }
}
