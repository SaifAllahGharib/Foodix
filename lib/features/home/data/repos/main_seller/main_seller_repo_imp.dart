import 'package:dartz/dartz.dart';
import 'package:yummy_home/core/errors/failure.dart';
import 'package:yummy_home/core/services/db_services.dart';
import 'package:yummy_home/features/home/data/repos/main_seller/main_seller_repo.dart';

class MainSellerRepositoryImp extends MainSellerRepository {
  final DBServices _dbServices;

  MainSellerRepositoryImp(this._dbServices);

  @override
  Future<Either<Failure, void>> addCategory(
      String uid, String categoryName) async {
    try {
      return right(await _dbServices.addCategory(uid, categoryName));
    } catch (e) {
      if (e is FirebaseDBFailure) {
        return left(FirebaseDBFailure(e.errorMsg));
      } else {
        return left(FirebaseFailure(e.toString()));
      }
    }
  }
}
