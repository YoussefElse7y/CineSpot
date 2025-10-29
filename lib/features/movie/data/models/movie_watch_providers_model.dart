
import 'package:cine_spot/features/movie/domain/entities/movie_watch_providers_entity.dart';

class MovieWatchProvidersModel extends MovieWatchProvidersEntity {
  const MovieWatchProvidersModel({
    required super.id,
    required Map<String, CountryProviderModel> super.results,
  });

  factory MovieWatchProvidersModel.fromJson(Map<String, dynamic> json) {
    final resultsMap = <String, CountryProviderModel>{};
    if (json['results'] != null) {
      (json['results'] as Map<String, dynamic>).forEach((key, value) {
        resultsMap[key] = CountryProviderModel.fromJson(value);
      });
    }

    return MovieWatchProvidersModel(
      id: json['id'] ?? 0,
      results: resultsMap,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['results'] = results.map((key, value) => MapEntry(key, (value as CountryProviderModel).toJson()));
    return map;
  }

  MovieWatchProvidersEntity toEntity() {
    return MovieWatchProvidersEntity(
      id: id,
      results: results.map((key, value) => MapEntry(key, (value as CountryProviderModel).toEntity())),
    );
  }
}

class CountryProviderModel extends CountryProviderEntity {
  const CountryProviderModel({
    super.link,
    List<WatchProviderModel>? super.flatrate,
    List<WatchProviderModel>? super.rent,
    List<WatchProviderModel>? super.buy,
    List<WatchProviderModel>? super.ads,
  });

  factory CountryProviderModel.fromJson(Map<String, dynamic> json) {
    List<WatchProviderModel>? parseProviders(String key) {
      if (json[key] == null) return null;
      return List<WatchProviderModel>.from(
        (json[key] as List).map((e) => WatchProviderModel.fromJson(e)),
      );
    }

    return CountryProviderModel(
      link: json['link'],
      flatrate: parseProviders('flatrate'),
      rent: parseProviders('rent'),
      buy: parseProviders('buy'),
      ads: parseProviders('ads'),
    );
  }

  Map<String, dynamic> toJson() => {
        'link': link,
        if (flatrate != null) 'flatrate': flatrate!.map((e) => (e as WatchProviderModel).toJson()).toList(),
        if (rent != null) 'rent': rent!.map((e) => (e as WatchProviderModel).toJson()).toList(),
        if (buy != null) 'buy': buy!.map((e) => (e as WatchProviderModel).toJson()).toList(),
        if (ads != null) 'ads': ads!.map((e) => (e as WatchProviderModel).toJson()).toList(),
      };

  CountryProviderEntity toEntity() => CountryProviderEntity(
        link: link,
        flatrate: flatrate?.map((e) => (e as WatchProviderModel).toEntity()).toList(),
        rent: rent?.map((e) => (e as WatchProviderModel).toEntity()).toList(),
        buy: buy?.map((e) => (e as WatchProviderModel).toEntity()).toList(),
        ads: ads?.map((e) => (e as WatchProviderModel).toEntity()).toList(),
      );
}

class WatchProviderModel extends WatchProviderEntity {
  const WatchProviderModel({
    super.logoPath,
    super.providerId,
    super.providerName,
    super.displayPriority,
  });

  factory WatchProviderModel.fromJson(Map<String, dynamic> json) {
    return WatchProviderModel(
      logoPath: json['logo_path'],
      providerId: json['provider_id'],
      providerName: json['provider_name'],
      displayPriority: json['display_priority'],
    );
  }

  Map<String, dynamic> toJson() => {
        'logo_path': logoPath,
        'provider_id': providerId,
        'provider_name': providerName,
        'display_priority': displayPriority,
      };

  WatchProviderEntity toEntity() => WatchProviderEntity(
        logoPath: logoPath,
        providerId: providerId,
        providerName: providerName,
        displayPriority: displayPriority,
      );
}
