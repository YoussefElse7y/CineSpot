import 'package:dartz/dartz.dart';
import '../../../../core/failure/failure.dart';
import '../entities/profile_entity.dart';
import '../repositories/profile_repository.dart';

class RemoveFavoritePersonUseCase {
  final ProfileRepository repository;

  RemoveFavoritePersonUseCase(this.repository);

  Future<Either<Failure, ProfileEntity>> call(String userId, int personId) {
    return repository.removeFavoritePerson(userId, personId);
  }
}