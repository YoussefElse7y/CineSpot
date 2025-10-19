import 'package:cine_spot/features/auth/domain/entities/user_entity.dart';
import 'package:cine_spot/features/auth/domain/repositories/auth_repository.dart';
import 'package:cine_spot/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:cine_spot/features/auth/domain/usecases/sign_out_usecase.dart';
import 'package:cine_spot/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';


class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignInUseCase signInUseCase;
  final SignUpUseCase signUpUseCase;
  final SignOutUseCase signOutUseCase;
  final AuthRepository authRepository;

  AuthBloc(
    this.signInUseCase,
    this.signUpUseCase,
    this.signOutUseCase,
    this.authRepository,
  ) : super(const AuthState.initial()) {
    on<AuthEvent>((event, emit) async {
      await event.when(
        checkAuthStatus: () => _onCheckAuthStatus(emit),
        signIn: (email, password) => _onSignIn(email, password, emit),
        signUp: (email, password) => _onSignUp(email, password, emit),
        signOut: () => _onSignOut(emit),
      );
    });
  }

  Future<void> _onCheckAuthStatus(Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    final result = await authRepository.getCurrentUser();
    result.fold(
      (failure) => emit(const AuthState.unauthenticated()),
      (user) {
        if (user != null) {
          emit(AuthState.authenticated(user));
        } else {
          emit(const AuthState.unauthenticated());
        }
      },
    );
  }

  Future<void> _onSignIn(
      String email,
      String password,
      Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    final result = await signInUseCase(email, password);
    result.fold(
      (failure) => emit(AuthState.error('Email or password is incorrect')),
      (user) => emit(AuthState.authenticated(user)),
    );
  }

  Future<void> _onSignUp(
      String email,
      String password,
      Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    final result = await signUpUseCase(email, password);
    result.fold(
      (failure) => emit(AuthState.error(failure.toString())),
      (user) => emit(AuthState.authenticated(user)),
    );
  }

  Future<void> _onSignOut(Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    final result = await signOutUseCase();
    result.fold(
      (failure) => emit(AuthState.error(failure.toString())),
      (_) => emit(const AuthState.unauthenticated()),
    );
  }
}
