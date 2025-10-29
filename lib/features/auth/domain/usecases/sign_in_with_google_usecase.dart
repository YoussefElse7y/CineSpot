import 'package:cine_spot/core/failure/failure.dart';
import 'package:cine_spot/features/auth/domain/entities/user_entity.dart';
import 'package:cine_spot/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class SignInWithGoogleUseCase {
  final AuthRepository repository;

  SignInWithGoogleUseCase(this.repository);

  Future<Either<Failure, UserEntity>> call() {
    return repository.signInWithGoogle();
  }
}