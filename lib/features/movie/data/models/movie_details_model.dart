import 'package:cine_spot/features/movie/domain/entities/movie_details_entity.dart';

class MovieDetailsModel extends MovieDetailsEntity {
  const MovieDetailsModel({
    required super.id,
    required super.title,
    required super.originalTitle,
    required super.overview,
    super.tagline,
    super.backdropPath,
    super.posterPath,
    super.homepage,
    required super.originalLanguage,
    required super.adult,
    required super.video,
    required super.popularity,
    required super.voteAverage,
    required super.voteCount,
    super.budget,
    super.revenue,
    super.runtime,
    required super.releaseDate,
    required super.status,
    required super.genres,
    required super.productionCompanies,
    required super.productionCountries,
    required super.spokenLanguages,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailsModel(
      id: json['id'],
      title: json['title'] ?? '',
      originalTitle: json['original_title'] ?? '',
      overview: json['overview'] ?? '',
      tagline: json['tagline'],
      backdropPath: json['backdrop_path'],
      posterPath: json['poster_path'],
      homepage: json['homepage'],
      originalLanguage: json['original_language'] ?? '',
      adult: json['adult'] ?? false,
      video: json['video'] ?? false,
      popularity: (json['popularity'] as num?)?.toDouble() ?? 0.0,
      voteAverage: (json['vote_average'] as num?)?.toDouble() ?? 0.0,
      voteCount: json['vote_count'] ?? 0,
      budget: json['budget'],
      revenue: json['revenue'],
      runtime: json['runtime'],
      releaseDate: json['release_date'] ?? '',
      status: json['status'] ?? '',
      genres: (json['genres'] as List<dynamic>?)
              ?.map((e) => GenreModel.fromJson(e))
              .toList() ??
          [],
      productionCompanies:
          (json['production_companies'] as List<dynamic>?)
                  ?.map((e) => ProductionCompanyModel.fromJson(e))
                  .toList() ??
              [],
      productionCountries:
          (json['production_countries'] as List<dynamic>?)
                  ?.map((e) => ProductionCountryModel.fromJson(e))
                  .toList() ??
              [],
      spokenLanguages: (json['spoken_languages'] as List<dynamic>?)
              ?.map((e) => SpokenLanguageModel.fromJson(e))
              .toList() ??
          [],
    );
  }
}

class GenreModel extends GenreEntity {
  const GenreModel({
    required super.id,
    required super.name,
  });

  factory GenreModel.fromJson(Map<String, dynamic> json) {
    return GenreModel(
      id: json['id'],
      name: json['name'] ?? '',
    );
  }
}

class ProductionCompanyModel extends ProductionCompanyEntity {
  const ProductionCompanyModel({
    required super.id,
    required super.name,
    super.logoPath,
    required super.originCountry,
  });

  factory ProductionCompanyModel.fromJson(Map<String, dynamic> json) {
    return ProductionCompanyModel(
      id: json['id'],
      name: json['name'] ?? '',
      logoPath: json['logo_path'],
      originCountry: json['origin_country'] ?? '',
    );
  }
}

class ProductionCountryModel extends ProductionCountryEntity {
  const ProductionCountryModel({
    required super.iso31661,
    required super.name,
  });

  factory ProductionCountryModel.fromJson(Map<String, dynamic> json) {
    return ProductionCountryModel(
      iso31661: json['iso_3166_1'] ?? '',
      name: json['name'] ?? '',
    );
  }
}

class SpokenLanguageModel extends SpokenLanguageEntity {
  const SpokenLanguageModel({
    required super.englishName,
    required super.iso6391,
    required super.name,
  });

  factory SpokenLanguageModel.fromJson(Map<String, dynamic> json) {
    return SpokenLanguageModel(
      englishName: json['english_name'] ?? '',
      iso6391: json['iso_639_1'] ?? '',
      name: json['name'] ?? '',
    );
  }
}
