import 'package:dartz/dartz.dart';
import '../../../auth/domain/entities/failure.dart';
import '../entities/profile_entity.dart';
import '../repositories/profile_repository.dart';

class RemoveWishlistTvShowUseCase {
  final ProfileRepository repository;

  RemoveWishlistTvShowUseCase(this.repository);

  Future<Either<Failure, ProfileEntity>> call(String userId, int tvShowId) {
    return repository.removeWishlistMovie(userId, tvShowId);
  }
}