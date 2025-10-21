import 'dart:io';
import 'package:dartz/dartz.dart';
import '../../../auth/domain/entities/failure.dart';
import '../entities/profile_entity.dart';

abstract class ProfileRepository {
  Future<Either<Failure, ProfileEntity>> createProfile(ProfileEntity profile, File? imageFile);
  Future<Either<Failure, ProfileEntity>> updateProfile(ProfileEntity profile, File? imageFile);
  Future<Either<Failure, ProfileEntity?>> getProfile(String userId);
  Future<Either<Failure, bool>> checkProfileExists(String userId);

  // Movie IDs management
  Future<Either<Failure, ProfileEntity>> addFavoriteMovie(String userId, int movieId);
  Future<Either<Failure, ProfileEntity>> removeFavoriteMovie(String userId, int movieId);
  Future<Either<Failure, ProfileEntity>> addWishlistMovie(String userId, int movieId);
  Future<Either<Failure, ProfileEntity>> removeWishlistMovie(String userId, int movieId);
}
