import 'package:dartz/dartz.dart';
import '../../../auth/domain/entities/failure.dart';
import '../entities/profile_entity.dart';
import '../repositories/profile_repository.dart';

class AddFavoriteMovieUseCase {
  final ProfileRepository repository;

  AddFavoriteMovieUseCase(this.repository);

  Future<Either<Failure, ProfileEntity>> call(String userId, int movieId) {
    return repository.addFavoriteMovie(userId, movieId);
  }
}