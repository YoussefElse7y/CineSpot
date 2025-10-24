import 'package:dartz/dartz.dart';
import '../../../../core/failure/failure.dart';
import '../entities/profile_entity.dart';
import '../repositories/profile_repository.dart';

class AddFavoriteTvShowUseCase {
  final ProfileRepository repository;

  AddFavoriteTvShowUseCase(this.repository);

  Future<Either<Failure, ProfileEntity>> call(String userId, int showId) {
    return repository.addFavoriteTvShow(userId, showId);
  }
}