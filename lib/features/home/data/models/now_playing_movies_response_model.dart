import 'package:cine_spot/features/home/data/models/now_palying_movie_model.dart';
import 'package:cine_spot/features/home/domain/entities/now_playing_movie_response_entity.dart';

class NowPlayingMoviesResponseModel extends NowPlayingMoviesResponseEntity {
    const NowPlayingMoviesResponseModel({
    required super.dates,
    required super.page,
    required List<NowPlayingMovieModel> super.results,
    required super.totalPages,
    required super.totalResults,
  });

  factory NowPlayingMoviesResponseModel.fromJson(Map<String, dynamic> json) {
    return NowPlayingMoviesResponseModel(
      dates: DatesModel.fromJson(json['dates']),
      page: json['page'],
      results: List<NowPlayingMovieModel>.from(
          json['results'].map((x) => NowPlayingMovieModel.fromJson(x))),
      totalPages: json['total_pages'],
      totalResults: json['total_results'],
    );
  }

  Map<String, dynamic> toJson() => {
        'dates': (dates as DatesModel).toJson(),
        'page': page,
        'results': results.map((x) => (x as NowPlayingMovieModel).toJson()).toList(),
        'total_pages': totalPages,
        'total_results': totalResults,
      };
}

class DatesModel extends DatesEntity {
  const DatesModel({
    required String maximum,
    required String minimum,
  }) : super(maximum: maximum, minimum: minimum);

  factory DatesModel.fromJson(Map<String, dynamic> json) {
    return DatesModel(
      maximum: json['maximum'],
      minimum: json['minimum'],
    );
  }

  Map<String, dynamic> toJson() => {
        'maximum': maximum,
        'minimum': minimum,
      };
}