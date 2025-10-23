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
        favoriteMoviesIds: profile.favoriteMoviesIds ?? [],
        favoritePersonIds: profile.favoritePersonIds ?? [],
        favoriteTvIds: profile.favoriteTvIds ?? [],
        wishlistMoviesIds: profile.wishlistMoviesIds ?? [],
        wishlistTvIds: profile.wishlistTvIds ?? [],
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

      final favoriteIds = List<int>.from(profile.favoriteMoviesIds ?? []);
      if (!favoriteIds.contains(movieId)) {
        favoriteIds.add(movieId);
      }

      final updatedProfile = profile.copyWith(favoriteMoviesIds: favoriteIds);
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

      final favoriteIds = List<int>.from(profile.favoriteMoviesIds ?? []);
      favoriteIds.remove(movieId);

      final updatedProfile = profile.copyWith(favoriteMoviesIds: favoriteIds);
      final result = await remoteDataSource.updateProfile(updatedProfile);
      return Right(result.toEntity());
    } catch (e) {
      return Left(Failure.serverFailure(e.toString()));
    }
  }

  
    @override
  Future<Either<Failure, ProfileEntity>> addFavoriteTvShow(
    String userId,
    int movieId,
  ) async {
    try {
      final profile = await remoteDataSource.getProfile(userId);
      if (profile == null) {
        return Left(Failure.serverFailure('Profile not found'));
      }

      final favoriteIds = List<int>.from(profile.favoriteTvIds ?? []);
      if (!favoriteIds.contains(movieId)) {
        favoriteIds.add(movieId);
      }

      final updatedProfile = profile.copyWith(favoriteTvIds: favoriteIds);
      final result = await remoteDataSource.updateProfile(updatedProfile);
      return Right(result.toEntity());
    } catch (e) {
      return Left(Failure.serverFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProfileEntity>> removeFavoriteTvShow(
    String userId,
    int movieId,
  ) async {
    try {
      final profile = await remoteDataSource.getProfile(userId);
      if (profile == null) {
        return Left(Failure.serverFailure('Profile not found'));
      }

      final favoriteIds = List<int>.from(profile.favoriteTvIds ?? []);
      favoriteIds.remove(movieId);

      final updatedProfile = profile.copyWith(favoriteTvIds: favoriteIds);
      final result = await remoteDataSource.updateProfile(updatedProfile);
      return Right(result.toEntity());
    } catch (e) {
      return Left(Failure.serverFailure(e.toString()));
    }
  }

     @override
  Future<Either<Failure, ProfileEntity>> addFavoritePerson(
    String userId,
    int movieId,
  ) async {
    try {
      final profile = await remoteDataSource.getProfile(userId);
      if (profile == null) {
        return Left(Failure.serverFailure('Profile not found'));
      }

      final favoriteIds = List<int>.from(profile.favoritePersonIds ?? []);
      if (!favoriteIds.contains(movieId)) {
        favoriteIds.add(movieId);
      }

      final updatedProfile = profile.copyWith(favoritePersonIds: favoriteIds);
      final result = await remoteDataSource.updateProfile(updatedProfile);
      return Right(result.toEntity());
    } catch (e) {
      return Left(Failure.serverFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProfileEntity>> removeFavoritePerson(
    String userId,
    int movieId,
  ) async {
    try {
      final profile = await remoteDataSource.getProfile(userId);
      if (profile == null) {
        return Left(Failure.serverFailure('Profile not found'));
      }

      final favoriteIds = List<int>.from(profile.favoritePersonIds ?? []);
      favoriteIds.remove(movieId);

      final updatedProfile = profile.copyWith(favoritePersonIds: favoriteIds);
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

      final wishlistIds = List<int>.from(profile.wishlistMoviesIds ?? []);
      if (!wishlistIds.contains(movieId)) {
        wishlistIds.add(movieId);
      }

      final updatedProfile = profile.copyWith(wishlistMoviesIds: wishlistIds);
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

      final wishlistIds = List<int>.from(profile.wishlistMoviesIds ?? []);
      wishlistIds.remove(movieId);

      final updatedProfile = profile.copyWith(wishlistMoviesIds: wishlistIds);
      final result = await remoteDataSource.updateProfile(updatedProfile);
      return Right(result.toEntity());
    } catch (e) {
      return Left(Failure.serverFailure(e.toString()));
    }
  }

  
  @override
  Future<Either<Failure, ProfileEntity>> addWishlistTvShow(
    String userId,
    int movieId,
  ) async {
    try {
      final profile = await remoteDataSource.getProfile(userId);
      if (profile == null) {
        return Left(Failure.serverFailure('Profile not found'));
      }

      final wishlistIds = List<int>.from(profile.wishlistTvIds ?? []);
      if (!wishlistIds.contains(movieId)) {
        wishlistIds.add(movieId);
      }

      final updatedProfile = profile.copyWith(wishlistTvIds: wishlistIds);
      final result = await remoteDataSource.updateProfile(updatedProfile);
      return Right(result.toEntity());
    } catch (e) {
      return Left(Failure.serverFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProfileEntity>> removeWishlistTvShow(
    String userId,
    int movieId,
  ) async {
    try {
      final profile = await remoteDataSource.getProfile(userId);
      if (profile == null) {
        return Left(Failure.serverFailure('Profile not found'));
      }

      final wishlistIds = List<int>.from(profile.wishlistTvIds ?? []);
      wishlistIds.remove(movieId);

      final updatedProfile = profile.copyWith(wishlistTvIds: wishlistIds);
      final result = await remoteDataSource.updateProfile(updatedProfile);
      return Right(result.toEntity());
    } catch (e) {
      return Left(Failure.serverFailure(e.toString()));
    }
  }
  

}