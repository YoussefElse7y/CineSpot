import 'dart:io';
import 'package:cine_spot/features/profile/domain/usecase/add_favorite_movie_usecase.dart';
import 'package:cine_spot/features/profile/domain/usecase/add_wishlist_movie_usecase.dart';
import 'package:cine_spot/features/profile/domain/usecase/check_profile_exists_usecase.dart';
import 'package:cine_spot/features/profile/domain/usecase/create_profile_usecase.dart';
import 'package:cine_spot/features/profile/domain/usecase/get_profile_usecase.dart';
import 'package:cine_spot/features/profile/domain/usecase/remove_favorite_movie_usecase.dart';
import 'package:cine_spot/features/profile/domain/usecase/remove_wishlist_movie_usecase.dart';
import 'package:cine_spot/features/profile/domain/usecase/update_profile_usecase.dart';

// Add new imports for TV Show & Person use cases
import 'package:cine_spot/features/profile/domain/usecase/add_favorite_tv_show_usecase.dart';
import 'package:cine_spot/features/profile/domain/usecase/remove_favorite_tv_show_usecase.dart';
import 'package:cine_spot/features/profile/domain/usecase/add_wishlist_tv_show_usecase.dart';
import 'package:cine_spot/features/profile/domain/usecase/remove_wishlist_tv_show_usecase.dart';
import 'package:cine_spot/features/profile/domain/usecase/add_favorite_person_usecase.dart';
import 'package:cine_spot/features/profile/domain/usecase/remove_favorite_person_usecase.dart';

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

  // New use cases
  final AddFavoriteTvShowUseCase addFavoriteTvShowUseCase;
  final RemoveFavoriteTvShowUseCase removeFavoriteTvShowUseCase;
  final AddWishlistTvShowUseCase addWishlistTvShowUseCase;
  final RemoveWishlistTvShowUseCase removeWishlistTvShowUseCase;
  final AddFavoritePersonUseCase addFavoritePersonUseCase;
  final RemoveFavoritePersonUseCase removeFavoritePersonUseCase;

  ProfileBloc({
    required this.createProfileUseCase,
    required this.updateProfileUseCase,
    required this.getProfileUseCase,
    required this.checkProfileExistsUseCase,
    required this.addFavoriteMovieUseCase,
    required this.removeFavoriteMovieUseCase,
    required this.addWishlistMovieUseCase,
    required this.removeWishlistMovieUseCase,
    required this.addFavoriteTvShowUseCase,
    required this.removeFavoriteTvShowUseCase,
    required this.addWishlistTvShowUseCase,
    required this.removeWishlistTvShowUseCase,
    required this.addFavoritePersonUseCase,
    required this.removeFavoritePersonUseCase,
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

        // ✅ NEW EVENTS BELOW
        addFavoriteTvShow: (userId, tvShowId) =>
            _onAddFavoriteTvShow(userId, tvShowId, emit),
        removeFavoriteTvShow: (userId, tvShowId) =>
            _onRemoveFavoriteTvShow(userId, tvShowId, emit),
        addFavoritePreson: (userId, personId) =>
            _onAddFavoritePerson(userId, personId, emit),
        removeFavoritePreson: (userId, personId) =>
            _onRemoveFavoritePerson(userId, personId, emit),
        addWishlistTvShow: (userId, tvShowId) =>
            _onAddWishlistTvShow(userId, tvShowId, emit),
        removeWishlistTvShow: (userId, tvShowId) =>
            _onRemoveWishlistTvShow(userId, tvShowId, emit),
      );
    });
  }

  // ---------- Existing Methods ----------
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

  Future<void> _onLoadProfile(String userId, Emitter<ProfileState> emit) async {
    emit(const ProfileState.loading());
    final result = await getProfileUseCase(userId);
    result.fold(
      (failure) => emit(ProfileState.error(failure.toString())),
      (profile) => profile != null
          ? emit(ProfileState.loaded(profile))
          : emit(const ProfileState.notFound()),
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

  // ---------- Movie Methods ----------
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

  // ---------- ✅ NEW METHODS ----------
  Future<void> _onAddFavoriteTvShow(
    String userId,
    int tvShowId,
    Emitter<ProfileState> emit,
  ) async {
    final result = await addFavoriteTvShowUseCase(userId, tvShowId);
    result.fold(
      (failure) => emit(ProfileState.error(failure.toString())),
      (profile) => emit(ProfileState.loaded(profile)),
    );
  }

  Future<void> _onRemoveFavoriteTvShow(
    String userId,
    int tvShowId,
    Emitter<ProfileState> emit,
  ) async {
    final result = await removeFavoriteTvShowUseCase(userId, tvShowId);
    result.fold(
      (failure) => emit(ProfileState.error(failure.toString())),
      (profile) => emit(ProfileState.loaded(profile)),
    );
  }

  Future<void> _onAddFavoritePerson(
    String userId,
    int personId,
    Emitter<ProfileState> emit,
  ) async {
    final result = await addFavoritePersonUseCase(userId, personId);
    result.fold(
      (failure) => emit(ProfileState.error(failure.toString())),
      (profile) => emit(ProfileState.loaded(profile)),
    );
  }

  Future<void> _onRemoveFavoritePerson(
    String userId,
    int personId,
    Emitter<ProfileState> emit,
  ) async {
    final result = await removeFavoritePersonUseCase(userId, personId);
    result.fold(
      (failure) => emit(ProfileState.error(failure.toString())),
      (profile) => emit(ProfileState.loaded(profile)),
    );
  }

  Future<void> _onAddWishlistTvShow(
    String userId,
    int tvShowId,
    Emitter<ProfileState> emit,
  ) async {
    final result = await addWishlistTvShowUseCase(userId, tvShowId);
    result.fold(
      (failure) => emit(ProfileState.error(failure.toString())),
      (profile) => emit(ProfileState.loaded(profile)),
    );
  }

  Future<void> _onRemoveWishlistTvShow(
    String userId,
    int tvShowId,
    Emitter<ProfileState> emit,
  ) async {
    final result = await removeWishlistTvShowUseCase(userId, tvShowId);
    result.fold(
      (failure) => emit(ProfileState.error(failure.toString())),
      (profile) => emit(ProfileState.loaded(profile)),
    );
  }
}
