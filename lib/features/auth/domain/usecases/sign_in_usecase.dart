import 'package:cine_spot/core/failure/failure.dart';
import 'package:cine_spot/features/auth/domain/entities/user_entity.dart';
import 'package:cine_spot/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class SignInUseCase {
  final AuthRepository repository;

  SignInUseCase(this.repository);

  Future<Either<Failure, UserEntity>> call(String email, String password) {
    return repository.signInWithEmail(email, password);
  }
}