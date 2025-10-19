part of 'auth_bloc.dart';

@freezed
 class AuthState with _$AuthState {
  const factory AuthState.initial() = Initial;
  const factory AuthState.loading() = Loading;
  const factory AuthState.authenticated(UserEntity user) = Authenticated;
  const factory AuthState.unauthenticated() = Unauthenticated;
  const factory AuthState.error(String message) = Error;
}