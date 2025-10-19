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
}