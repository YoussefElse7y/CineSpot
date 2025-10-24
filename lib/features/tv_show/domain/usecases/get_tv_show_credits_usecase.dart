import 'package:cine_spot/core/failure/failure.dart';
import 'package:cine_spot/features/tv_show/domain/entities/tv_show_credits_entity.dart';
import 'package:cine_spot/features/tv_show/domain/repository/tv_show_repository.dart';
import 'package:dartz/dartz.dart';

class GetTvShowCreditsUseCase {
  final TvShowRepository _repository;
  GetTvShowCreditsUseCase(this._repository);

  Future<Either<Failure, TvShowCreditsEntity>> call(
    int seriesId, {
    String? language,
  }) async {
    return await _repository.getTvShowCredits(seriesId, language: language);
  }
}
