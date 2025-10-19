import 'package:dartz/dartz.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/entities/failure.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, UserEntity>> signInWithEmail(
      String email, String password) async {
    try {
      final user = await remoteDataSource.signInWithEmail(email, password);
      return Right(user.toEntity());
    } catch (e) {
      return Left(Failure.authFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signUpWithEmail(
      String email, String password) async {
    try {
      final user = await remoteDataSource.signUpWithEmail(email, password);
      return Right(user.toEntity());
    } catch (e) {
      return Left(Failure.authFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      await remoteDataSource.signOut();
      return const Right(null);
    } catch (e) {
      return Left(Failure.authFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity?>> getCurrentUser() async {
    try {
      final user = await remoteDataSource.getCurrentUser();
      return Right(user?.toEntity());
    } catch (e) {
      return Left(Failure.authFailure(e.toString()));
    }
  }

  @override
  Stream<UserEntity?> get authStateChanges {
    return remoteDataSource.authStateChanges.map(
      (user) => user?.toEntity(),
    );
  }
}