import 'package:firebase_auth/firebase_auth.dart';
import 'package:yummy_home/core/models/user_model.dart';
import 'package:yummy_home/core/services/auth_services.dart';
import 'package:yummy_home/core/services/firebase_service.dart';

class FirebaseAuthServices extends AuthServices {
  final FirebaseService _firebaseService;

  FirebaseAuthServices(this._firebaseService);

  @override
  Future<UserCredential> signUp(UserModel user) async {
    final response = await _firebaseService.auth.createUserWithEmailAndPassword(
      email: user.email!,
      password: user.password!,
    );

    return response;
  }

  @override
  Future<UserModel?> login(UserModel user) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<void> resetPassword({required String email}) async {}

  @override
  Future<void> signOut() async {}

  @override
  Future<void> sendEmailVerification() async {
    var user = _firebaseService.auth.currentUser;
    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
    }
  }

  @override
  Future<bool> isEmailVerified() async {
    var user = _firebaseService.auth.currentUser;
    await user?.reload();
    return user?.emailVerified ?? false;
  }
}
