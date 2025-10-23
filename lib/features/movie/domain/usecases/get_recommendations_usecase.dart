import 'package:cine_spot/features/auth/domain/entities/failure.dart';
import 'package:cine_spot/features/movie/domain/entities/recommendations_entity.dart';
import 'package:cine_spot/features/movie/domain/repository/movie_repository.dart';
import 'package:dartz/dartz.dart';

class GetRecommendationsUseCase {
  final MovieRepository movieRepository;

  GetRecommendationsUseCase(this.movieRepository);

  Future<Either<Failure, RecommendationsEntity>> execute(
    int movieId, {
    String? language,
    int? page,
  }) async {
    return await movieRepository.getRecommendations(movieId, language: language, page: page);
  }
}
