part of 'profile_bloc.dart';

@freezed
abstract class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.createProfile(
    ProfileEntity profile,
    File? imageFile,
  ) = CreateProfile;
  
  const factory ProfileEvent.updateProfile(
    ProfileEntity profile,
    File? imageFile,
  ) = UpdateProfile;
  
  const factory ProfileEvent.loadProfile(String userId) = LoadProfile;
  
  const factory ProfileEvent.checkProfileExists(String userId) = CheckProfileExists;
}