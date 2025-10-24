import 'package:cine_spot/core/failure/failure.dart';
import 'package:cine_spot/features/auth/domain/entities/user_entity.dart';
import 'package:cine_spot/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class SignUpUseCase {
  final AuthRepository repository;

  SignUpUseCase(this.repository);

  Future<Either<Failure, UserEntity>> call(String email, String password) {
    return repository.signUpWithEmail(email, password);
  }
}