class MovieWatchProvidersEntity {
  final int id;
  final Map<String, CountryProviderEntity> results;

  const MovieWatchProvidersEntity({
    required this.id,
    required this.results,
  });
}

class CountryProviderEntity {
  final String? link;
  final List<WatchProviderEntity>? flatrate;
  final List<WatchProviderEntity>? rent;
  final List<WatchProviderEntity>? buy;
  final List<WatchProviderEntity>? ads;

  const CountryProviderEntity({
    this.link,
    this.flatrate,
    this.rent,
    this.buy,
    this.ads,
  });
}

class WatchProviderEntity {
  final String? logoPath;
  final int? providerId;
  final String? providerName;
  final int? displayPriority;

  const WatchProviderEntity({
    this.logoPath,
    this.providerId,
    this.providerName,
    this.displayPriority,
  });
}
