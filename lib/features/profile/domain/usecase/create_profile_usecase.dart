import 'dart:io';
import 'package:dartz/dartz.dart';
import '../../../auth/domain/entities/failure.dart';
import '../entities/profile_entity.dart';
import '../repositories/profile_repository.dart';

class CreateProfileUseCase {
  final ProfileRepository repository;

  CreateProfileUseCase(this.repository);

  Future<Either<Failure, ProfileEntity>> call(
    ProfileEntity profile,
    File? imageFile,
  ) {
    return repository.createProfile(profile, imageFile);
  }
}