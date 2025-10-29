import 'package:dartz/dartz.dart';
import '../entities/user_entity.dart';
import '../../../../core/failure/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> signInWithEmail(String email, String password);
  Future<Either<Failure, UserEntity>> signUpWithEmail(String email, String password);
  Future<Either<Failure, void>> signOut();
  Future<Either<Failure, UserEntity?>> getCurrentUser();
  Stream<UserEntity?> get authStateChanges;
  Future<Either<Failure, UserEntity>> signInWithGoogle();

}