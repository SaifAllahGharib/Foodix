import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:yummy_home/core/errors/failure.dart';
import 'package:yummy_home/core/services/auth_services.dart';
import 'package:yummy_home/core/services/db_services.dart';
import 'package:yummy_home/features/home/data/repos/profile/profile_repo.dart';

class ProfileRepositoryImp extends ProfileRepository {
  final AuthServices _authServices;
  final DBServices _dbServices;

  ProfileRepositoryImp(this._authServices, this._dbServices);

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      return right(await _authServices.signOut());
    } on FirebaseAuthException catch (e) {
      return left(FirebaseAuthFailure(e.code));
    } catch (e) {
      return left(FirebaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateName(String uid, String name) async {
    try {
      return right(await _dbServices.updateName(uid, name));
    } on FirebaseAuthException catch (e) {
      return left(FirebaseAuthFailure(e.code));
    } catch (e) {
      return left(FirebaseFailure(e.toString()));
    }
  }
}
