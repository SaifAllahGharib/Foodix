import 'package:dartz/dartz.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:yummy_home/core/errors/failure.dart';
import 'package:yummy_home/core/services/db_services.dart';
import 'package:yummy_home/features/home/data/repos/home/home_repo.dart';

class HomeRepositoryImp extends HomeRepository {
  final DBServices _dbServices;

  HomeRepositoryImp(this._dbServices);

  @override
  Future<Either<Failure, DataSnapshot>> getUser(String uid) async {
    try {
      return right(await _dbServices.getUser(uid));
    } on FirebaseDBFailure catch (e) {
      return left(FirebaseDBFailure(e.toString()));
    } catch (e) {
      return left(FirebaseFailure(e.toString()));
    }
  }
}
