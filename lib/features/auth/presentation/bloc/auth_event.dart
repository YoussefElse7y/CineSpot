part of 'auth_bloc.dart';


@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.checkAuthStatus() = CheckAuthStatus;
  const factory AuthEvent.signIn(String email, String password) = SignIn;
  const factory AuthEvent.signUp(String email, String password) = SignUp;
  const factory AuthEvent.signInWithGoogle() = SignInWithGoogle;

  const factory AuthEvent.signOut() = SignOut;
}