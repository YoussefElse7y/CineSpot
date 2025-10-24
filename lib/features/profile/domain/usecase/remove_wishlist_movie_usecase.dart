import 'package:dartz/dartz.dart';
import '../../../../core/failure/failure.dart';
import '../entities/profile_entity.dart';
import '../repositories/profile_repository.dart';

class RemoveWishlistMovieUseCase {
  final ProfileRepository repository;

  RemoveWishlistMovieUseCase(this.repository);

  Future<Either<Failure, ProfileEntity>> call(String userId, int movieId) {
    return repository.removeWishlistMovie(userId, movieId);
  }
}