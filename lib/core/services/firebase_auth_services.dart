import 'package:firebase_auth/firebase_auth.dart';
import 'package:yummy_home/core/models/user_model.dart';
import 'package:yummy_home/core/services/auth_service.dart';
import 'package:yummy_home/core/services/firebase_service.dart';

class FirebaseAuthServices extends AuthService {
  final FirebaseService _clintService;

  FirebaseAuthServices(this._clintService);

  @override
  Future<UserCredential> signUp(UserModel user) async {
    final response = await _clintService.auth.createUserWithEmailAndPassword(
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
  Future<UserModel?> getCurrentUser() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }

  @override
  Future<void> resetPassword({required String email}) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }
}
