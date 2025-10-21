import 'package:cine_spot/features/home/domain/entities/trending_tv_response_entity.dart';
import 'trending_tv_show_model.dart';

class TrendingTvResponseModel extends TrendingTvResponseEntity {
  const TrendingTvResponseModel({
    required super.page,
    required List<TrendingTvShowModel> super.results,
    required super.totalPages,
    required super.totalResults,
  });

  factory TrendingTvResponseModel.fromJson(Map<String, dynamic> json) {
    return TrendingTvResponseModel(
      page: json['page'],
      results: (json['results'] as List<dynamic>?)
              ?.map((e) => TrendingTvShowModel.fromJson(e))
              .toList() ??
          [],
      totalPages: json['total_pages'] ?? 0,
      totalResults: json['total_results'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'results': results.map((e) => (e as TrendingTvShowModel).toJson()).toList(),
      'total_pages': totalPages,
      'total_results': totalResults,
    };
  }
}
