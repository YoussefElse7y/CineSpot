import 'trending_tv_show_entity.dart';

class TrendingTvResponseEntity {
  final int page;
  final List<TrendingTvShowEntity> results;
  final int totalPages;
  final int totalResults;

  const TrendingTvResponseEntity({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });
}
