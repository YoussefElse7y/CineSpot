import 'package:cine_spot/core/failure/failure.dart';
import 'package:cine_spot/features/tv_show/domain/entities/tv_episode_videos_entity.dart';
import 'package:cine_spot/features/tv_show/domain/repository/tv_show_repository.dart';
import 'package:dartz/dartz.dart';

class GetEpisodeVideosUseCase {
  final TvShowRepository _repository;
  GetEpisodeVideosUseCase(this._repository);

  Future<Either<Failure, List<TvEpisodeVideoItemEntity>>> call(
    int seriesId,
    int seasonNumber,
    int episodeNumber, {
    String? language,
  }) async {
    return await _repository.getEpisodeVideos(
      seriesId,
      seasonNumber,
      episodeNumber,
      language: language,
    );
  }
}
