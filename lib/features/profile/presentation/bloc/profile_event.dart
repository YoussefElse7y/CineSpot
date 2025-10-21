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

  // New events for movie management
  const factory ProfileEvent.addFavoriteMovie(String userId, int movieId) = AddFavoriteMovie;
  const factory ProfileEvent.removeFavoriteMovie(String userId, int movieId) = RemoveFavoriteMovie;
  const factory ProfileEvent.addWishlistMovie(String userId, int movieId) = AddWishlistMovie;
  const factory ProfileEvent.removeWishlistMovie(String userId, int movieId) = RemoveWishlistMovie;
}