import 'package:dartz/dartz.dart';
import '../../../../core/failure/failure.dart';
import '../entities/profile_entity.dart';
import '../repositories/profile_repository.dart';

class AddFavoritePersonUseCase {
  final ProfileRepository repository;

  AddFavoritePersonUseCase(this.repository);

  Future<Either<Failure, ProfileEntity>> call(String userId, int personId) {
    return repository.addFavoritePerson(userId, personId);
  }
}