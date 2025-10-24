import 'package:cine_spot/core/failure/failure.dart';
import 'package:cine_spot/features/tv_show/domain/entities/tv_show_review_entity.dart';
import 'package:cine_spot/features/tv_show/domain/repository/tv_show_repository.dart';
import 'package:dartz/dartz.dart';

class GetTvShowReviewsUseCase {
  final TvShowRepository _repository;
  GetTvShowReviewsUseCase(this._repository);

  Future<Either<Failure, TvShowReviewEntity>> call(
    int seriesId, {
    String? language,
    int page = 1,
  }) async {
    return await _repository.getTvShowReviews(
      seriesId,
      language: language,
      page: page,
    );
  }
}
