import 'package:cine_spot/core/failure/failure.dart';
import 'package:cine_spot/features/movie/domain/entities/similar_movies_response_entity.dart';
import 'package:cine_spot/features/movie/domain/repository/movie_repository.dart';
import 'package:dartz/dartz.dart';

class GetSimilarMoviesUseCase {
  final MovieRepository movieRepository;

  GetSimilarMoviesUseCase(this.movieRepository);

  Future<Either<Failure, SimilarMoviesResponseEntity>> execute(
    int movieId, {
    String? language,
    int? page,
  }) async {
    return await movieRepository.getSimilar(movieId, language: language, page: page);
  }
}
