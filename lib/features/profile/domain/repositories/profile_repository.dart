import 'dart:io';
import 'package:dartz/dartz.dart';
import '../../../../core/failure/failure.dart';
import '../entities/profile_entity.dart';

abstract class ProfileRepository {
  Future<Either<Failure, ProfileEntity>> createProfile(ProfileEntity profile, File? imageFile);
  Future<Either<Failure, ProfileEntity>> updateProfile(ProfileEntity profile, File? imageFile);
  Future<Either<Failure, ProfileEntity?>> getProfile(String userId);
  Future<Either<Failure, bool>> checkProfileExists(String userId);

  // Movie IDs management
  Future<Either<Failure, ProfileEntity>> addFavoriteMovie(String userId, int movieId);
  Future<Either<Failure, ProfileEntity>> removeFavoriteMovie(String userId, int movieId);

  Future<Either<Failure, ProfileEntity>> addFavoriteTvShow(String userId, int movieId);
  Future<Either<Failure, ProfileEntity>> removeFavoriteTvShow(String userId, int movieId);

  Future<Either<Failure, ProfileEntity>> addFavoritePerson(String userId, int movieId);
  Future<Either<Failure, ProfileEntity>> removeFavoritePerson(String userId, int movieId);

  Future<Either<Failure, ProfileEntity>> addWishlistMovie(String userId, int movieId);
  Future<Either<Failure, ProfileEntity>> removeWishlistMovie(String userId, int movieId);

  Future<Either<Failure, ProfileEntity>> addWishlistTvShow(String userId, int movieId);
  Future<Either<Failure, ProfileEntity>> removeWishlistTvShow(String userId, int movieId);
}
