import 'package:cine_spot/core/failure/failure.dart';
import 'package:cine_spot/features/tv_show/domain/entities/tv_episode_credits_entity.dart';
import 'package:cine_spot/features/tv_show/domain/repository/tv_show_repository.dart';
import 'package:dartz/dartz.dart';

class GetEpisodeCreditsUseCase {
  final TvShowRepository _repository;
  GetEpisodeCreditsUseCase(this._repository);

  Future<Either<Failure, TvEpisodeCreditsEntity>> call(
    int seriesId,
    int seasonNumber,
    int episodeNumber, {
    String? language,
  }) async {
    return await _repository.getEpisodeCredits(
      seriesId,
      seasonNumber,
      episodeNumber,
      language: language,
    );
  }
}
