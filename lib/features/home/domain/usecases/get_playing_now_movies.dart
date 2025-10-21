import 'package:cine_spot/features/auth/domain/entities/failure.dart';
import 'package:cine_spot/features/home/domain/entities/now_playing_movie_response_entity.dart';
import 'package:cine_spot/features/home/domain/repositories/home_repo.dart';
import 'package:dartz/dartz.dart';

class GetPlayingNowMoviesUseCase {
  final HomeRepo repository;
  GetPlayingNowMoviesUseCase({required this.repository});
  Future<Either<Failure, NowPlayingMoviesResponseEntity>> call(
    String language,
    int page,
  ) async {
    return await repository.getNowPlayingMovies(language, page);
  }
}
