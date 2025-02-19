import 'package:dartz/dartz.dart';
import 'package:yummy_home/core/errors/failure.dart';
import 'package:yummy_home/core/services/db_services.dart';
import 'package:yummy_home/features/home/data/repos/main_buyer/main_buyer_repo.dart';

class MainBuyerRepositoryImp extends MainBuyerRepository {
  final DBServices _dbServices;

  MainBuyerRepositoryImp(this._dbServices);

  @override
  Stream<Either<Failure, dynamic>> getRestaurants() {
    return _dbServices.getRestaurants().map((snapshot) {
      try {
        return right(snapshot);
      } catch (e) {
        if (e is FirebaseDBFailure) {
          return left(e);
        } else {
          return left(FirebaseFailure(e.toString()));
        }
      }
    });
  }
}
