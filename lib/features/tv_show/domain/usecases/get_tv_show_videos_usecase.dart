import 'package:cine_spot/core/failure/failure.dart';
import 'package:cine_spot/features/tv_show/domain/entities/tv_show_videos_entity.dart';
import 'package:cine_spot/features/tv_show/domain/repository/tv_show_repository.dart';
import 'package:dartz/dartz.dart';

class GetTvShowVideosUseCase {
  final TvShowRepository _repository;
  GetTvShowVideosUseCase(this._repository);

  Future<Either<Failure, List<TvShowVideoResultEntity>>> call(
    int seriesId, {
    String? language,
  }) async {
    return await _repository.getTvShowVideos(seriesId, language: language);
  }
}
