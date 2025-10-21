import 'dart:io';
import 'package:dartz/dartz.dart';
import '../../../auth/domain/entities/failure.dart';
import '../../domain/entities/profile_entity.dart';
import '../../domain/repositories/profile_repository.dart';
import '../datasources/cloudinary_service.dart';
import '../datasources/profile_remote_datasource.dart';
import '../models/profile_model.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource remoteDataSource;
  final CloudinaryService cloudinaryService;

  ProfileRepositoryImpl(
    {
    required this.remoteDataSource,
    required this.cloudinaryService,
  }
  );

  @override
  Future<Either<Failure, ProfileEntity>> createProfile(
    ProfileEntity profile,
    File? imageFile,
  ) async {
    try {
      String? photoUrl;
      
      // Upload image to Cloudinary if provided
      if (imageFile != null) {
        photoUrl = await cloudinaryService.uploadImage(imageFile);
      }

      final profileModel = ProfileModel(
        userId: profile.userId,
        fullName: profile.fullName,
        nickname: profile.nickname,
        email: profile.email,
        phoneNumber: profile.phoneNumber,
        countryCode: profile.countryCode,
        gender: profile.gender,
        photoUrl: photoUrl,
        favoriteIds: profile.favoriteIds ?? [],
        wishlistIds: profile.wishlistIds ?? [],
      );

      final createdProfile = await remoteDataSource.createProfile(profileModel);
      return Right(createdProfile.toEntity());
    } catch (e) {
      return Left(Failure.serverFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProfileEntity>> updateProfile(
    ProfileEntity profile,
    File? imageFile,
  ) async {
    try {
      String? photoUrl = profile.photoUrl;
      
      // Upload new image to Cloudinary if provided
      if (imageFile != null) {
        photoUrl = await cloudinaryService.uploadImage(imageFile);
      }

      final profileModel = ProfileModel(
        userId: profile.userId,
        fullName: profile.fullName,
        nickname: profile.nickname,
        email: profile.email,
        phoneNumber: profile.phoneNumber,
        countryCode: profile.countryCode,
        gender: profile.gender,
        photoUrl: photoUrl,
        createdAt: profile.createdAt,
      );

      final updatedProfile = await remoteDataSource.updateProfile(profileModel);
      return Right(updatedProfile.toEntity());
    } catch (e) {
      return Left(Failure.serverFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProfileEntity?>> getProfile(String userId) async {
    try {
      final profile = await remoteDataSource.getProfile(userId);
      return Right(profile?.toEntity());
    } catch (e) {
      return Left(Failure.serverFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> checkProfileExists(String userId) async {
    try {
      final exists = await remoteDataSource.checkProfileExists(userId);
      return Right(exists);
    } catch (e) {
      return Left(Failure.serverFailure(e.toString()));
    }
  }

    @override
  Future<Either<Failure, ProfileEntity>> addFavoriteMovie(
    String userId,
    int movieId,
  ) async {
    try {
      final profile = await remoteDataSource.getProfile(userId);
      if (profile == null) {
        return Left(Failure.serverFailure('Profile not found'));
      }

      final favoriteIds = List<int>.from(profile.favoriteIds ?? []);
      if (!favoriteIds.contains(movieId)) {
        favoriteIds.add(movieId);
      }

      final updatedProfile = profile.copyWith(favoriteIds: favoriteIds);
      final result = await remoteDataSource.updateProfile(updatedProfile);
      return Right(result.toEntity());
    } catch (e) {
      return Left(Failure.serverFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProfileEntity>> removeFavoriteMovie(
    String userId,
    int movieId,
  ) async {
    try {
      final profile = await remoteDataSource.getProfile(userId);
      if (profile == null) {
        return Left(Failure.serverFailure('Profile not found'));
      }

      final favoriteIds = List<int>.from(profile.favoriteIds ?? []);
      favoriteIds.remove(movieId);

      final updatedProfile = profile.copyWith(favoriteIds: favoriteIds);
      final result = await remoteDataSource.updateProfile(updatedProfile);
      return Right(result.toEntity());
    } catch (e) {
      return Left(Failure.serverFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProfileEntity>> addWishlistMovie(
    String userId,
    int movieId,
  ) async {
    try {
      final profile = await remoteDataSource.getProfile(userId);
      if (profile == null) {
        return Left(Failure.serverFailure('Profile not found'));
      }

      final wishlistIds = List<int>.from(profile.wishlistIds ?? []);
      if (!wishlistIds.contains(movieId)) {
        wishlistIds.add(movieId);
      }

      final updatedProfile = profile.copyWith(wishlistIds: wishlistIds);
      final result = await remoteDataSource.updateProfile(updatedProfile);
      return Right(result.toEntity());
    } catch (e) {
      return Left(Failure.serverFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProfileEntity>> removeWishlistMovie(
    String userId,
    int movieId,
  ) async {
    try {
      final profile = await remoteDataSource.getProfile(userId);
      if (profile == null) {
        return Left(Failure.serverFailure('Profile not found'));
      }

      final wishlistIds = List<int>.from(profile.wishlistIds ?? []);
      wishlistIds.remove(movieId);

      final updatedProfile = profile.copyWith(wishlistIds: wishlistIds);
      final result = await remoteDataSource.updateProfile(updatedProfile);
      return Right(result.toEntity());
    } catch (e) {
      return Left(Failure.serverFailure(e.toString()));
    }
  }
}