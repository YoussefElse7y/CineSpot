import 'package:cine_spot/features/auth/domain/entities/failure.dart';
import 'package:cine_spot/features/movie/domain/entities/movie_review_entity.dart';
import 'package:cine_spot/features/movie/domain/repository/movie_repository.dart';
import 'package:dartz/dartz.dart';

class GetMovieReviewsUseCase {
  final MovieRepository movieRepository;

  GetMovieReviewsUseCase(this.movieRepository);

  Future<Either<Failure, List<MovieReviewEntity>>> execute(
    int movieId, {
    String? language,
    int? page,
  }) async {
    return await movieRepository.getReviews(movieId, language: language, page: page);
  }
}
