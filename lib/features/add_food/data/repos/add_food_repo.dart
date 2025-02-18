import 'package:dartz/dartz.dart';
import 'package:yummy_home/core/errors/failure.dart';
import 'package:yummy_home/core/models/food_model.dart';

abstract class AddFoodRepository {
  Future<Either<Failure, void>> addFood(
    String categoryName,
    FoodModel food,
  );
}
