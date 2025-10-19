import 'package:dartz/dartz.dart';
import '../../../auth/domain/entities/failure.dart';
import '../repositories/profile_repository.dart';

class CheckProfileExistsUseCase {
  final ProfileRepository repository;

  CheckProfileExistsUseCase(this.repository);

  Future<Either<Failure, bool>> call(String userId) {
    return repository.checkProfileExists(userId);
  }
}