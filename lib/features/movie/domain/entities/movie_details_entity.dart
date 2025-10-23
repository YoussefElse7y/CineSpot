class MovieDetailsEntity {
  final int id;
  final String title;
  final String originalTitle;
  final String overview;
  final String? tagline;
  final String? backdropPath;
  final String? posterPath;
  final String? homepage;
  final String originalLanguage;
  final bool adult;
  final bool video;
  final double popularity;
  final double voteAverage;
  final int voteCount;
  final int? budget;
  final int? revenue;
  final int? runtime;
  final String releaseDate;
  final String status;
  final List<GenreEntity> genres;
  final List<ProductionCompanyEntity> productionCompanies;
  final List<ProductionCountryEntity> productionCountries;
  final List<SpokenLanguageEntity> spokenLanguages;

  const MovieDetailsEntity({
    required this.id,
    required this.title,
    required this.originalTitle,
    required this.overview,
    this.tagline,
    this.backdropPath,
    this.posterPath,
    this.homepage,
    required this.originalLanguage,
    required this.adult,
    required this.video,
    required this.popularity,
    required this.voteAverage,
    required this.voteCount,
    this.budget,
    this.revenue,
    this.runtime,
    required this.releaseDate,
    required this.status,
    required this.genres,
    required this.productionCompanies,
    required this.productionCountries,
    required this.spokenLanguages,
  });
}

class GenreEntity {
  final int id;
  final String name;

  const GenreEntity({
    required this.id,
    required this.name,
  });
}

class ProductionCompanyEntity {
  final int id;
  final String name;
  final String? logoPath;
  final String originCountry;

  const ProductionCompanyEntity({
    required this.id,
    required this.name,
    this.logoPath,
    required this.originCountry,
  });
}

class ProductionCountryEntity {
  final String iso31661;
  final String name;

  const ProductionCountryEntity({
    required this.iso31661,
    required this.name,
  });
}

class SpokenLanguageEntity {
  final String englishName;
  final String iso6391;
  final String name;

  const SpokenLanguageEntity({
    required this.englishName,
    required this.iso6391,
    required this.name,
  });
}
