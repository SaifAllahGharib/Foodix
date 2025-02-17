import 'package:dartz/dartz.dart';
import 'package:yummy_home/core/errors/failure.dart';
import 'package:yummy_home/core/services/db_services.dart';
import 'package:yummy_home/features/add_food/data/models/food_model.dart';
import 'package:yummy_home/features/add_food/data/repos/add_food_repo.dart';

class AddFoodRepositoryImp extends AddFoodRepository {
  final DBServices _dbServices;

  AddFoodRepositoryImp(this._dbServices);

  @override
  Future<Either<Failure, void>> addFood(
      String uid, String categoryName, FoodModel food) async {
    try {
      return right(await _dbServices.addFood(uid, categoryName, food));
    } catch (e) {
      if (e is FirebaseDBFailure) {
        return left(FirebaseDBFailure(e.errorMsg));
      } else {
        return left(FirebaseFailure(e.toString()));
      }
    }
  }
}
