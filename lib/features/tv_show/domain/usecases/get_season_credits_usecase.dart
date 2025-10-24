import 'package:cine_spot/core/failure/failure.dart';
import 'package:cine_spot/features/tv_show/domain/entities/tv_season_credits_entity.dart';
import 'package:cine_spot/features/tv_show/domain/repository/tv_show_repository.dart';
import 'package:dartz/dartz.dart';

class GetSeasonCreditsUseCase {
  final TvShowRepository _repository;
  GetSeasonCreditsUseCase(this._repository);

  Future<Either<Failure, TvSeasonCreditsEntity>> call(
    int seriesId,
    int seasonNumber, {
    String? language,
  }) async {
    return await _repository.getSeasonCredits(
      seriesId,
      seasonNumber,
      language: language,
    );
  }
}
