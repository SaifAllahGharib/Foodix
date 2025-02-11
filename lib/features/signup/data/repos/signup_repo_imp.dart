import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:yummy_home/core/errors/failure.dart';
import 'package:yummy_home/core/services/auth_services.dart';
import 'package:yummy_home/core/services/db_services.dart';
import 'package:yummy_home/core/utils/app_localizations.dart';
import 'package:yummy_home/features/signup/data/models/signup_model.dart';
import 'package:yummy_home/features/signup/data/repos/signup_repo.dart';

class SignupRepositoryImp extends SignupRepository {
  final AuthServices _authService;
  final DBServices _dbServices;

  SignupRepositoryImp(this._authService, this._dbServices);

  @override
  Future<Either<Failure, String>> signup(
    SignupModel user,
    BuildContext context,
  ) async {
    try {
      final response = await _authService.signUp(user);

      if (response.user != null) {
        _dbServices.setUser(user, response.user!.uid);
        return right("success".tr(context));
      } else {
        return right("field".tr(context));
      }
    } on FirebaseAuthException catch (e) {
      return left(FirebaseAuthFailure(e.code));
    } catch (e) {
      return left(FirebaseFailure(e.toString()));
    }
  }
}
