import 'package:firebase_auth/firebase_auth.dart';
import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> signInWithEmail(String email, String password);
  Future<UserModel> signUpWithEmail(String email, String password);
  Future<void> signOut();
  Future<UserModel?> getCurrentUser();
  Stream<UserModel?> get authStateChanges;
  Future<UserModel> signInWithGoogle();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth _firebaseAuth;

  AuthRemoteDataSourceImpl(this._firebaseAuth);

  @override
  Future<UserModel> signInWithEmail(String email, String password) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (credential.user == null) {
        throw Exception('User not found');
      }
      return UserModel.fromFirebaseUser(credential.user!);
    } catch (e) {
      throw Exception('Sign in failed: ${e.toString()}');
    }
  }

  @override
  Future<UserModel> signUpWithEmail(String email, String password) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (credential.user == null) {
        throw Exception('User creation failed');
      }
      return UserModel.fromFirebaseUser(credential.user!);
    } catch (e) {
      throw Exception('Sign up failed: ${e.toString()}');
    }
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  @override
  Future<UserModel?> getCurrentUser() async {
    final user = _firebaseAuth.currentUser;
    return user != null ? UserModel.fromFirebaseUser(user) : null;
  }

  @override
  Stream<UserModel?> get authStateChanges {
    return _firebaseAuth.authStateChanges().map(
      (user) => user != null ? UserModel.fromFirebaseUser(user) : null,
    );
  }

  @override
  Future<UserModel> signInWithGoogle() async {
    try {
      final GoogleAuthProvider googleProvider = GoogleAuthProvider();

      final UserCredential credential = await _firebaseAuth.signInWithProvider(
        googleProvider,
      );

      if (credential.user == null) {
        throw Exception('Google sign in failed');
      }
      return UserModel.fromFirebaseUser(credential.user!);
    } catch (e) {
      throw Exception('Google sign in failed: ${e.toString()}');
    }
  }
}
