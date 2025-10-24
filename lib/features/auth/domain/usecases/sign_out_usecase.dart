import 'package:cine_spot/core/failure/failure.dart';
import 'package:cine_spot/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class SignOutUseCase {
  final AuthRepository repository;

  SignOutUseCase(this.repository);

  Future<Either<Failure, void>> call() {
    return repository.signOut();
  }
}