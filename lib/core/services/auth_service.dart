import 'package:firebase_auth/firebase_auth.dart';
import 'package:yummy_home/core/models/user_model.dart';

abstract class AuthService {
  Future<UserCredential> signUp(UserModel user);

  Future<UserModel?> login(UserModel user);

  Future<UserModel?> getCurrentUser();

  Future<void> signOut();

  Future<void> resetPassword({required String email});
}
