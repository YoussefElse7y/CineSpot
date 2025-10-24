import 'package:cine_spot/core/failure/failure.dart';
import 'package:cine_spot/features/tv_show/domain/entities/tv_episode_details_entity.dart';
import 'package:cine_spot/features/tv_show/domain/repository/tv_show_repository.dart';
import 'package:dartz/dartz.dart';

class GetEpisodeDetailsUseCase {
  final TvShowRepository _repository;
  GetEpisodeDetailsUseCase(this._repository);

  Future<Either<Failure, TvEpisodeDetailsEntity>> call(
    int seriesId,
    int seasonNumber,
    int episodeNumber, {
    String? language,
  }) async {
    return await _repository.getEpisodeDetails(
      seriesId,
      seasonNumber,
      episodeNumber,
      language: language,
    );
  }
}
