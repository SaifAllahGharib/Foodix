import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:yummy_home/core/errors/failure.dart';
import 'package:yummy_home/core/models/user_model.dart';
import 'package:yummy_home/core/services/auth_services.dart';
import 'package:yummy_home/core/services/db_services.dart';
import 'package:yummy_home/features/signup/data/models/signup_model.dart';
import 'package:yummy_home/features/signup/data/repos/signup_repo.dart';
import 'package:yummy_home/generated/l10n.dart';

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
        String uid = response.user!.uid;
        UserModel userModel = UserModel(
          uid: uid,
          name: user.name,
          email: user.email,
          phone: user.phone,
          role: user.role,
        );

        try {
          await Future.wait([
            _dbServices.setUser(userModel),
            _dbServices.createRestaurant(userModel.name!),
          ]);
          return right(S.of(context).success);
        } catch (e) {
          return left(FirebaseDBFailure(e.toString()));
        }
      } else {
        return right(S.of(context).field);
      }
    } on FirebaseAuthException catch (e) {
      return left(FirebaseAuthFailure(e.code));
    } catch (e) {
      return left(FirebaseFailure(e.toString()));
    }
  }
}
