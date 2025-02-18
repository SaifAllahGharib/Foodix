import 'package:dartz/dartz.dart';
import 'package:yummy_home/core/errors/failure.dart';
import 'package:yummy_home/core/models/ProductModel.dart';
import 'package:yummy_home/core/services/db_services.dart';
import 'package:yummy_home/features/home/data/repos/main_seller/main_seller_repo.dart';

class MainSellerRepositoryImp extends MainSellerRepository {
  final DBServices _dbServices;

  MainSellerRepositoryImp(this._dbServices);

  @override
  Future<Either<Failure, void>> addCategory(ProductModel product) async {
    try {
      return right(await _dbServices.addCategory(product));
    } catch (e) {
      if (e is FirebaseDBFailure) {
        return left(FirebaseDBFailure(e.errorMsg));
      } else {
        return left(FirebaseFailure(e.toString()));
      }
    }
  }

  @override
  Stream<Either<Failure, dynamic>> getCategories() {
    return _dbServices.getCategories().map(
      (snapshot) {
        try {
          return right(snapshot);
        } catch (e) {
          return left(FirebaseDBFailure(
              e is FirebaseDBFailure ? e.errorMsg : e.toString()));
        }
      },
    );
  }
}
