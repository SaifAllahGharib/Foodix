import 'package:firebase_auth/firebase_auth.dart';
import 'package:yummy_home/core/models/user_model.dart';

abstract class AuthServices {
  Future<UserCredential> signUp(UserModel user);

  Future<UserModel?> login(UserModel user);

  Future<void> signOut();

  Future<void> sendEmailVerification();

  Future<bool> isEmailVerified();

  Future<void> resetPassword({required String email});
}
