import 'package:cine_spot/features/auth/domain/entities/failure.dart';
import 'package:cine_spot/features/movie/domain/entities/movie_videos_entity.dart';
import 'package:cine_spot/features/movie/domain/repository/movie_repository.dart';
import 'package:dartz/dartz.dart';

class GetMovieVideosUseCase {
  final MovieRepository movieRepository;

  GetMovieVideosUseCase(this.movieRepository);

  Future<Either<Failure, MovieVideosEntity>> execute(int movieId, {String? language}) async {
    return await movieRepository.getVideos(movieId, language: language);
  }
}
