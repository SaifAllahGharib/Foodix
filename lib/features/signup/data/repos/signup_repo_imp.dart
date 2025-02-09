import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:yummy_home/core/errors/failure.dart';
import 'package:yummy_home/core/models/user_model.dart';
import 'package:yummy_home/core/services/auth_service.dart';
import 'package:yummy_home/features/signup/data/repos/signup_repo.dart';

class SignupRepositoryImp extends SignupRepository {
  final FirebaseDatabase _reference = FirebaseDatabase.instance;
  final AuthService _authService;

  SignupRepositoryImp(this._authService);

  @override
  Future<Either<Failure, String>> signup(UserModel user) async {
    try {
      final response = await _authService.signUp(user);

      if (response.user != null) {
        String uid = response.user!.uid;
        DatabaseReference dbRef = _reference.ref().child("users").child(uid);

        await dbRef.set(user.toJson());

        return right("Signup successfully");
      } else {
        return right("Signup field");
      }
    } on FirebaseAuthException catch (e) {
      return left(FirebaseAuthFailure(e.code));
    } catch (e) {
      return left(FirebaseFailure(e.toString()));
    }
  }
}
