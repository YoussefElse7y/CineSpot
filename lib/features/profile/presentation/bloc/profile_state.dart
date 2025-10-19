part of 'profile_bloc.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = Initial;
  const factory ProfileState.loading() = Loading;
  const factory ProfileState.loaded(ProfileEntity profile) = Loaded;
  const factory ProfileState.notFound() = NotFound;
  const factory ProfileState.error(String message) = Error;
}