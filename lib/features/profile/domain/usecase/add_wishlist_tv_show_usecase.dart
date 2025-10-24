import 'package:dartz/dartz.dart';
import '../../../../core/failure/failure.dart';
import '../entities/profile_entity.dart';
import '../repositories/profile_repository.dart';

class AddWishlistTvShowUseCase {
  final ProfileRepository repository;

  AddWishlistTvShowUseCase(this.repository);

  Future<Either<Failure, ProfileEntity>> call(String userId, int tvShowId) {
    return repository.addWishlistTvShow(userId, tvShowId);
  }
}