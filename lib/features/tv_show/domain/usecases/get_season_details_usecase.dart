import 'package:cine_spot/core/failure/failure.dart';
import 'package:cine_spot/features/tv_show/domain/entities/tv_season_details_entity.dart';
import 'package:cine_spot/features/tv_show/domain/repository/tv_show_repository.dart';
import 'package:dartz/dartz.dart';

class GetSeasonDetailsUseCase {
  final TvShowRepository _repository;
  GetSeasonDetailsUseCase(this._repository);

  Future<Either<Failure, TvSeasonDetailsEntity>> call(
    int seriesId,
    int seasonNumber, {
    String? language,
  }) async {
    return await _repository.getSeasonDetails(
      seriesId,
      seasonNumber,
      language: language,
    );
  }
}
