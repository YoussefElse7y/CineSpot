import 'package:cine_spot/core/failure/failure.dart';
import 'package:cine_spot/features/tv_show/domain/entities/tv_show_recommendations_entity.dart';
import 'package:cine_spot/features/tv_show/domain/repository/tv_show_repository.dart';
import 'package:dartz/dartz.dart';

class GetTvShowRecommendationsUseCase {
  final TvShowRepository _repository;
  GetTvShowRecommendationsUseCase(this._repository);

  Future<Either<Failure, TvShowRecommendationsEntity>> call(
    int seriesId, {
    String? language,
    int page = 1,
  }) async {
    return await _repository.getTvShowRecommendations(
      seriesId,
      language: language,
      page: page,
    );
  }
}
