class CompanySearchResultEntity {
  final int id;
  final String? logoPath;
  final String name;
  final String originCountry;

  const CompanySearchResultEntity({
    required this.id,
    this.logoPath,
    required this.name,
    required this.originCountry,
  });
}
