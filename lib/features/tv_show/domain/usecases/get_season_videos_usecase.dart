import 'package:cine_spot/core/failure/failure.dart';
import 'package:cine_spot/features/tv_show/domain/entities/tv_season_videos_entity.dart';
import 'package:cine_spot/features/tv_show/domain/repository/tv_show_repository.dart';
import 'package:dartz/dartz.dart';

class GetSeasonVideosUseCase {
  final TvShowRepository _repository;
  GetSeasonVideosUseCase(this._repository);

  Future<Either<Failure, List<TvSeasonVideoItemEntity>>> call(
    int seriesId,
    int seasonNumber, {
    String? language,
  }) async {
    return await _repository.getSeasonVideos(
      seriesId,
      seasonNumber,
      language: language,
    );
  }
}
