import 'dart:io';
import 'package:cine_spot/features/profile/domain/usecase/add_favorite_movie_usecase.dart';
import 'package:cine_spot/features/profile/domain/usecase/add_wishlist_movie_usecase.dart';
import 'package:cine_spot/features/profile/domain/usecase/check_profile_exists_usecase.dart';
import 'package:cine_spot/features/profile/domain/usecase/create_profile_usecase.dart';
import 'package:cine_spot/features/profile/domain/usecase/get_profile_usecase.dart';
import 'package:cine_spot/features/profile/domain/usecase/remove_favorite_movie_usecase.dart';
import 'package:cine_spot/features/profile/domain/usecase/remove_wishlist_movie_usecase.dart';
import 'package:cine_spot/features/profile/domain/usecase/update_profile_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/profile_entity.dart';

part 'profile_bloc.freezed.dart';
part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final CreateProfileUseCase createProfileUseCase;
  final UpdateProfileUseCase updateProfileUseCase;
  final GetProfileUseCase getProfileUseCase;
  final CheckProfileExistsUseCase checkProfileExistsUseCase;
  final AddFavoriteMovieUseCase addFavoriteMovieUseCase;
  final RemoveFavoriteMovieUseCase removeFavoriteMovieUseCase;
  final AddWishlistMovieUseCase addWishlistMovieUseCase;
  final RemoveWishlistMovieUseCase removeWishlistMovieUseCase;

  ProfileBloc({
    required this.createProfileUseCase,
    required this.updateProfileUseCase,
    required this.getProfileUseCase,
    required this.checkProfileExistsUseCase,
    required this.addFavoriteMovieUseCase,
    required this.removeFavoriteMovieUseCase,
    required this.addWishlistMovieUseCase,
    required this.removeWishlistMovieUseCase,
  }) : super(const ProfileState.initial()) {
    on<ProfileEvent>((event, emit) async {
      await event.when(
        createProfile: (profile, imageFile) =>
            _onCreateProfile(profile, imageFile, emit),
        updateProfile: (profile, imageFile) =>
            _onUpdateProfile(profile, imageFile, emit),
        loadProfile: (userId) => _onLoadProfile(userId, emit),
        checkProfileExists: (userId) => _onCheckProfileExists(userId, emit),
        addFavoriteMovie: (userId, movieId) =>
            _onAddFavoriteMovie(userId, movieId, emit),
        removeFavoriteMovie: (userId, movieId) =>
            _onRemoveFavoriteMovie(userId, movieId, emit),
        addWishlistMovie: (userId, movieId) =>
            _onAddWishlistMovie(userId, movieId, emit),
        removeWishlistMovie: (userId, movieId) =>
            _onRemoveWishlistMovie(userId, movieId, emit),
      );
    });
  }

  Future<void> _onCreateProfile(
    ProfileEntity profile,
    File? imageFile,
    Emitter<ProfileState> emit,
  ) async {
    emit(const ProfileState.loading());
    final result = await createProfileUseCase(profile, imageFile);
    result.fold(
      (failure) => emit(ProfileState.error(failure.toString())),
      (profile) => emit(ProfileState.loaded(profile)),
    );
  }

  Future<void> _onUpdateProfile(
    ProfileEntity profile,
    File? imageFile,
    Emitter<ProfileState> emit,
  ) async {
    emit(const ProfileState.loading());
    final result = await updateProfileUseCase(profile, imageFile);
    result.fold(
      (failure) => emit(ProfileState.error(failure.toString())),
      (profile) => emit(ProfileState.loaded(profile)),
    );
  }

  Future<void> _onLoadProfile(
    String userId,
    Emitter<ProfileState> emit,
  ) async {
    emit(const ProfileState.loading());
    final result = await getProfileUseCase(userId);
    result.fold(
      (failure) => emit(ProfileState.error(failure.toString())),
      (profile) {
        if (profile != null) {
          emit(ProfileState.loaded(profile));
        } else {
          emit(const ProfileState.notFound());
        }
      },
    );
  }

  Future<void> _onCheckProfileExists(
    String userId,
    Emitter<ProfileState> emit,
  ) async {
    final result = await checkProfileExistsUseCase(userId);
    result.fold(
      (failure) => emit(ProfileState.error(failure.toString())),
      (exists) {
        if (exists) {
          add(ProfileEvent.loadProfile(userId));
        } else {
          emit(const ProfileState.notFound());
        }
      },
    );
  }

  Future<void> _onAddFavoriteMovie(
    String userId,
    int movieId,
    Emitter<ProfileState> emit,
  ) async {
    final result = await addFavoriteMovieUseCase(userId, movieId);
    result.fold(
      (failure) => emit(ProfileState.error(failure.toString())),
      (profile) => emit(ProfileState.loaded(profile)),
    );
  }

  Future<void> _onRemoveFavoriteMovie(
    String userId,
    int movieId,
    Emitter<ProfileState> emit,
  ) async {
    final result = await removeFavoriteMovieUseCase(userId, movieId);
    result.fold(
      (failure) => emit(ProfileState.error(failure.toString())),
      (profile) => emit(ProfileState.loaded(profile)),
    );
  }

  Future<void> _onAddWishlistMovie(
    String userId,
    int movieId,
    Emitter<ProfileState> emit,
  ) async {
    final result = await addWishlistMovieUseCase(userId, movieId);
    result.fold(
      (failure) => emit(ProfileState.error(failure.toString())),
      (profile) => emit(ProfileState.loaded(profile)),
    );
  }

  Future<void> _onRemoveWishlistMovie(
    String userId,
    int movieId,
    Emitter<ProfileState> emit,
  ) async {
    final result = await removeWishlistMovieUseCase(userId, movieId);
    result.fold(
      (failure) => emit(ProfileState.error(failure.toString())),
      (profile) => emit(ProfileState.loaded(profile)),
    );
  }
}