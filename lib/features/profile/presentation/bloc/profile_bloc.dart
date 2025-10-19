import 'dart:io';
import 'package:cine_spot/features/profile/domain/usecase/check_profile_exists_usecase.dart';
import 'package:cine_spot/features/profile/domain/usecase/create_profile_usecase.dart';
import 'package:cine_spot/features/profile/domain/usecase/get_profile_usecase.dart';
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

  ProfileBloc({
    required this.createProfileUseCase,
    required this.updateProfileUseCase,
    required this.getProfileUseCase,
    required this.checkProfileExistsUseCase,
  }) : super(const ProfileState.initial()) {
    on<ProfileEvent>((event, emit) async {
      await event.when(
        createProfile: (profile, imageFile) =>
            _onCreateProfile(profile, imageFile, emit),
        updateProfile: (profile, imageFile) =>
            _onUpdateProfile(profile, imageFile, emit),
        loadProfile: (userId) => _onLoadProfile(userId, emit),
        checkProfileExists: (userId) => _onCheckProfileExists(userId, emit),
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
}