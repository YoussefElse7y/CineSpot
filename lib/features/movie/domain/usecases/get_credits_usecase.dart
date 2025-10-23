import 'package:cine_spot/features/auth/domain/entities/failure.dart';
import 'package:cine_spot/features/movie/domain/entities/credits_entity.dart';
import 'package:cine_spot/features/movie/domain/repository/movie_repository.dart';
import 'package:dartz/dartz.dart';

class GetCreditsUseCase {
  final MovieRepository movieRepository;

  GetCreditsUseCase(this.movieRepository);

  Future<Either<Failure, CreditsEntity>> execute(int movieId, {String? language}) async {
    return await movieRepository.getCredits(movieId, language: language);
  }
}
