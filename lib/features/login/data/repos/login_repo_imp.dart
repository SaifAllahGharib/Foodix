import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:yummy_home/core/errors/failure.dart';
import 'package:yummy_home/core/services/auth_services.dart';
import 'package:yummy_home/features/login/data/models/login_model.dart';
import 'package:yummy_home/features/login/data/repos/login_repo.dart';
import 'package:yummy_home/generated/l10n.dart';

class LoginRepositoryImp implements LoginRepository {
  final AuthServices _authServices;

  LoginRepositoryImp(this._authServices);

  @override
  Future<Either<Failure, String>> login(
      LoginModel user, BuildContext context) async {
    try {
      final response = await _authServices.login(user);

      if (response.user != null) {
        return right(S.of(context).success);
      } else {
        return right("field");
      }
    } on FirebaseAuthException catch (e) {
      return left(FirebaseAuthFailure(e.code));
    } catch (e) {
      return left(FirebaseFailure(e.toString()));
    }
  }
}
