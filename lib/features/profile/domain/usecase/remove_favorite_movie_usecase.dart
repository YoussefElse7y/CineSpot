import 'package:dartz/dartz.dart';
import '../../../auth/domain/entities/failure.dart';
import '../entities/profile_entity.dart';
import '../repositories/profile_repository.dart';

class RemoveFavoriteMovieUseCase {
  final ProfileRepository repository;

  RemoveFavoriteMovieUseCase(this.repository);

  Future<Either<Failure, ProfileEntity>> call(String userId, int movieId) {
    return repository.removeFavoriteMovie(userId, movieId);
  }
}